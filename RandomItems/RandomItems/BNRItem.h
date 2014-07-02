//
//  BNRItem.h
//  RandomItems
//
//  Created by Keith Samson on 6/16/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject

+(instancetype)randomItem;

// Designated Initializer of BNRItem
-(instancetype)initWithItemName:(NSString *)name
                 valueInDollars:(int)value
                   serialNumber:(NSString *)sNumber;

-(instancetype)initWithItemName:(NSString *)name;

@property (atomic, strong) BNRItem *containedItem;
@property (atomic, weak) BNRItem *container;

@property (atomic, copy) NSString *itemName;
@property (atomic, copy) NSString *serialNumber;
@property (atomic) int valueInDollars;
@property (atomic, readonly, strong) NSDate *dateCreated;

@end