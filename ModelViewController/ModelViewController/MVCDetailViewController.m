//
//  MVCDetailViewController.m
//  ModelViewController
//
//  Created by Keith Samson on 6/26/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "MVCDetailViewController.h"

@interface MVCDetailViewController ()

@end

@implementation MVCDetailViewController

-(id)initWithItemModel:(MVCItemModel *)itemModel
{

    self.itemTitleForLabel = itemModel.itemTitle;
    self.itemCategoryForLabel = itemModel.itemCategory;
    self.itemDescriptionForLabel = itemModel.itemDescription;
    return self;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
