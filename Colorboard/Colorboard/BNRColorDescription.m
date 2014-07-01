//
//  BNRColorDescription.m
//  Colorboard
//
//  Created by Keith Samson on 7/1/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "BNRColorDescription.h"

@implementation BNRColorDescription

-(instancetype)init
{
    self = [super init];
    if(self) {
        _color = [UIColor colorWithRed:0 green:0 blue:1 alpha:1];
        _name = @"Blue";
    }
    return self;
}

@end
