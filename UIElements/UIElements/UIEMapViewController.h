//
//  UIEMapViewController.h
//  UIElements
//
//  Created by Keith Samson on 6/25/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>

@interface UIEMapViewController : UIViewController <CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *myMapView;
@property (nonatomic) float latitude;
@property (nonatomic) float longtitude;
@property (nonatomic, strong) CLLocationManager *locationManager;
@end
