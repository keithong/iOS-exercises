//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Keith Samson on 6/17/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisterView.h"

@implementation BNRHypnosisViewController
-(void)loadView
{
    // Create a view
    CGRect frame = [UIScreen mainScreen].bounds;
    BNRHypnosisterView *backgroundView = [[BNRHypnosisterView alloc]initWithFrame:frame];
    
    // Set it as the view of this view controller
    self.view = backgroundView;
    
}
@end
