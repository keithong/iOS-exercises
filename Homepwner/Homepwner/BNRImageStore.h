//
//  BNRImageStore.h
//  Homepwner
//
//  Created by Keith Samson on 6/18/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRImageStore : NSObject

+(instancetype)sharedStore;

-(void)setImage:(UIImage *)image forKey:(NSString *)key;
-(UIImage *)imageforKey:(NSString *)key;
-(void)deleteImageForKey:(NSString *)key;

@end
