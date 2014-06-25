//
//  UIEPauseScreenViewController.m
//  UIElements
//
//  Created by Keith Samson on 6/25/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "UIEPauseScreenViewController.h"

@interface UIEPauseScreenViewController ()

@end

@implementation UIEPauseScreenViewController
- (IBAction)pauseButtonMethod:(id)sender {
    if([self.delegate respondsToSelector:@selector(pauseGameDelegateMethod)])
    {
        NSLog(@"call pauseGameDelegateMethod from MainViewController");
        [self.delegate pauseGameDelegateMethod];
    }
    else
        NSLog(@"Does not conform to the Delegate Protocol");
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self.delegate pauseGameDelegateMethod];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
