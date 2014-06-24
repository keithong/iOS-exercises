//
//  UIEPickerViewController.h
//  UIElements
//
//  Created by Keith Samson on 6/23/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIEPickerViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *characterLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *characterPicker;

@property (nonatomic, retain)NSMutableArray *charList;

@end
