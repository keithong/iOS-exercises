//
//  UIEWebViewController.h
//  UIElements
//
//  Created by Keith Samson on 6/25/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIEWebViewController : UIViewController <NSURLConnectionDelegate, NSURLConnectionDataDelegate>
@property (weak, nonatomic) IBOutlet UIButton *connectButton;

@end
