//
//  UIECustomFontViewController.m
//  UIElements
//
//  Created by Keith Samson on 6/30/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "UIECustomFontViewController.h"

@interface UIECustomFontViewController ()

@end

@implementation UIECustomFontViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.customLabel.font = [UIFont fontWithName:@"Black Coffee Shadow" size:20.0];
}
@end
