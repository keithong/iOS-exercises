//
//  BNRWebViewController.m
//  Nerdfeed
//
//  Created by Keith Samson on 6/20/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "BNRWebViewController.h"

@implementation BNRWebViewController

-(void)loadView
{
    UIWebView *webView = [[UIWebView alloc]init];
    webView.scalesPageToFit = YES;
    self.view = webView;
}

-(void)setURL:(NSURL *)URL
{
    _URL = URL;
    if (_URL){
        NSURLRequest *req = [NSURLRequest requestWithURL:_URL];
        [(UIWebView *)self.view loadRequest:req];
    }
}

@end
