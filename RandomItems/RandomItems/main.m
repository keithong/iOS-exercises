//
//  main.m
//  RandomItems
//
//  Created by Keith Samson on 6/16/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {

        // Create a mutable array object, store its address in items variable
        NSMutableArray *items = [[NSMutableArray alloc]init];
        
        // Send the message addObject: to the NSMutableArray pointed to
        // by the variable items, passing a string each time
        
        [items addObject:@"One"];
        [items addObject:@"Two"];
        [items addObject:@"Three"];
        
        // Send another message, insertObject:atIndext:, to that same array object
        [items insertObject:@"Zero" atIndex:0];
        
        
        /* Enumerate using for loop
         for (int i = 0; i < [items count]; i++){
            NSString *item = [items objectAtIndex:i];
            NSLog(@"%@",item);
        } 
        */
        
        // Enumerate using fast enum
        for (NSString *item in items){
            // Log the description of item
            NSLog(@"%@", item);
        }
        
        // Destroy the mutable array object
        items = nil;
        
        
        
    }
    return 0;
}

