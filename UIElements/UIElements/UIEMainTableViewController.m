//
//  UIEMainTableViewController.m
//  UIElements
//
//  Created by Keith Samson on 6/23/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "UIEMainTableViewController.h"
#import "UIEButtonViewController.h"
#import "UIEControlViewController.h"
#import "UIETextViewController.h"
#import "UIEPickerViewController.h"
#import "UIEImagesViewController.h"
#import "UIESegmentViewController.h"
#import "UIEToolbarViewController.h"
#import "UIETabBarViewController.h"
#import "UIEAlertViewController.h"
#import "UIEActionSheetViewController.h"
#import "UIEGameScreenViewController.h"
#import "UIEWebViewController.h"


@implementation UIEMainTableViewController

@synthesize array;

-(instancetype)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    self.title = @"UIElements";
    
    if (self) {
        array = [[NSMutableArray alloc] init];
        
        // Create an object for every view controller
//        UIEButtonViewController *btnVC = [[UIEButtonViewController alloc] initWithNibName:@"UIEButtonViewController" bundle:nil];
        UIEButtonViewController *btnVC = [[UIEButtonViewController alloc]init];
        UIEControlViewController *ctrlVC = [[UIEControlViewController alloc] init];
        UIETextViewController *txtVC = [[UIETextViewController alloc] init];
        UIEPickerViewController *pckrVC = [[UIEPickerViewController alloc] init];
        UIEImagesViewController *imgsVC = [[UIEImagesViewController alloc] init];
        UIESegmentViewController *sgmntVC = [[UIESegmentViewController alloc] init];
        UIEToolbarViewController *tlbrVC =[[UIEToolbarViewController alloc] init];
        UIETabBarViewController *tabVC = [[UIETabBarViewController alloc] init];
        UIEAlertViewController *alrtVC = [[UIEAlertViewController alloc] init];
        UIEActionSheetViewController *actnVC = [[UIEActionSheetViewController alloc] init];
        UIEGameScreenViewController *gmScrnVC = [[UIEGameScreenViewController alloc] init];
        UIEWebViewController *wbVC = [[UIEWebViewController alloc]init];
//        [array addObject:[NSDictionary dictionaryWithObject:btnVC forKey:@"title"]];
        
        [array addObject:[NSDictionary dictionaryWithObjectsAndKeys:NSStringFromClass([btnVC class]), @"title", nil]];
        [array addObject:[NSDictionary dictionaryWithObjectsAndKeys:NSStringFromClass([ctrlVC class]), @"title", nil]];
        [array addObject:[NSDictionary dictionaryWithObjectsAndKeys:NSStringFromClass([txtVC class]), @"title", nil]];
        [array addObject:[NSDictionary dictionaryWithObjectsAndKeys:NSStringFromClass([pckrVC class]), @"title", nil]];
        [array addObject:[NSDictionary dictionaryWithObjectsAndKeys:NSStringFromClass([imgsVC class]), @"title",nil]];
        [array addObject:[NSDictionary dictionaryWithObjectsAndKeys:NSStringFromClass([sgmntVC class]), @"title",nil]];
        [array addObject:[NSDictionary dictionaryWithObjectsAndKeys:NSStringFromClass([tlbrVC class]), @"title",nil]];
        [array addObject:[NSDictionary dictionaryWithObjectsAndKeys:NSStringFromClass([tabVC class]), @"title",nil]];
        [array addObject:[NSDictionary dictionaryWithObjectsAndKeys:NSStringFromClass([alrtVC class]), @"title",nil]];
        [array addObject:[NSDictionary dictionaryWithObjectsAndKeys:NSStringFromClass([actnVC class]), @"title",nil]];
        [array addObject:[NSDictionary dictionaryWithObjectsAndKeys:NSStringFromClass([gmScrnVC class]), @"title",nil]];
        [array addObject:[NSDictionary dictionaryWithObjectsAndKeys:NSStringFromClass([wbVC class]), @"title",nil]];
        
    }
    return self;
}

-(instancetype)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section
{
    return [array count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView
cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:@"UITableViewCell"
                             forIndexPath:indexPath];
    
    NSDictionary *dictionary = [array objectAtIndex:indexPath.row];
//    NSLog(@"dictionary: %@", [dictionary objectForKey:@"title"]);
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [dictionary objectForKey:@"title"]];
    
    
    return cell;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Selected : %i", indexPath.row);
    NSDictionary *dictionary = [array objectAtIndex:indexPath.row];
    
    // Do not use UIViewController class because it throws an exception
    // Get the class of the selected cell and use that
    Class classPicker = NSClassFromString([NSString stringWithFormat:@"%@", [dictionary objectForKey:@"title"]]);
    
    id viewController  = [[classPicker alloc]
                           initWithNibName:[NSString stringWithFormat:@"%@", [dictionary objectForKey:@"title"]]
                           bundle:[NSBundle mainBundle]];
    NSLog(@"%@", [dictionary objectForKey:@"title"]);
    
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
