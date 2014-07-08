//
//  UIEAccelerometerViewController.m
//  UIElements
//
//  Created by Keith Samson on 6/30/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "UIEAccelerometerViewController.h"

@interface UIEAccelerometerViewController ()
@property (nonatomic) double currentMaxAccX;
@property (nonatomic) double currentMaxAccY;
@property (nonatomic) double currentMaxAccZ;

@property (nonatomic) double currentMaxRotX;
@property (nonatomic) double currentMaxRotY;
@property (nonatomic) double currentMaxRotZ;

@property (strong, nonatomic) CMMotionManager *motionManager;
@end

@implementation UIEAccelerometerViewController
- (IBAction)resetValues:(id)sender {
    
    self.currentMaxAccX = 0;
    self.currentMaxAccY = 0;
    self.currentMaxAccZ = 0;
    
    self.currentMaxRotX = 0;
    self.currentMaxRotY = 0;
    self.currentMaxRotZ = 0;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.currentMaxAccX = 0;
    self.currentMaxAccY = 0;
    self.currentMaxAccZ = 0;
    
    self.currentMaxRotX = 0;
    self.currentMaxRotY = 0;
    self.currentMaxRotZ = 0;
    
    self.motionManager = [[CMMotionManager alloc]init];
    self.motionManager.accelerometerUpdateInterval = .5;
    self.motionManager.gyroUpdateInterval = .5;
    
    [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
        [self printAccelerationData: accelerometerData.acceleration];
        if(error){
            NSLog(@"%@", error);
        }
    }];
    
    [self.motionManager startGyroUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMGyroData *gyroData, NSError *error) {
        [self printGyroscopeData: gyroData.rotationRate];
        if(error){
            NSLog(@"%@", error);
        }
    }];
    
    
}

-(void)printAccelerationData:(CMAcceleration)acceleration
{
    self.moveLabel.center = CGPointMake((self.moveLabel.center.x + acceleration.x), self.moveLabel.center.y); // Make your label move along X axis
    self.accX.text = [NSString stringWithFormat:@" %.2fg",acceleration.x]; // Set the acceleration initial value to zero.
    if(fabs(acceleration.x) > fabs(self.currentMaxAccX))                   // if the sent acceleration is greater than the current acceleration;
    {
        self.currentMaxAccX = acceleration.x;                              // update the current acceleration to the sent acceleration
        
    }
    
    self.moveLabel.center = CGPointMake(self.moveLabel.center.x, (self.moveLabel.center.y + acceleration.y)); // Make your label move along Y axis
    self.accY.text = [NSString stringWithFormat:@" %.2fg",acceleration.y];
    if(fabs(acceleration.y) > fabs(self.currentMaxAccY))
    {
        self.currentMaxAccY = acceleration.y;
    }
    
    self.accZ.text = [NSString stringWithFormat:@" %.2fg",acceleration.z];
    if(fabs(acceleration.z) > fabs(self.currentMaxAccZ))
    {
        self.currentMaxAccZ = acceleration.z;
    }
    
}

-(void)printGyroscopeData:(CMRotationRate)rotation
{
    self.rotX.text = [NSString stringWithFormat:@" %.2fr/s",rotation.x]; // Set the rotation initial value to zero.
    if(fabs(rotation.x) > fabs(self.currentMaxRotX))                     // if the sent rotation value is greter than the current rotation value;
    {
        self.currentMaxRotX = rotation.x;                                // update the current rotation value to the sent rotation value
    }
    self.rotY.text = [NSString stringWithFormat:@" %.2fr/s",rotation.y];
    if(fabs(rotation.y) > fabs(self.currentMaxRotY))
    {
        self.currentMaxRotY = rotation.y;
    }
    self.rotZ.text = [NSString stringWithFormat:@" %.2fr/s",rotation.z];
    if(fabs(rotation.z) > fabs(self.currentMaxRotZ))
    {
        self.currentMaxRotZ = rotation.z;
    }
    
}

@end
