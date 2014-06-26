//
//  MVCMainViewController.h
//  ModelViewController
//
//  Created by Keith Samson on 6/25/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MVCMainViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray *mainArray;
@property (strong, nonatomic) NSMutableDictionary *letterDictionary;
@property (strong, nonatomic) NSMutableDictionary *colorDictionary;
@property (strong, nonatomic) NSMutableDictionary *foodDictionary;
@property (strong, nonatomic) NSMutableArray *thumbs;
@end
