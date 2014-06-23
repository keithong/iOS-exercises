//
//  BNRItemStore.h
//  Homepwner
//
//  Created by Keith Samson on 6/17/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BNRItem;

@interface BNRItemStore : NSObject

@property(nonatomic, readonly, copy)NSArray *allItems;

// Notice that this is a class method and prefixed with a + instead of a -
+(instancetype)sharedStore;
-(BNRItem *)createItem;
-(void)removeItem:(BNRItem *)item;
-(void)moveItemAtindex:(NSUInteger)fromIndex
               toIndex:(NSUInteger)toIndex;
-(BOOL)saveChanges;
-(NSArray *)allAssetTypes;
@end
