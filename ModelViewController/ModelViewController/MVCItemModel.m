//
//  MVCItemModel.m
//  ModelViewController
//
//  Created by Keith Samson on 6/26/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "MVCItemModel.h"

@implementation MVCItemModel
@synthesize itemTitle,itemDescription, itemCategory;

-(id)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        self.itemTitle = [dict objectForKey: @"itemTitle"];
        self.itemDescription = [dict objectForKey: @"itemDescription"];
        self.itemCategory = [dict objectForKey: @"itemCategory"];
    }
    
    return self;
}

@end
