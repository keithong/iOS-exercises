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

-(void)splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)pc
{
    // If this bar button item does not have a title, it will not appear at all
    barButtonItem.title =@"Courses";
    
    // Take this bar button item and put it on the left side of the nav item
    self.navigationItem.leftBarButtonItem = barButtonItem;
}

-(void)splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Remove the bar button item from the navigation item
    // Double check if that is the correct button, even though we know it is
    
    if(barButtonItem == self.navigationItem.leftBarButtonItem){
        self.navigationItem.leftBarButtonItem = nil;
    }
    
}
@end
