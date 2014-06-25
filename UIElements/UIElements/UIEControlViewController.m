//
//  UIEControlViewController.m
//  UIElements
//
//  Created by Keith Samson on 6/23/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "UIEControlViewController.h"

@interface UIEControlViewController ()

@end

@implementation UIEControlViewController
- (IBAction)sliderValueChanged:(UISlider *)sender {
    
    if((int)sender.value > 9000){
        self.volumeLabel.text = @"Over 9000!";
        return;
    }
    self.volumeLabel.text = [NSString stringWithFormat:@"%i", (int)sender.value];
    
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
    [self.lightSwitch addTarget:self action:@selector(stateChanged:) forControlEvents:UIControlEventValueChanged];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)stateChanged:(UISwitch *)switchState
{
    if ([switchState isOn]) {
        self.outputLabel.text = @"The light is on";
        self.view.backgroundColor = [UIColor whiteColor];
    } else {
        self.outputLabel.text = @"The light is off";
        self.view.backgroundColor = [UIColor blackColor];
    }
}

@end
