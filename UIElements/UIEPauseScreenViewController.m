//
//  UIEPauseScreenViewController.m
//  UIElements
//
//  Created by Keith Samson on 6/25/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "UIEPauseScreenViewController.h"

@implementation UIEPauseScreenViewController
- (IBAction)pauseButtonMethod:(id)sender {
    if([self.delegate respondsToSelector:@selector(pauseGameDelegateMethod)])
    {
        NSLog(@"Call pauseGameDelegateMethod from MainViewController");
        [self.delegate pauseGameDelegateMethod];
        return;
    }
        NSLog(@"Does not conform to the Delegate Protocol");
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.delegate pauseGameDelegateMethod];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Set the navbar title to the selected item's class
    self.title = [NSString stringWithFormat:@"%@", self.class];
}
@end
