//
//  UIEWebViewController.m
//  UIElements
//
//  Created by Keith Samson on 6/25/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "UIEWebViewController.h"

@interface UIEWebViewController ()

@end

@implementation UIEWebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self attemptConnect];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)attemptConnect
{
    NSString *url = [NSString stringWithFormat:@"http://ads.cyscorpions.com/en/trainingcenter/"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    NSURLConnection *connect = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [self.myWebView loadRequest:request];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    UIAlertView *errorConnect = [[UIAlertView alloc]
                          initWithTitle:@"Error"
                          message:@"Failed connect. Please try again."
                          delegate:self
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil];
    
    [errorConnect show];
}

@end
