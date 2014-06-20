//
//  BNRItemCell.m
//  Homepwner
//
//  Created by Keith Samson on 6/19/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "BNRItemCell.h"

@implementation BNRItemCell

-(IBAction)showImage:(id)sender
{
    if(self.actionBlock){
        self.actionBlock();
    }
}
@end
