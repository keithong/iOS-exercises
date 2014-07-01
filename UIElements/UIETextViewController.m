//
//  UIETextViewController.m
//  UIElements
//
//  Created by Keith Samson on 6/23/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "UIETextViewController.h"

@implementation UIETextViewController
- (IBAction)fieldToLabel:(UITextField *)sender {
    self.outputLabel.text = sender.text;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Set the navbar title to the selected item's class
    self.title = [NSString stringWithFormat:@"%@", self.class];
    
    // When the user taps anywhere in the screen, "tap" will call the method closeKeyboard
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeKeyboard)];
    [self.view addGestureRecognizer:tap];
}

-(void)closeKeyboard
{
    [self.myTextField resignFirstResponder];
    [self.myTextView resignFirstResponder];
}

@end
