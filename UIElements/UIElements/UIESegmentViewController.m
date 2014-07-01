//
//  UIESegmentViewController.m
//  UIElements
//
//  Created by Keith Samson on 6/24/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "UIESegmentViewController.h"

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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Set the navbar title to the selected item's class
    self.title = [NSString stringWithFormat:@"%@", self.class];
}
@end
