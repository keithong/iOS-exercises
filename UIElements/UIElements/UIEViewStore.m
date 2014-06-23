//
//  UIEViewStore.m
//  UIElements
//
//  Created by Keith Samson on 6/23/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "UIEViewStore.h"
#import "UIEButtonViewController.h"
#import "UIEControlViewController.h"

@implementation UIEViewStore

-(NSArray *)vcNameList
{
    NSArray *vcList = [[NSArray alloc] initWithObjects:
                              @"Button View Controller",
                              @"Control View Controller",
                              @"Text View Controller" ,
                              @"Picker View Controller",
                              @"Images View Controller", nil];
    return vcList;
}

@end
