//
//  UIETabBarViewController.m
//  UIElements
//
//  Created by Keith Samson on 6/24/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "UIETabBarViewController.h"

@implementation UIETabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Set the navbar title to the selected item's class
    self.title = [NSString stringWithFormat:@"%@", self.class];
    
    [self createTabBar];
}

-(void)createTabBar
{
    UITabBar *myTabBar = [[UITabBar alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 52, 320, 44)];
    
    UITabBarItem *firstTab = [[UITabBarItem alloc] initWithTitle:@"first tab" image:nil selectedImage:nil];
    
    UITabBarItem *secondTab = [[UITabBarItem alloc] initWithTitle:@"second tab" image:nil selectedImage:nil];

    NSArray *tabBarButtons = [NSArray arrayWithObjects:firstTab, secondTab, nil];
    
    [myTabBar setItems:tabBarButtons];
    
    [self.view addSubview:myTabBar];
}

@end
