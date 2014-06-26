//
//  MVCLevelCell.h
//  ModelViewController
//
//  Created by Keith Samson on 6/26/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MVCItemModel.h"

@interface MVCLevelCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *levelDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *levelTitleLabel;


@end
