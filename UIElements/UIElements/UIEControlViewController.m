//
//  UIEControlViewController.m
//  UIElements
//
//  Created by Keith Samson on 6/23/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "UIEControlViewController.h"

@implementation UIEControlViewController
- (IBAction)sliderValueChanged:(UISlider *)sender {
    
    if((int)sender.value > 9000){
        self.volumeLabel.text = @"Over 9000!";
        return;
    }
    self.volumeLabel.text = [NSString stringWithFormat:@"%i", (int)sender.value];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // Set the navbar title to the selected item's class
    self.title = [NSString stringWithFormat:@"%@", self.class];
    
    [self.lightSwitch addTarget:self action:@selector(stateChanged:) forControlEvents:UIControlEventValueChanged];
}

-(void)stateChanged:(UISwitch *)switchState
{
    if ([switchState isOn]) {
        self.outputLabel.text = @"The light is on";
        self.view.backgroundColor = [UIColor whiteColor];
        return;
    }
    self.outputLabel.text = @"The light is off";
    self.view.backgroundColor = [UIColor grayColor];
}
@end
