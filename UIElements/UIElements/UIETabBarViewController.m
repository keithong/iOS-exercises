//
//  UIETabBarViewController.m
//  UIElements
//
//  Created by Keith Samson on 6/24/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "UIETabBarViewController.h"

@interface UIETabBarViewController ()
@end

@implementation UIETabBarViewController

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
    // Override point for customization after application launch.
    
    // Set the navbar title to the selected item's class
    self.title = [NSString stringWithFormat:@"%@", self.class];
    
    [self createTabBar];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
