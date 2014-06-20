//
//  BNRWebViewController.h
//  Nerdfeed
//
//  Created by Keith Samson on 6/20/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BNRWebViewController;

@interface BNRWebViewController : UIViewController <UISplitViewControllerDelegate>

@property (nonatomic) NSURL *URL;
@property (nonatomic) BNRWebViewController *webViewController;

@end
