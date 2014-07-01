//
//  UIECoreLocationViewController.m
//  UIElements
//
//  Created by Keith Samson on 6/25/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "UIECoreLocationViewController.h"

@implementation UIECoreLocationViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Set the navbar title to the selected item's class
    self.title = [NSString stringWithFormat:@"%@", self.class];
    
    // Check if the location service in the phone is enabled
    if ([CLLocationManager locationServicesEnabled]) {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        [self.locationManager startUpdatingLocation];
        return;
    }
    UIAlertView *errorLocation = [[UIAlertView alloc]
                                  initWithTitle:@"Error!"
                                  message:@"Location Services are not enabled."
                                  delegate:self
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil];
    
    [errorLocation show];
}


-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *lastLocation = [locations lastObject];
    self.latitudeValue.text = [NSString stringWithFormat:@"%f", lastLocation.coordinate.latitude];
    self.longtitudeValue.text = [NSString stringWithFormat:@"%f", lastLocation.coordinate.longitude];
}

@end
