//
//  GameViewController.m
//  Sample
//
//  Created by Keith Samson on 7/7/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()
@end

@implementation GameViewController

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
    // Do any additional setup after loading the view.
    
    
    [self createBlock];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createBlock
{
    int bottomScreen = [UIScreen mainScreen].bounds.size.height;
    int blockHeight = 110;
    int blockWidth = 50;
    
    UIView *block = [[UIView alloc]init];
    
    [block setFrame:CGRectMake(CGRectGetMidX([[UIScreen mainScreen] bounds]), bottomScreen - blockHeight, blockWidth, blockHeight)];
    block.backgroundColor = [UIColor redColor];
    [self.view addSubview:block];
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
