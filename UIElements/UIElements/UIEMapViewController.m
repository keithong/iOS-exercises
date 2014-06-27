//
//  UIEMapViewController.m
//  UIElements
//
//  Created by Keith Samson on 6/25/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "UIEMapViewController.h"

@interface UIEMapViewController ()

@end

@implementation UIEMapViewController
@synthesize latitude;
@synthesize longtitude;

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
    
    // Check if the location service is enabled
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    newRegion.span.latitudeDelta = .18;
    newRegion.span.longitudeDelta = .18;
    
    [self.myMapView setRegion:newRegion animated:YES];
    
    
}

@end
