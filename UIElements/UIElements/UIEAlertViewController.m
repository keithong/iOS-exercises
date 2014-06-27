//
//  UIEAlertViewController.m
//  UIElements
//
//  Created by Keith Samson on 6/24/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "UIEAlertViewController.h"

@interface UIEAlertViewController () <UIAlertViewDelegate>
@end

@implementation UIEAlertViewController
- (IBAction)clearLabel:(id)sender {
    
    UIAlertView *clear = [[UIAlertView alloc]
                          initWithTitle:@"Clear Label"
                          message:@"The label is begging not to be cleared. Are you sure you want to clear it?"
                          delegate:self
                          cancelButtonTitle:@"NO"
                          otherButtonTitles:@"Yes",nil];
    
    [clear show];
    
}

- (IBAction)alertPop:(id)sender {
    
    UIAlertView *greet = [[UIAlertView alloc]
                            initWithTitle:@"Greet!"
                            message:@"Hello, World!"
                            delegate:nil
                            cancelButtonTitle:@"OK"
                            otherButtonTitles:nil];
    
    [greet show];
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
    
    // Set the navbar title to the selected item's class
    self.title = [NSString stringWithFormat:@"%@", self.class];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    
    if([title isEqualToString:@"Yes"])
    {
        self.sampleLabel.text = @"";
        return;
    }
}

@end
