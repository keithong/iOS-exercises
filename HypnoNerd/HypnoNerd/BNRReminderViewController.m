//
//  BNRReminderViewController.m
//  HypnoNerd
//
//  Created by Keith Samson on 6/17/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "BNRReminderViewController.h"
@interface BNRReminderViewController()

@property(nonatomic, weak) IBOutlet UIDatePicker *datePicker;

@end


@implementation BNRReminderViewController

-(IBAction)addReminder:(id)sender
{
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting a reminder for %@", date);
}
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    if (self) {
        // Set the tab bar item's title
        self.tabBarItem.title = @"Reminder";
        // Create a UIImage from a file
        // This will use Time@2x.png on retina display devices
        UIImage *image = [UIImage imageNamed:@"Time.png"];
        // Put that image on the tab bar item
        self.tabBarItem.image = image;
    }
    return self;
}
@end
