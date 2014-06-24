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
    self.characterPicker.dataSource = self;
    self.characterPicker.delegate = self;
    charList = [[NSMutableArray alloc]init];
    charList = [NSMutableArray arrayWithObjects:@"Rick Grimes", @"Daryl Dixon", @"Michonne", @"Carl Grimes",@"The Governor", @"Shane Walsh", @"Herschel Greene", nil];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [charList count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.charList objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.characterLabel.text = [NSString stringWithFormat:@"%@", [charList objectAtIndex:row]];
}

@end
