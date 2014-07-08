//
//  UIEBlocksViewController.m
//  UIElements
//
//  Created by Keith Samson on 6/25/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "UIEBlocksViewController.h"

@implementation UIEBlocksViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Set the navbar title to the selected item's class
    self.title = [NSString stringWithFormat:@"%@", self.class];
    
    [self attemptConnect];
}

-(void)attemptConnect
{
    
    NSString *url = [NSString stringWithFormat:@"http://ads.cyscorpions.com/en/trainingcenter/"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               
                               if (!connectionError) {
                                   [self.blockWebView loadRequest:request];
                                   return;
                                   
                               }
                               
                               UIAlertView *errorConnect = [[UIAlertView alloc]
                                                            initWithTitle:@"Error"
                                                            message:@"Failed connect. Please try again."
                                                            delegate:self
                                                            cancelButtonTitle:@"OK"
                                                            otherButtonTitles:nil];
                               [errorConnect show]; }
     
     ];
}

@end
