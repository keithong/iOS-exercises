//
//  MVCDetailViewController.h
//  ModelViewController
//
//  Created by Keith Samson on 6/26/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MVCItemModel.h"

@interface MVCDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

-(id)initWithItemModel:(MVCItemModel *)itemModel;
@end
