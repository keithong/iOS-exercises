//
//  MVCMainViewController.m
//  ModelViewController
//
//  Created by Keith Samson on 6/25/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "MVCMainViewController.h"
#import "MVCLevelViewController.h"

@implementation MVCMainViewController
@synthesize mainArray, letterDictionary, colorDictionary, foodDictionary, thumbs;
-(instancetype)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    self.title = @"Main View Controller";
    if(self){
        mainArray = [[NSMutableArray alloc]init];
        thumbs = [[NSMutableArray alloc]init];
        
        /*
        letterDictionary = [NSMutableDictionary dictionaryWithObject:@"Letter" forKey:@"Title"];
        colorDictionary = [NSMutableDictionary dictionaryWithObject:@"Color" forKey:@"Title"];
        foodDictionary = [NSMutableDictionary dictionaryWithObject:@"Food" forKey:@"Title"];
        [mainArray addObject:letterDictionary];
        [mainArray addObject:colorDictionary];
        [mainArray addObject:foodDictionary];
         */        

        [mainArray addObject:[NSDictionary dictionaryWithObject:@"Letter" forKey:@"Title"]];
        [mainArray addObject:[NSDictionary dictionaryWithObject:@"Color" forKey:@"Title"]];
        [mainArray addObject:[NSDictionary dictionaryWithObject:@"Food" forKey:@"Title"]];
        
        [thumbs addObject:@"alphabet.jpg"];
        [thumbs addObject:@"color.jpg"];
        [thumbs addObject:@"food.png"];

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
    return [mainArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:@"UITableViewCell"
                             forIndexPath:indexPath];
    
    
    
    NSDictionary *cellIdentifier = [mainArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[cellIdentifier objectForKey:@"Title"]];
    cell.imageView.image = [UIImage imageNamed:[thumbs objectAtIndex:indexPath.row]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MVCLevelViewController *lvc = [[MVCLevelViewController alloc] init];
    NSDictionary *titleIdentifier = [mainArray objectAtIndex:indexPath.row];
    
    // Set the category of the items in the level view
    // depending on the selected title in the main view
    lvc.category = [NSString stringWithFormat:@"%@", [titleIdentifier objectForKey:@"Title"]];
    [self.navigationController pushViewController:lvc animated:YES];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

@end
