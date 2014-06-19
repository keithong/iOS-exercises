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

-(NSString *)imagePathForKey:(NSString *)key
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentDirectory = [documentDirectories firstObject];
    return [documentDirectory stringByAppendingPathComponent:key];
}


-(void)setImage:(UIImage *)image forKey:(NSString *)key
{
    [self.dictionary setObject:image forKey:key];
    
    // Create full path for image
    NSString *imagePath = [self imagePathForKey:key];
    
    // Turn image into JPEG data
    NSData *data = UIImageJPEGRepresentation(image, 0.5);
    
    // Write it to full path
    [data writeToFile:imagePath atomically:YES];
    
}

-(UIImage *)imageforKey:(NSString *)key
{
    /* 
     -- we want our image to come from the filesystem
    return [self.dictionary objectForKey:key];
    */
    
    UIImage *result = self.dictionary[key];
    
    if(!result){
        NSString *imagePath = [self imagePathForKey:key];
        
        // Create UIImage object from file
        result = [UIImage imageWithContentsOfFile:imagePath];
        
        // If we found an image on the file system, place it into the cache
        
        if(result){
            self.dictionary[key] = result;
        } else {
            NSLog(@"Error: unable to find %@", imagePath);
        }
    }
    return result;
    
}

-(void)deleteImageForKey:(NSString *)key
{
    if(!key){
        return;
    }
    [self.dictionary removeObjectForKey:key];
    
    NSString *imagePath = [self imagePathForKey:key];
    [[NSFileManager defaultManager] removeItemAtPath:imagePath error:nil];
}

@end
