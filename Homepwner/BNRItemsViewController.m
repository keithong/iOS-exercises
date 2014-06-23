//
//  BNRItemsViewController.m
//  Homepwner
//
//  Created by Keith Samson on 6/17/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "BNRItemsViewController.h"

#import "BNRDetailViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"
#import "BNRItemCell.h"
#import "BNRImageStore.h"
#import "BNRImageViewController.h"

@interface BNRItemsViewController() <UIPopoverControllerDelegate, UIDataSourceModelAssociation>

@property (strong, nonatomic)UIPopoverController *imagePopover;

// Remove the declaration of headerView because we have a Nav Bar now
// @property (nonatomic, strong) IBOutlet UIView *headerView;

@end

@implementation BNRItemsViewController

+(UIViewController *)viewControllerWithRestorationIdentifierPath:(NSArray *)path coder:(NSCoder *)coder
{
    return [[self alloc] init];
}

-(instancetype)init
{
    // Call the superclass's designated initializer
    self = [super initWithStyle:UITableViewStylePlain];
    
    if(self){
        UINavigationItem *navItem = self.navigationItem;
        navItem.title = @"Homepwner";
        
        self.restorationIdentifier = NSStringFromClass([self class]);
        self.restorationClass = [self class];
        
        // Create a new bar button item that will send
        // addNewItem: to BNRItemsViewController
        UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(addNewitem:)];
        
        // Set this bar button item as the right item in the navigaitonItem
        navItem.rightBarButtonItem = bbi;
        
        navItem.leftBarButtonItem = self.editButtonItem;
        
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        [nc addObserver:self selector:@selector(updateTableViewForDynamicTypeSize) name:UIContentSizeCategoryDidChangeNotification object:nil];
        
        // Register for locale change notifications
        [nc addObserver:self
               selector:@selector(localeChanged:)
                   name:NSCurrentLocaleDidChangeNotification
                 object:nil];
    }
    
    return self;
}

-(instancetype)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[BNRItemStore sharedStore]allItems]count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Get a new or recycled cell
    BNRItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BNRItemCell" forIndexPath:indexPath];
    
    // Set the text on the cell with the description of the item
    // that is at the nth index of items, where n = row this cell
    // will appear in on the tableview
    NSArray *items = [[BNRItemStore sharedStore] allItems];
    BNRItem *item = items[indexPath.row];
    
    // Configure the cell with the BNRItem
    cell.nameLabel.text = item.itemName;
    cell.serialLabel.text = item.serialNumber;
    // Create a number formatter for currency
    static NSNumberFormatter *currencyFormatter = nil;
    if(currencyFormatter == nil){
        currencyFormatter = [[NSNumberFormatter alloc] init];
        currencyFormatter.numberStyle = NSNumberFormatterCurrencyStyle;
        
    }
    cell.valueLabel.text = [currencyFormatter stringFromNumber:@(item.valueInDollars)];
    
    cell.thumbnailView.image = item.thumbnail;
    
    __weak BNRItemCell *weakCell = cell;
    
    cell.actionBlock = ^{
        NSLog(@"Going to show image for%@", item);
        
        BNRItemCell *strongCell = weakCell;
        
        if([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad){
            NSString *itemKey = item.itemKey;
            
            // If there is no image, we don't need to display anything
            UIImage *img = [[BNRImageStore sharedStore] imageforKey:itemKey];
            if (!img){
                return;
            }
            
            // Make a rectangle for the frame of the thumbnail relative to our table view
            
            CGRect rect =[self.view convertRect:strongCell.thumbnailView.bounds fromView:strongCell.thumbnailView];
            
            // Create a new BNRImageViewController and set its image
            BNRImageViewController *ivc = [[BNRImageViewController alloc] init];
            ivc.image = img;
            
            // Present a 600x600 popover from the rect
            self.imagePopover = [[UIPopoverController alloc] initWithContentViewController:ivc];
            
            self.imagePopover.delegate = self;
            self.imagePopover.popoverContentSize = CGSizeMake(600, 600);
            [self.imagePopover presentPopoverFromRect:rect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
            
        }
    };
    return cell;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    // Load the NIB file
    UINib *nib = [UINib nibWithNibName:@"BNRItemCell" bundle:nil];
    
    // Register this NIB, which contains the cell
    [self.tableView registerNib:nib forCellReuseIdentifier:@"BNRItemCell"];
    
    self.tableView.restorationIdentifier = @"BNRItemsViewControllerTableView";
    
    /*
     -- WE WANT TO REPLACE THE HEADER VIEW WITH THE NAVBAR --
     UIView *header = self.headerView;
     [self.tableView setTableHeaderView:header];
     
     */
    
}

-(IBAction)addNewitem:(id)sender
{
    
    // Create a new BNRItem and add it to the store
    BNRItem *newItem = [[BNRItemStore sharedStore]createItem];
    
    BNRDetailViewController *detailViewController = [[BNRDetailViewController alloc] initForNewItem:YES];
    
    detailViewController.item = newItem;
    
    detailViewController.dismissBlock = ^{[self.tableView reloadData];};
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:detailViewController];
    
    navController.restorationIdentifier = NSStringFromClass([navController class]);
    
    navController.modalPresentationStyle = UIModalPresentationFormSheet;
    
    [self presentViewController:navController animated:YES
                     completion:NULL];
    
}

