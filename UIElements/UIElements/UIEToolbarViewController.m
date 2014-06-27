//
//  UIEToolbarViewController.m
//  UIElements
//
//  Created by Keith Samson on 6/24/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "UIEToolbarViewController.h"

@implementation UIEToolbarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // Set the navbar title to the selected item's class
    self.title = [NSString stringWithFormat:@"%@", self.class];

    [self createToolBar];
}

-(void)createToolBar
{
    UIToolbar *myToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 44, 320, 44)];
    
    // Use this to create spaces between your other buttons
    UIBarButtonItem *spaceFiller = [[UIBarButtonItem alloc]
                                  initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                  target:nil
                                  action:nil];
    
    UIBarButtonItem *firstButton = [[UIBarButtonItem alloc]
                                    initWithTitle:@"First"
                                    style:UIBarButtonItemStylePlain
                                    target:self
                                    action:@selector(firstButtonTapped:)];
    
    UIBarButtonItem *secondButton = [[UIBarButtonItem alloc]
                                     initWithTitle:@"Second"
                                     style:UIBarButtonItemStylePlain
                                     target:self
                                     action:@selector(secondButtonTapped:)];
    
    UIBarButtonItem *thirdButton = [[UIBarButtonItem alloc]
                                    initWithTitle:@"Third"
                                    style:UIBarButtonItemStylePlain
                                    target:self
                                    action:@selector(thirdButtonTapped:)];
    
    NSArray *toolbarButtons = [NSArray
                               arrayWithObjects:
                               firstButton,
                               spaceFiller,
                               secondButton,
                               spaceFiller,
                               thirdButton,
                               nil];
    
    [self.view addSubview:myToolbar];
    
    [myToolbar setItems:toolbarButtons];
    // Why is this not working?
    // [self setToolbarItems:toolbarButtons animated:NO];
}

-(IBAction)firstButtonTapped:(UIBarButtonItem *)sender
{
    self.outputLabel.text = @"This is the first item in the toolbar.";
}

-(IBAction)secondButtonTapped:(UIBarButtonItem *)sender
{
    self.outputLabel.text = @"This is the second item in the toolbar.";
}

-(IBAction)thirdButtonTapped:(UIBarButtonItem *)sender
{
    self.outputLabel.text = @"This is the third item in the toolbar.";
}

@end
