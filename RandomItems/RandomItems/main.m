//
//  main.m
//  RandomItems
//
//  Created by Keith Samson on 6/16/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {

        // Create a mutable array object, store its address in items variable
        NSMutableArray *items = [[NSMutableArray alloc]init];
        
        // Send the message addObject: to the NSMutableArray pointed to
        // by the variable items, passing a string each time
        
        // [items addObject:@"One"];
        // [items addObject:@"Two"];
        // [items addObject:@"Three"];
        
        // Send another message, insertObject:atIndext:, to that same array object
        //  [items insertObject:@"Zero" atIndex:0];
        
        
        /* Enumerate using for loop
         for (int i = 0; i < [items count]; i++){
            NSString *item = [items objectAtIndex:i];
            NSLog(@"%@",item);
        } 
        */
        
        // Enumerate using fast enum
        // for (NSString *item in items){
            // Log the description of item
            // NSLog(@"%@", item);
        //}
        
        // Code with initializers
        // BNRItem *item = [[BNRItem alloc]
        //        initWithItemName:@"Red Sofa"
        //                 valueInDollars:100
        //                 serialNumber:@"A1B2C3"];
        /*
        Code without initializers
     
        BNRItem *item = [[BNRItem alloc] init];
        
        // This creates an NSString, "Red Sofa" and gives it to the BNRItem
        // [item setItemName:@"Red Sofa"];
            item.itemName = @"Red Sofa";
        
        // This creates an NSString, "A1B2C3" and gives it ot the BNRItem
        // [item setSerialNumber:@"A1B2C3"];
            item.serialNumber = @"A1B2C3";
        
        // This sends the value 100 to be used as the valueInDollars of this BNRItem
        // [item setValueInDollars:100];
            item.valueInDollars = 100;
        */
        
        /* 
         NSLog(@"%@ %@ %@ %d",
              [item itemName],
              [item dateCreated],
              [item serialNumber],
              [item valueInDollars]); 
         */
        
        /*
        NSLog(@"%@ %@ %@ %d",
              item.itemName,
              item.dateCreated,
              item.serialNumber,
              item.valueInDollars);
         */
        
        // The %@ token is replaced with the result of sendint
        // the description message to the corresponding argument
        // NSLog(@"%@", item);
        
        // BNRItem *itemWithName = [[BNRItem alloc] initWithItemName:@"Blue Sofa"];
        // NSLog(@"%@", itemWithName);
        
        // BNRItem *itemWithNoName = [[BNRItem alloc]init];
        // NSLog(@"%@", itemWithNoName);
        
        /*
        for (int i = 0; i < 10; i++) {
            BNRItem *item = [BNRItem randomItem];
            [items addObject:item];
        }
        */
        
        BNRItem *backpack = [[BNRItem alloc]initWithItemName:@"Backpack"];
        [items addObject:backpack];
        
        BNRItem *calculator = [[BNRItem alloc]initWithItemName:@"Calculator"];
        [items addObject:calculator];
        
        backpack.containedItem = calculator;
        backpack = nil;
        calculator = nil;
        
        
        for (BNRItem *item in items) {
            NSLog(@"%@", item);
        }
        
        
        NSLog(@"Setting items to nil...");
        
        // Destroy the mutable array object
        items = nil;
        
        
        
    }
    return 0;
}
