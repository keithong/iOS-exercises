//
//  UIESegmentViewController.m
//  UIElements
//
//  Created by Keith Samson on 6/24/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "UIESegmentViewController.h"

@interface UIESegmentViewController ()

@end

@implementation UIESegmentViewController
- (IBAction)segmentChange:(UISegmentedControl *)sender {
    
    switch (self.chooseSegment.selectedSegmentIndex) {
        case 0:
            self.outputLabel.text = @"You are in the first segment.";
            break;
        case 1:
            self.outputLabel.text = @"You are in the second segment.";
            break;
            
        default:
            break;
    }
    
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

@end
