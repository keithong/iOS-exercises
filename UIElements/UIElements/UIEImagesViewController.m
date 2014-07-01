//
//  UIEImagesViewController.m
//  UIElements
//
//  Created by Keith Samson on 6/23/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "UIEImagesViewController.h"

@interface UIEImagesViewController()
@property (retain, nonatomic) UIImage *image;
@end

@implementation UIEImagesViewController
- (IBAction)enlargeButtonAction:(id)sender {
    // Set an invisible button above the thumbnail
    // to enlarge the image when tapped
    [self.thumbView setFrame:CGRectMake(66, 237, self.image.size.width, self.image.size.height)];
}

- (void)viewDidLoad
{
    [super viewDidLoad];   
    // Set the navbar title to the selected item's class
    self.title = [NSString stringWithFormat:@"%@", self.class];
    
    self.image = [UIImage imageNamed:@"veldog.jpg"];
    [self.imageView setFrame:CGRectMake(66,74, self.image.size.width, self.image.size.height)];
    [self.imageView setImage:self.image];
    [self.thumbView setImage:self.image];
    
}
@end
