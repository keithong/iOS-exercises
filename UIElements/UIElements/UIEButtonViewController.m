//
//  UIEButtonViewController.m
//  UIElements
//
//  Created by Keith Samson on 6/23/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "UIEButtonViewController.h"

@implementation UIEButtonViewController
- (IBAction)greetBtnClick:(id)sender {
    self.labelOutput.text = @"Hello, World!";
    self.labelOutput.textColor = [UIColor darkTextColor];
}

- (IBAction)cookieBtnClick:(id)sender {
    int cookie = arc4random() % 3;
    if (cookie == 2) {
        self.labelOutput.text = @"Here's your cookie!";
        self.labelOutput.textColor = [UIColor brownColor];
        return;
    }
    self.labelOutput.text = @"No cookie for you today!";
    self.labelOutput.textColor = [UIColor blackColor];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.labelOutput.text = @"";
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

@end
