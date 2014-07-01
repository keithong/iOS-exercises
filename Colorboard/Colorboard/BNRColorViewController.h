//
//  BNRColorViewController.h
//  Colorboard
//
//  Created by Keith Samson on 7/1/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRColorDescription.h"
@interface BNRColorViewController : UIViewController
@property (nonatomic) BOOL existingColor;
@property (nonatomic) BNRColorDescription *colorDescription;
@end
