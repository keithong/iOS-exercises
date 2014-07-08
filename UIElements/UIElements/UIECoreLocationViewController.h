//
//  UIECoreLocationViewController.h
//  UIElements
//
//  Created by Keith Samson on 6/25/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>

@interface UIECoreLocationViewController : UIViewController <CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *latitudeValue;
@property (weak, nonatomic) IBOutlet UILabel *longtitudeValue;
@property (nonatomic, strong) CLLocationManager *locationManager;
@end
