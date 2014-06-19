//
//  BNRImageStore.m
//  Homepwner
//
//  Created by Keith Samson on 6/18/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "BNRImageStore.h"

@interface BNRImageStore()

@property(nonatomic, strong)NSMutableDictionary *dictionary;

@end

@implementation BNRImageStore

+(instancetype)sharedStore
{
    static BNRImageStore *sharedStore;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,
                  ^{sharedStore = [[self alloc] initPrivate];}
                  );
    
    return sharedStore;
}

// No one should call init
- (instancetype)init
{

    [NSException raise:@"Singleton"
                 format:@"Use + [BNRImageStore sharedStore]"];
    return nil;

}

// Secret designated initializer
- (instancetype)initPrivate
{
    self = [super init];
    if(self){
        _dictionary = [[NSMutableDictionary alloc]init];
    }
    
    return self;
}

-(void)setImage:(UIImage *)image forKey:(NSString *)key
{
    [self.dictionary setObject:image forKey:key];
}

-(UIImage *)imageforKey:(NSString *)key
{
    return [self.dictionary objectForKey:key];
}

-(void)deleteImageForKey:(NSString *)key
{
    if(!key){
        return;
    }
    [self.dictionary removeObjectForKey:key];
}

@end
