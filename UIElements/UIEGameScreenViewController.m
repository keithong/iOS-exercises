//
//  UIEGameScreenViewController.m
//  UIElements
//
//  Created by Keith Samson on 6/25/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "UIEGameScreenViewController.h"

@interface UIEGameScreenViewController ()

@end

@implementation UIEGameScreenViewController
- (IBAction)pauseButtonAction:(id)sender {
    UIEPauseScreenViewController *pauseGame = [[UIEPauseScreenViewController alloc] initWithNibName:@"UIEPauseScreenViewController" bundle:[NSBundle mainBundle]];
    [pauseGame setDelegate:self];
    [self.navigationController pushViewController:pauseGame animated:NO];
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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

    NSLog(@"Successfully called the delegate method!");
    
    
}

@end
