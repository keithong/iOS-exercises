//
//  MVCLevelViewController.h
//  ModelViewController
//
//  Created by Keith Samson on 6/25/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface MVCLevelViewController : UITableViewController
@property (strong, nonatomic) NSString *filePath;
@property (strong, nonatomic) NSMutableArray *plistArray;
@property (strong, nonatomic) NSArray *filteredArray;
@property (strong, nonatomic) NSMutableArray *storageArray;
@property (strong, nonatomic) NSDictionary *plistDictionary;
@property (strong, nonatomic) NSString *category;
@property (strong, nonatomic) NSMutableArray *levelArray;
@end
