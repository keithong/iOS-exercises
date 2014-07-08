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
#import "UIEBlocksViewController.h"
#import "UIECoreLocationViewController.h"
#import "UIEMapViewController.h"
#import "UIEAccelerometerViewController.h"
#import "UIEAudioViewController.h"
#import "UIECustomFontViewController.h"
#import "UIEAnimationViewController.h"


@interface UIEMainTableViewController()
@property (retain, nonatomic) NSMutableArray *array;
@property (retain, nonatomic) NSMutableArray *objectArray;
@end

@implementation UIEMainTableViewController

-(instancetype)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    self.title = @"UIElements";
    
    if (self) {
        self.array = [[NSMutableArray alloc] init];
        
        // Create an object for every view controller
        UIEButtonViewController *btnVC = [UIEButtonViewController alloc];
        UIEControlViewController *ctrlVC = [UIEControlViewController alloc];
        UIETextViewController *txtVC = [UIETextViewController alloc];
        UIEPickerViewController *pckrVC = [UIEPickerViewController alloc];
        UIEImagesViewController *imgsVC = [UIEImagesViewController alloc];
        UIESegmentViewController *sgmntVC = [UIESegmentViewController alloc];
        UIEToolbarViewController *tlbrVC =[UIEToolbarViewController alloc];
        UIETabBarViewController *tabVC = [UIETabBarViewController alloc];
        UIEAlertViewController *alrtVC = [UIEAlertViewController alloc];
        UIEActionSheetViewController *actnVC = [UIEActionSheetViewController alloc];
        UIEGameScreenViewController *gmScrnVC = [UIEGameScreenViewController alloc];
        UIEWebViewController *wbVC = [UIEWebViewController alloc];
        UIEBlocksViewController *blcksVC = [UIEBlocksViewController alloc];
        UIECoreLocationViewController *crLctnVC = [UIECoreLocationViewController alloc];
        UIEMapViewController *mpVC = [UIEMapViewController alloc];
        UIEAccelerometerViewController *accVC = [UIEAccelerometerViewController alloc];
        UIEAudioViewController *audVC = [UIEAudioViewController alloc];
        UIECustomFontViewController *cstmFntVC = [UIECustomFontViewController alloc];
        UIEAnimationViewController *anmtnVC = [UIEAnimationViewController alloc];
        
        // Create a storage for each objects of the classes
        self.objectArray = [NSMutableArray arrayWithObjects:btnVC,ctrlVC,txtVC,pckrVC,imgsVC,sgmntVC,tlbrVC,tabVC,alrtVC,actnVC,
                            gmScrnVC,wbVC,blcksVC,crLctnVC,mpVC,accVC,audVC,cstmFntVC,anmtnVC, nil];
        
        // Push the objects inside the array as a dictionary with "title" as key and their class name as value
        for (int i = 0; i < [self.objectArray count]; i++){
            [self.array addObject:[NSDictionary
                                   dictionaryWithObjectsAndKeys:NSStringFromClass([[self.objectArray objectAtIndex:i] class]), @"title", nil]];
        }
        
    }
    return self;
}

-(instancetype)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.array count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    NSDictionary *dictionary = [self.array objectAtIndex:indexPath.row];
    
    // Use the class' title as cell label
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [dictionary objectForKey:@"title"]];
    
    return cell;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dictionary = [self.array objectAtIndex:indexPath.row];
    
    // Do not use UIViewController class because it throws an exception
    // Get the class of the selected cell and use that to load your next view controller
    Class ClassPicker = NSClassFromString([NSString stringWithFormat:@"%@", [dictionary objectForKey:@"title"]]);
    
    id viewController  = [[ClassPicker alloc]
                          initWithNibName:[NSString stringWithFormat:@"%@", [dictionary objectForKey:@"title"]] bundle:[NSBundle mainBundle]];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
