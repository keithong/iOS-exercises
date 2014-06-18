//
//  BNRDrawViewController.m
//  TouchTracker
//
//  Created by Keith Samson on 6/18/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "BNRDrawViewController.h"
#import "BNRDrawView.h"
@implementation BNRDrawViewController

-(void)loadView
{
    self.view = [[BNRDrawView alloc] initWithFrame:CGRectZero];
}
@end
