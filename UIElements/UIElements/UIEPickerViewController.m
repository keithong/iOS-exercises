//
//  UIEPickerViewController.m
//  UIElements
//
//  Created by Keith Samson on 6/23/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "UIEPickerViewController.h"

@interface UIEPickerViewController () <UIPickerViewDataSource, UIPickerViewDelegate>


@end
@implementation UIEPickerViewController
@synthesize charList;

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
    
    self.characterPicker.dataSource = self;
    self.characterPicker.delegate = self;
    
    // Create an array that will soon be pushed inside the picker
    charList = [[NSMutableArray alloc]
                initWithObjects:
                @"Rick Grimes",
                @"Daryl Dixon",
                @"Michonne",
                @"Carl Grimes",
                @"The Governor",
                @"Shane Walsh",
                @"Herschel Greene", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    // Number of "columns" in the picker
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    // Number of rows in the picker. Use the array's length to determine it.
    return [charList count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    // Push every item inside the picker using your row count as your index.
    return [self.charList objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    // When you select an item in the picker, the label in the screen will be updated.
    self.characterLabel.text = [NSString stringWithFormat:@"%@", [charList objectAtIndex:row]];
}

@end
