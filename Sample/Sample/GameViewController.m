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
    [self animatePlayer:[self player]];
    [self animateBlock:[self createBlock]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIView *)player
{
    int screenHeight = [UIScreen mainScreen].bounds.size.height;
    int screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    int playerHeight = 90;
    int playerWidth = 25;
    
    UIView *player = [[UIView alloc]init];
    
    [player setFrame:CGRectMake(0, screenHeight - playerHeight, playerWidth, playerHeight)];
    player.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:player];
    return player;
    
}

-(UIView *)createBlock
{
    int screenHeight = [UIScreen mainScreen].bounds.size.height;
    int screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    int blockHeight = screenHeight/2;
    int blockWidth = 50;
    
    UIView *block = [[UIView alloc]init];
    
    [block setFrame:CGRectMake((screenWidth + blockWidth) - blockWidth, screenHeight - blockHeight, blockWidth, blockHeight)];
    block.backgroundColor = [UIColor grayColor];
    
    
    [self.view addSubview:block];
    return block;
}

-(void)animateBlock:(UIView *)block
{
    int screenWidth = [UIScreen mainScreen].bounds.size.width;
    int blockWidth = 50;
    CGRect moveBlock = block.frame;
    moveBlock.origin.x -= screenWidth + blockWidth;
    
    [UIView animateWithDuration:2.0
                          delay:.1
                        options: UIViewAnimationOptionRepeat
                     animations:^{
                         block.frame = moveBlock;
                         NSLog(@"%d",screenWidth);
                     }
                     completion:^(BOOL finished) {
                     }
     ];
}

-(void)animatePlayer:(UIView *)player
{
    int screenWidth = [UIScreen mainScreen].bounds.size.width;
    int playerWidth = 25;
    CGRect movePlayer = player.frame;
    movePlayer.origin.x += screenWidth - 20;
    [UIView animateWithDuration:6.0
                     animations:^{
                         player.frame = movePlayer;
                         NSLog(@"%d",screenWidth);
                     }
     ];
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
