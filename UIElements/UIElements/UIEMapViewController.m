//
//  UIEMapViewController.m
//  UIElements
//
//  Created by Keith Samson on 6/25/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "UIEMapViewController.h"

@interface UIEMapViewController ()
@property (nonatomic) float latitude;
@property (nonatomic) float longtitude;
@property (nonatomic, strong) CLLocationManager *locationManager;
@end

@implementation UIEMapViewController
const float LAT_DELTA = .18;
const float LONG_DELTA = .18;
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // Set the navbar title to the selected item's class
    self.title = [NSString stringWithFormat:@"%@", self.class];
    
    // Check if the location service is enabled
    if ([CLLocationManager locationServicesEnabled]) {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        [self.locationManager startUpdatingLocation];
        return;
    }
    UIAlertView *locationErrorAlertView = [[UIAlertView alloc]
                                           initWithTitle:@"Error!"
                                           message:@"Location Services are not enabled."
                                           delegate:self
                                           cancelButtonTitle:@"OK"
                                           otherButtonTitles:nil];
    
    [locationErrorAlertView show];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *lastLocation = [locations lastObject];
    self.latitude = lastLocation.coordinate.latitude;
    self.longtitude = lastLocation.coordinate.longitude;
}

-(void)viewLocation
{
    
    MKCoordinateRegion newRegion;
    
    newRegion.center.latitude = self.latitude;
    newRegion.center.longitude = self.longtitude;
    
    newRegion.span.latitudeDelta = LAT_DELTA;
    newRegion.span.longitudeDelta = LONG_DELTA;
    
    [self.myMapView setRegion:newRegion animated:YES];
    
}

@end
