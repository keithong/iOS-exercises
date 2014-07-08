//
//  MVCMainViewController.m
//  ModelViewController
//
//  Created by Keith Samson on 6/25/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "MVCMainViewController.h"
#import "MVCLevelViewController.h"
@interface MVCMainViewController()
@property (retain, nonatomic) NSMutableArray *categoriesArray;
@property (retain, nonatomic) NSMutableArray *imageThumbnails;
@end

@implementation MVCMainViewController

-(instancetype)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    self.title = @"Main View Controller";
    if(self){
        self.categoriesArray = [[NSMutableArray alloc]init];
        self.imageThumbnails = [[NSMutableArray alloc]init];

        [self.categoriesArray addObject:[NSDictionary dictionaryWithObject:@"Letter" forKey:@"Title"]];
        [self.categoriesArray addObject:[NSDictionary dictionaryWithObject:@"Color" forKey:@"Title"]];
        [self.categoriesArray addObject:[NSDictionary dictionaryWithObject:@"Food" forKey:@"Title"]];
        
        [self.imageThumbnails addObject:@"alphabet.jpg"];
        [self.imageThumbnails addObject:@"color.jpg"];
        [self.imageThumbnails addObject:@"food.png"];
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
    return [self.categoriesArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:@"UITableViewCell"
                             forIndexPath:indexPath];
    
    NSDictionary *cellIdentifier = [self.categoriesArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[cellIdentifier objectForKey:@"Title"]];
    cell.imageView.image = [UIImage imageNamed:[self.imageThumbnails objectAtIndex:indexPath.row]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MVCLevelViewController *lvlVC = [[MVCLevelViewController alloc] init];
    NSDictionary *titleIdentifier = [self.categoriesArray objectAtIndex:indexPath.row];
    
    // Set the category of the items in the level view
    // depending on the selected title in the main view
    lvlVC.category = [NSString stringWithFormat:@"%@", [titleIdentifier objectForKey:@"Title"]];
    [self.navigationController pushViewController:lvlVC animated:YES];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

@end
