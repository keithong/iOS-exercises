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
const int IMAGE_WIDTH = 51;
const int IMAGE_HEIGHT = 68;
const float animationDuration = .5;
- (void)viewDidLoad
{
    [super viewDidLoad];
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
    
    UIImageView *animationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.view.frame), CGRectGetMidY(self.view.frame), IMAGE_WIDTH, IMAGE_HEIGHT)];
    animationImageView.animationImages = images;
    animationImageView.animationDuration = animationDuration;
    
    [self.view addSubview:animationImageView];
    [animationImageView startAnimating];
    
}

- (void)addFallAnimationForLayer:(CALayer *)layer{
    
    NSString *keyPath = @"transform.translation.y";
    CAKeyframeAnimation *translation = [CAKeyframeAnimation animationWithKeyPath:keyPath];
    
    translation.duration = 1.5f;
    translation.repeatCount = HUGE_VAL;
    translation.autoreverses = YES;
    
    NSMutableArray *values = [[NSMutableArray alloc] init];
    [values addObject:[NSNumber numberWithFloat:0.0f]];
    
    CGFloat height = [[UIScreen mainScreen] applicationFrame].size.height - layer.frame.size.height;
    [values addObject:[NSNumber numberWithFloat:height]];
    
    translation.values = values;
    
    [layer addAnimation:translation forKey:keyPath];

    NSMutableArray *timingFunctions = [[NSMutableArray alloc] init];

    [timingFunctions addObject:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    

    translation.timingFunctions = timingFunctions;
}
@end
