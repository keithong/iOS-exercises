//
//  UIEActionSheetViewController.m
//  UIElements
//
//  Created by Keith Samson on 6/24/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "UIEActionSheetViewController.h"

@interface UIEActionSheetViewController () <UIActionSheetDelegate>
@end

@implementation UIEActionSheetViewController
- (IBAction)showActionSheet:(id)sender {
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:nil
                                  delegate:self
                                  cancelButtonTitle:@"Cancel"
                                  destructiveButtonTitle:@"Delete"
                                  otherButtonTitles:@"Save", nil];
    
    [actionSheet showInView:self.view];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // Set the navbar title to the selected item's class
    self.title = [NSString stringWithFormat:@"%@", self.class];
    
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    // When an item inside the action sheet is tapped, that item will be displayed in the label.
    self.outputLabel.text = [NSString stringWithFormat:@"%@",[actionSheet buttonTitleAtIndex:buttonIndex]];
}

@end