/*
 
 ----THIS CODE BLOCK HAS BEEN REPLACED BY THE NAVBAR FUNCTIONALITIES----
 
 
 -(IBAction)toggleEditingMode:(id)sender
 {
 // If you are currently in editing mode:
 if(self.isEditing){
 // Change text of button to inform user of state
 [sender setTitle:@"Edit" forState:UIControlStateNormal];
 
 // Turn off editing mode
 [self setEditing:NO animated:YES];
 } else {
 // Change text of button to inform user of state
 [sender setTitle:@"Done" forState:UIControlStateNormal];
 
 // Enter editing mode
 [self setEditing:YES animated:YES];
 }
 }
 
 -(UIView *)headerView
 {
 // If you have not loaded the headerView yet..
 if(!_headerView){
 // Load the HeaderView.xib
 [[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:nil];
 }
 return _headerView;
 }
 
 ------END-----
 */

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // If the table view is asking to commit a delete command:
    if(editingStyle == UITableViewCellEditingStyleDelete) {
        
        NSArray *items = [[BNRItemStore sharedStore] allItems];
        BNRItem *item = items[indexPath.row];
        [[BNRItemStore sharedStore] removeItem:item];
        
        // Also remove that row from the table view with an animation
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }
    
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [[BNRItemStore sharedStore] moveItemAtindex:sourceIndexPath.row toIndex:destinationIndexPath.row];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BNRDetailViewController *detailViewController = [[BNRDetailViewController alloc]initForNewItem:NO];
    
    NSArray *items = [[BNRItemStore sharedStore] allItems];
    BNRItem *selectedItem = items[indexPath.row];
    
    // Give detail view controller a pointer to the item object in row
    detailViewController.item = selectedItem;
    
    // Push it into the top of the navigation controller's stack
    [self.navigationController pushViewController:detailViewController animated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
    
    [self updateTableViewForDynamicTypeSize];
}

-(void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    self.imagePopover = nil;
}

-(void)updateTableViewForDynamicTypeSize
{
    static NSDictionary *cellHeightDictionary;
    if (!cellHeightDictionary){
        cellHeightDictionary = @{
                                 UIContentSizeCategoryExtraSmall : @44,
                                 UIContentSizeCategorySmall: @44,
                                 UIContentSizeCategoryMedium: @44,
                                 UIContentSizeCategoryLarge: @44,
                                 UIContentSizeCategoryExtraLarge: @55,
                                 UIContentSizeCategoryExtraExtraLarge: @65,
                                 UIContentSizeCategoryExtraExtraExtraLarge: @75
                                 };
    }
    
    NSString *userSize = [[UIApplication sharedApplication] preferredContentSizeCategory];
    
    NSNumber *cellHeight = cellHeightDictionary[userSize];
    [self.tableView setRowHeight:cellHeight.floatValue];
    [self.tableView reloadData];
    
}

-(void)dealloc
{
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc removeObserver:self];
}

-(void)encodeRestorableStateWithCoder:(NSCoder *)coder
{
    [coder encodeBool:self.isEditing forKey:@"TableViewIsEditing"];
    [super encodeRestorableStateWithCoder:coder];
}

-(void)decodeRestorableStateWithCoder:(NSCoder *)coder
{
    self.editing = [coder decodeBoolForKey:@"TableViewIsEditing"];
    
    [super decodeRestorableStateWithCoder:coder];
}

-(NSString *)modelIdentifierForElementAtIndexPath:(NSIndexPath *)path inView:(UIView *)view
{
    NSString *identifier = nil;
    
    if(path && view){
        // Return an identifier of the given NSIndexPath,
        // in case next time the data source changes
        BNRItem *item = [[BNRItemStore sharedStore] allItems][path.row];
        identifier = item.itemKey;
    }
    return identifier;
}

-(NSIndexPath *)indexPathForElementWithModelIdentifier:(NSString *)identifier inView:(UIView *)view
{
    NSIndexPath *indexPath = nil;
    
    if(identifier && view){
        NSArray *items = [[BNRItemStore sharedStore] allItems];
        for(BNRItem *item in items){
            if([identifier isEqualToString:item.itemKey]){
                int row = [items indexOfObjectIdenticalTo:item];
                indexPath = [NSIndexPath indexPathForItem:row inSection:0];
                break;
            }
        }
    }
    return indexPath;
}

-(void)localeChanged:(NSNotification *)note
{
    [self.tableView reloadData];
}

@end
