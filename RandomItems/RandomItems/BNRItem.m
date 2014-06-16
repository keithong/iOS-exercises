//
//  BNRItem.m
//  RandomItems
//
//  Created by Keith Samson on 6/16/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

+(instancetype)randomItem
{
    // Create an immutable array of three adjectives
    NSArray *randomAjectiveList = [[NSArray alloc] initWithObjects:@"Fluffy", @"Rusty", @"Shiny", nil];
    
    // Create an immutable array of three nouns
    NSArray *randomNounList = [[NSArray alloc] initWithObjects:@"Bear",@"Spork",@"Mac", nil];
    
    // Get the index of a random adjective/noun from the list
    // Note: the % operator, called the modulo operator, gives you ther remainder
    // So adjectiveIndex is a random number from 0 to 2 inclusive.
    
    NSInteger adjectiveIndex = arc4random() % [randomAjectiveList count];
    NSInteger nounIndex = arc4random() % [randomNounList count];
    
    // Note that NSInteger is not an object, but a type definition for "long"
    
    NSString *randomName = [NSString stringWithFormat:@"%@ %@", [randomAjectiveList objectAtIndex:adjectiveIndex], [randomNounList objectAtIndex:nounIndex]];
    
    int randomValue = arc4random() % 100;
    
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    '0' + arc4random() % 10];
    
    BNRItem *newItem = [[self alloc] initWithItemName:randomName
                                       valueInDollars:randomValue
                                        serialNumber:randomSerialNumber];
    return newItem;
}

-(instancetype)initWithItemName:(NSString *)name valueInDollars:(int)value serialNumber:(NSString *)sNumber
{

    // Call the superclass' designated initializer
    self = [super init];
    
    // Did the superclass' designated initializer succeed?
    if(self){
    
        // Give the instance variables initial values
        _itemName = name;
        _serialNumber = sNumber;
        _valueInDollars = value;
        _dateCreated = [[NSDate alloc] init];
    }
    
    // Return the address of the newly initialized object
    return self;
}

-(instancetype)initWithItemName:(NSString *)name
{
    return [self initWithItemName:name valueInDollars:0 serialNumber:@""];
}

-(instancetype)init
{
    return [self initWithItemName:@"Item"];
}

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

-(void)dealloc
{
    NSLog(@"Destroyed: %@", self);
}

@end
