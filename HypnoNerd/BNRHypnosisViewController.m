//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Keith Samson on 6/17/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisterView.h"

@implementation BNRHypnosisViewController
-(void)loadView
{
    // Create a view
    CGRect frame = [UIScreen mainScreen].bounds;
    BNRHypnosisterView *backgroundView = [[BNRHypnosisterView alloc]initWithFrame:frame];
    
    // Create a text field
    CGRect textFieldRect = CGRectMake(40,70,240,30);
    UITextField *textField = [[UITextField alloc]initWithFrame:textFieldRect];
    
    // Setting the border style on the text field will allow us to see it more easily
    
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"Hypnotize me";
    textField.returnKeyType = UIReturnKeyDone;
    
    [backgroundView addSubview:textField];
    
    // Set it as the view of this view controller
    self.view = backgroundView;
    
    
}
-(instancetype)initWithNibName:(NSString *)nibNameOrNil
                        bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if(self) {
    
        // Set the tab bar item's title
        self.tabBarItem.title = @"Hypnotize";
        
        // Create a UIImage from a file
        // This will use Hypno@2x.png on retina display devices
        UIImage *image = [UIImage imageNamed:@"Hypno.png"];
        
        // Put that image on the tab bar item
        self.tabBarItem.image = image;
    }
    return self;
}

-(void)viewDidLoad
{
    // Always call the super implementation of viewDidLoad
    [super viewDidLoad];
    
    NSLog(@"BNRHypnosisViewController loaded its view.");
}

@end
