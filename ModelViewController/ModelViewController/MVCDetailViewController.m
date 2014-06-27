//
//  MVCDetailViewController.m
//  ModelViewController
//
//  Created by Keith Samson on 6/26/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "MVCDetailViewController.h"

@interface MVCDetailViewController ()
@property (retain, nonatomic) NSString *itemTitleForLabel;
@property (retain, nonatomic) NSString *itemCategoryForLabel;
@property (retain, nonatomic) NSString *itemDescriptionForLabel;

@end

@implementation MVCDetailViewController

-(id)initWithItemModel:(MVCItemModel *)itemModel
{
    self.itemTitleForLabel = itemModel.itemTitle;
    self.itemCategoryForLabel = itemModel.itemCategory;
    self.itemDescriptionForLabel = itemModel.itemDescription;
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = self.itemTitleForLabel;
    // Do any additional setup after loading the view from its nib.
    self.titleLabel.text = self.itemTitleForLabel;
    self.descriptionLabel.text = self.itemDescriptionForLabel;
    self.categoryLabel.text = self.itemCategoryForLabel;
}

@end
