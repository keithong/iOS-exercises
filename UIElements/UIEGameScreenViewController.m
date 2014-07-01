//
//  UIEGameScreenViewController.m
//  UIElements
//
//  Created by Keith Samson on 6/25/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "UIEGameScreenViewController.h"

@implementation UIEGameScreenViewController
- (IBAction)pauseButtonAction:(id)sender {
    UIEPauseScreenViewController *pauseGame = [[UIEPauseScreenViewController alloc]
                                               initWithNibName:@"UIEPauseScreenViewController"
                                               bundle:[NSBundle mainBundle]];
    [pauseGame setDelegate:self];
    [self.navigationController pushViewController:pauseGame animated:NO];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Set the navbar title to the selected item's class
    self.title = [NSString stringWithFormat:@"%@", self.class];
}


- (void)pauseGameDelegateMethod
{
    UIAlertView *notify = [[UIAlertView alloc]
                          initWithTitle:@"Success"
                          message:@"Successfully called the delegate method!"
                          delegate:self
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil];
    
    [notify show];
}

@end
