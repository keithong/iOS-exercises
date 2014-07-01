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
@property (retain, nonatomic) NSMutableArray *mainArray;
@property (retain, nonatomic) NSMutableArray *thumbs;
@end

@implementation MVCMainViewController

-(instancetype)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    self.title = @"Main View Controller";
    if(self){
        self.mainArray = [[NSMutableArray alloc]init];
        self.thumbs = [[NSMutableArray alloc]init];

        [self.mainArray addObject:[NSDictionary dictionaryWithObject:@"Letter" forKey:@"Title"]];
        [self.mainArray addObject:[NSDictionary dictionaryWithObject:@"Color" forKey:@"Title"]];
        [self.mainArray addObject:[NSDictionary dictionaryWithObject:@"Food" forKey:@"Title"]];
        
        [self.thumbs addObject:@"alphabet.jpg"];
        [self.thumbs addObject:@"color.jpg"];
        [self.thumbs addObject:@"food.png"];
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
    return [self.mainArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:@"UITableViewCell"
                             forIndexPath:indexPath];
    
    NSDictionary *cellIdentifier = [self.mainArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[cellIdentifier objectForKey:@"Title"]];
    cell.imageView.image = [UIImage imageNamed:[self.thumbs objectAtIndex:indexPath.row]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MVCLevelViewController *lvlVC
 = [[MVCLevelViewController alloc] init];
    NSDictionary *titleIdentifier = [self.mainArray objectAtIndex:indexPath.row];
    
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
