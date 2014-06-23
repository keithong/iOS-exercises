//
//  BNRDetailViewController.h
//  Homepwner
//
//  Created by Keith Samson on 6/18/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BNRItem;


@interface BNRDetailViewController : UIViewController <UIViewControllerRestoration>

-(instancetype)initForNewItem:(BOOL)isNew;

@property (nonatomic, strong)BNRItem *item;
@property (nonatomic, copy)void (^dismissBlock)(void);

@end
