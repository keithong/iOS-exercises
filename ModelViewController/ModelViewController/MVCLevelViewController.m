//
//  MVCLevelViewController.m
//  ModelViewController
//
//  Created by Keith Samson on 6/25/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "MVCLevelViewController.h"
#import "MVCMainViewController.h"
#import "MVCItemModel.h"
#import "MVCDetailViewController.h"
#import "MVCLevelCell.h"

@implementation MVCLevelViewController
@synthesize filePath, plistArray, filteredArray,storageArray, plistDictionary;
-(instancetype)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    if(self){
    }
    return self;
}

-(instancetype)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}
-(id)initWithItemModel:(MVCItemModel *)itemModel
{
    self = [super init];
    self.itemTitleForLabel = itemModel.itemTitle;
    self.itemDescriptionForLabel = itemModel.itemDescription;
    return self;
}
-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section
{
    // Since we have a filtered array, we can now
    return [filteredArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    MVCLevelCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MVCLevelCell" forIndexPath:indexPath];
    NSDictionary *cellIdentifier = [filteredArray objectAtIndex:indexPath.row];
    MVCItemModel *item = [[MVCItemModel alloc]initWithDictionary:cellIdentifier];

    MVCLevelViewController *lvc = [[MVCLevelViewController alloc]initWithItemModel:item];
   
    cell.levelTitleLabel.text = lvc.itemTitleForLabel;
    cell.levelDescriptionLabel.text = lvc.itemDescriptionForLabel;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *detailIdentifier = [filteredArray objectAtIndex:indexPath.row];
    NSLog(@"detailIdentifier %@", detailIdentifier);
    MVCItemModel *item = [[MVCItemModel alloc]initWithDictionary:detailIdentifier];
    MVCDetailViewController *dvc = [[MVCDetailViewController alloc]initWithItemModel:item];
    [self.navigationController pushViewController:dvc animated:YES];
    
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.title = self.category;
    
    UINib *nib = [UINib nibWithNibName:@"MVCLevelCell" bundle:nil];
    
    [self.tableView registerNib:nib forCellReuseIdentifier:@"MVCLevelCell"];
    
    filePath = [[NSBundle mainBundle] pathForResource:@"Exercise-Tool" ofType:@"plist"];
    
    if(filePath)
    {
        NSLog(@"plist loaded");
        
        plistArray = [NSArray arrayWithContentsOfFile:filePath];
        
        NSLog (@"Selected Category: %@",self.category);
        
        // Use this to view every item on a given category
        filteredArray = [plistArray filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(itemCategory == %@)", self.category]];
        
        
        NSLog(@"filteredArray: %@", filteredArray);
        
        
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        return;
    }
    
    NSLog(@"failed to load plist");
    
}

@end
