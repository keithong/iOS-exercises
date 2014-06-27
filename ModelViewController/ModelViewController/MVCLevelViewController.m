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

@interface MVCLevelViewController()
@property (retain, nonatomic) NSString *filePath;
@property (retain, nonatomic) NSMutableArray *plistArray;
@property (retain, nonatomic) NSArray *filteredArray;
@property (retain, nonatomic) NSDictionary *plistDictionary;
@property (retain, nonatomic) NSString *itemTitleForLabel;
@property (retain, nonatomic) NSString *itemDescriptionForLabel;
-(id)initWithItemModel:(MVCItemModel *)itemModel;
@end

@implementation MVCLevelViewController
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
    // We want to access the model in the level view
    // to add the description with the title in the cell
    
    self = [super init];
    self.itemTitleForLabel = itemModel.itemTitle;
    self.itemDescriptionForLabel = itemModel.itemDescription;
    return self;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Since we have a filtered array, we can now count the rows
    // based on how many items are returned.
    return [self.filteredArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MVCLevelCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MVCLevelCell" forIndexPath:indexPath];
    
    NSDictionary *cellIdentifier = [self.filteredArray objectAtIndex:indexPath.row];
    
    MVCItemModel *item = [[MVCItemModel alloc]initWithDictionary:cellIdentifier];
    
    // Use level view controller's initWithItemModel
    // to get data from the model
    MVCLevelViewController *lvc = [[MVCLevelViewController alloc]initWithItemModel:item];
    
    cell.levelTitleLabel.text = lvc.itemTitleForLabel;
    cell.levelDescriptionLabel.text = lvc.itemDescriptionForLabel;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *detailIdentifier = [self.filteredArray objectAtIndex:indexPath.row];
    
    // Log to test and debug
    // NSLog(@"detailIdentifier %@", detailIdentifier);
    
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
    
    self.filePath = [[NSBundle mainBundle] pathForResource:@"Exercise-Tool" ofType:@"plist"];
    
    if(self.filePath)
    {
        // Log to test and debug
        // NSLog(@"plist Loaded");
        
        self.plistArray = [NSArray arrayWithContentsOfFile:self.filePath];
        
        // Use this to view every item on a given category
        self.filteredArray = [self.plistArray filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(itemCategory == %@)", self.category]];
        
        // NSLog (@"Selected Category: %@",self.category);
        // NSLog(@"filteredArray: %@", filteredArray);
        
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        return;
    }
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    NSLog(@"Failed to load plist");
    
}

@end
