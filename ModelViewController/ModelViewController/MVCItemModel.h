//
//  MVCItemModel.h
//  ModelViewController
//
//  Created by Keith Samson on 6/26/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MVCItemModel : NSObject
@property (strong, nonatomic) NSString *itemTitle;
@property (strong, nonatomic) NSString *itemDescription;
@property (strong, nonatomic) NSString *itemCategory;
-(id)initWithDictionary:(NSDictionary *)dict;
@end
