//
//  UIEAnimationViewController.m
//  UIElements
//
//  Created by Keith Samson on 6/30/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "UIEAnimationViewController.h"

@interface UIEAnimationViewController ()

@end

@implementation UIEAnimationViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    UIImage *ballImage = [UIImage imageNamed:@"football"];
    UIImageView *ball = [[UIImageView alloc] initWithImage:ballImage];
    
    [self.view addSubview:ball];
    [self addFallAnimationForLayer:ball.layer];
    
    
    NSArray *imageNames = [NSArray arrayWithObjects:@"luf1.png", @"luf2.png", @"luf3.png", @"luf4.png", @"luf5.png",
                                                    @"luf6.png", @"luf7.png", @"luf8.png", @"luf9.png", nil];
    
    NSMutableArray *images = [[NSMutableArray alloc] init];
    for (int i = 0; i < imageNames.count; i++) {
        [images addObject:[UIImage imageNamed:[imageNames objectAtIndex:i]]];
    }
    
    UIImageView *animationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.view.frame) - 68, CGRectGetMidY(self.view.frame) - 51, 51, 68)];
    animationImageView.animationImages = images;
    animationImageView.animationDuration = .5;
    
    [self.view addSubview:animationImageView];
    [animationImageView startAnimating];
    
}

- (void)addFallAnimationForLayer:(CALayer *)layer{
    
    // The keyPath to animate
    NSString *keyPath = @"transform.translation.y";
    
    // Allocate a CAKeyFrameAnimation for the specified keyPath.
    CAKeyframeAnimation *translation = [CAKeyframeAnimation animationWithKeyPath:keyPath];
    
    // Set animation duration and repeat
    translation.duration = 1.5f;
    translation.repeatCount = HUGE_VAL;
    translation.autoreverses = YES;
    
    // Allocate array to hold the values to interpolate
    NSMutableArray *values = [[NSMutableArray alloc] init];
    
    // Add the start value
    // The animation starts at a y offset of 0.0
    [values addObject:[NSNumber numberWithFloat:0.0f]];
    
    // Add the end value
    // The animation finishes when the ball would contact the bottom of the screen
    // This point is calculated by finding the height of the applicationFrame
    // and subtracting the height of the ball.
    CGFloat height = [[UIScreen mainScreen] applicationFrame].size.height - layer.frame.size.height;
    [values addObject:[NSNumber numberWithFloat:height]];
    
    // Set the values that should be interpolated during the animation
    translation.values = values;
    
    [layer addAnimation:translation forKey:keyPath];
    
    // Allocate array to hold the timing functions
    NSMutableArray *timingFunctions = [[NSMutableArray alloc] init];
    
    // Add a timing function for the first animation step to ease in the animation
    // this step crudely simulates gravity by easing in the effects of y offset
    [timingFunctions addObject:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    
    // Set the timing functions that should be used to calculate interpolation between the first two keyframes
    translation.timingFunctions = timingFunctions;
}


@end
