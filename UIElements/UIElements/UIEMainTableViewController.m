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


@implementation UIEMainTableViewController

@synthesize array;

-(instancetype)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    
    if (self) {
        array = [[NSMutableArray alloc] init];
        
        //Button
        UIEButtonViewController *bvc = [[UIEButtonViewController alloc] init];
        UIEControlViewController *cvc = [[UIEControlViewController alloc] init];
        UIETextViewController *tvc = [[UIETextViewController alloc] init];
        UIEPickerViewController *pvc = [[UIEPickerViewController alloc] init];
        UIEImagesViewController *ivc = [[UIEImagesViewController alloc] init];
        
//        [array addObject:[NSDictionary dictionaryWithObject:bvc forKey:@"title"]];
//        [array addObject:[NSDictionary dictionaryWithObject:cvc forKey:@"title"]];
//        [array addObject:[NSDictionary dictionaryWithObject:tvc forKey:@"title"]];
//        [array addObject:[NSDictionary dictionaryWithObject:pvc forKey:@"title"]];
//        [array addObject:[NSDictionary dictionaryWithObject:ivc forKey:@"title"]];
        
//        [array addObject:[NSDictionary dictionaryWithObjectsAndKeys:bvc, @"title",
//                          @"UIEButtonViewController", @"label",
//                          nil]];
        [array addObject:[NSDictionary dictionaryWithObjectsAndKeys:NSStringFromClass([bvc class]), @"title", nil]];
        [array addObject:[NSDictionary dictionaryWithObjectsAndKeys:NSStringFromClass([cvc class]), @"title", nil]];
        [array addObject:[NSDictionary dictionaryWithObjectsAndKeys:NSStringFromClass([tvc class]), @"title", nil]];
        [array addObject:[NSDictionary dictionaryWithObjectsAndKeys:NSStringFromClass([pvc class]), @"title", nil]];
        [array addObject:[NSDictionary dictionaryWithObjectsAndKeys:NSStringFromClass([ivc class]), @"title",nil]];
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
    UITableViewCell *cell = [[UITableViewCell alloc]
                             initWithStyle:UITableViewCellStyleDefault
                             reuseIdentifier:@"UITableViewCell"];
    
    NSDictionary *dictionary = [array objectAtIndex:indexPath.row];
    NSLog(@"dictionary: %@", [dictionary objectForKey:@"title"]);
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [dictionary objectForKey:@"title"]];
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Selected : %i", indexPath.row);
    NSDictionary *dictionary = [array objectAtIndex:indexPath.row];
    UIViewController *viewController = [[UIViewController alloc]
                                        initWithNibName:[NSString stringWithFormat:@"%@", [dictionary objectForKey:@"title"]]
                                    bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
