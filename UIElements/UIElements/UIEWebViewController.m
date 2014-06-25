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
- (IBAction)attemptConnect:(id)sender {
    [self attemptConnect];
}

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)attemptConnect
{
    NSString *url = [NSString stringWithFormat:@"http://www.google.com"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    NSURLConnection *connect = [[NSURLConnection alloc] initWithRequest:request delegate:self];
  
    
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    UIAlertView *successConnecting = [[UIAlertView alloc]
                                      initWithTitle:@"Success!"
                                      message:@"You are now connected!"
                                      delegate:self
                                      cancelButtonTitle:@"OK"
                                      otherButtonTitles:nil];
    [successConnecting show];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    UIAlertView *errorConnecting = [[UIAlertView alloc]
                          initWithTitle:@"Error!"
                          message:@"Connection failed!"
                          delegate:self
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil];
    [errorConnecting show];
}

@end
