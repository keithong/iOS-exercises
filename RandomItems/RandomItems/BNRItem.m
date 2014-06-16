//
//  BNRItem.m
//  RandomItems
//
//  Created by Keith Samson on 6/16/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

-(NSString *)description
{
    NSString *descriptionString =
    [[NSString alloc]initWithFormat:@"%@ (%@): Worth $%d, recorded on %@",
                                self.itemName,
                                self.serialNumber,
                                self.valueInDollars,
                                self.dateCreated];
    return descriptionString;
     
}

-(void)setItemName:(NSString *)str
{
    _itemName = str;
}

-(NSString *)itemName
{
    return _itemName;
}

-(void)setSerialNumber:(NSString *)str
{
    _serialNumber = str;
}

-(NSString *)serialNumber
{
    return _serialNumber;
}

-(void)setValueInDollars:(int)v
{
    _valueInDollars = v;
}
-(int)valueInDollars
{
    return _valueInDollars;
}

-(NSDate *)dateCreated
{
    return _dateCreated;
}


@end
