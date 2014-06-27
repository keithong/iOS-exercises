//
//  UIEImagesViewController.m
//  UIElements
//
//  Created by Keith Samson on 6/23/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "UIEImagesViewController.h"

@interface UIEImagesViewController ()

@end

@implementation UIEImagesViewController
- (IBAction)enlargeButtonAction:(id)sender {
    // Set an invisible button above the thumbnail to
    // enlarge the image when tapped
    [self.thumbView setFrame:CGRectMake(66, 237, 189, 155)];
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
    
    UIImage *image = [UIImage imageNamed:@"veldog.jpg"];
    [self.imageView setImage:image];
    [self.thumbView setImage:image];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
