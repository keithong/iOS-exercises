//
//  BNRItemStore.m
//  Homepwner
//
//  Created by Keith Samson on 6/17/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"
#import "BNRImageStore.h"

@interface BNRItemStore()

@property (nonatomic) NSMutableArray *privateItems;

@end

@implementation BNRItemStore

+(instancetype)sharedStore
{
    static BNRItemStore *sharedStore;
    // Do I need to create a sharedStore?
    if (!sharedStore){
        sharedStore = [[self alloc] initPrivate];
    }
    return  sharedStore;
}

// If a programer calls [[BNRItemStore alloc] init],
// let him know the error of his ways
-(instancetype)init
{
    [NSException raise:@"Singleton" format:@"Use + [BNRItemStore sharedStore]"];
    return nil;
}

// Here is the real (secret) initializer
-(instancetype)initPrivate
{
    self = [super init];
    if(self){
        
        
        NSString *path = [self itemArchivePath];
        _privateItems = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        
        // If the array hadn't been saved previously, create a new empty one
        if(!_privateItems){
            _privateItems = [[NSMutableArray alloc] init];
        }
        
    }
    return self;
}

-(NSArray *)allItems
{

    return [self.privateItems copy];

}

-(BNRItem *)createItem
{
    /*
     -- we can now create our own item --
    // BNRItem *item = [BNRItem randomItem];
     
     */
    BNRItem *item = [[BNRItem alloc] init];
    [self.privateItems addObject:item];
    return item;
}
-(void)removeItem:(BNRItem *)item
{
    NSString *key = item.itemKey;
    [[BNRImageStore sharedStore] deleteImageForKey:key];
    [self.privateItems removeObjectIdenticalTo:item];
}
-(void)moveItemAtindex:(NSUInteger)fromIndex
               toIndex:(NSUInteger)toIndex
{
    
    if(fromIndex == toIndex){
        return;
    }
    
    // Get pointer to object being moved so you can re-insert it
    BNRItem *item = self.privateItems[fromIndex];
    
    // Remove item from array
    [self.privateItems removeObjectAtIndex:fromIndex];
    
    // Insert item in array at new location
    [self.privateItems insertObject:item atIndex:toIndex];
}

-(NSString *)itemArchivePath
{
    // Make sure that the first argument is NSDocumentDirectory
    // and not NSDocumentationDirectory
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    // Get the one document directory from that list
    NSString *documentDirectory = [documentDirectories firstObject];
    
    return [documentDirectory stringByAppendingPathComponent:@"items.archive"];
}

-(BOOL)saveChanges
{
    NSString *path = [self itemArchivePath];
    
    // Return YES on success
    return [NSKeyedArchiver archiveRootObject:self.privateItems toFile:path];
}

@end
