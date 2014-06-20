//
//  BNRItemCell.h
//  Homepwner
//
//  Created by Keith Samson on 6/19/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItemCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;
@property (weak, nonatomic) IBOutlet UILabel *serialLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailView;

@property(copy, nonatomic)void(^actionBlock)(void);

@end
