//
//  MVCLevelCell.m
//  ModelViewController
//
//  Created by Keith Samson on 6/26/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "MVCLevelCell.h"

@implementation MVCLevelCell
-(id)initWithItemModel:(MVCItemModel *)itemModel
{
    self.levelTitleLabel.text = itemModel.itemTitle;
    self.levelDescriptionLabel.text = itemModel.itemDescription;
    return self;
}
@end
