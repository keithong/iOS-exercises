//
//  GameViewController.m
//  Sample
//
//  Created by Keith Samson on 7/7/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "GameViewController.h"
@interface GameViewController ()<UICollisionBehaviorDelegate>
@property (retain, nonatomic) UIView *block;
@property (retain, nonatomic) UIView *player;
@property (retain, nonatomic) UIDynamicAnimator *animator;
@property (retain, nonatomic) UICollisionBehavior *collider;
@property (retain, nonatomic) UICollisionBehavior *blockCollider;
@property (retain, nonatomic) UICollisionBehavior *playerCollider;
@property (retain, nonatomic) UIDynamicItemBehavior *playerProperty;
@property (retain, nonatomic) UIDynamicItemBehavior *blockProperty;
@property (retain, nonatomic) UITapGestureRecognizer *tapRecognizer;
@property (retain, nonatomic) NSTimer *blockTimer;

@property (nonatomic) int screenHeight;
@property (nonatomic) int screenWidth;
@property (nonatomic) int blockHeight;
@property (nonatomic) int blockWidth;
@property (nonatomic) int playerHeight;
@property (nonatomic) int playerWidth;
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
    self.animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    [self gameElements];
    
    self.blockTimer = [NSTimer scheduledTimerWithTimeInterval:4.0 target:self selector:@selector(createAnotherBlock) userInfo:nil repeats:YES];
    
    self.tapRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(punchBlock)];
    [self.view addGestureRecognizer:self.tapRecognizer];
    
    
    
    [self blockTimer];
        [self isColliding];
    [self playerBlockCollider];
    
   }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)gameElements
{
    self.screenHeight = [UIScreen mainScreen].bounds.size.height;
    self.screenWidth = [UIScreen mainScreen].bounds.size.width;
    self.blockHeight = self.screenHeight/2;
    self.blockWidth = 50;
    self.playerHeight = 50;
    self.playerWidth = 100;
}

-(UIView *)createPlayer
{
    self.player = [[UIView alloc]init];
    
    [self.player setFrame:CGRectMake(0, (self.screenHeight/2) + self.playerHeight, self.playerWidth, self.playerHeight)];
    self.player.backgroundColor = [UIColor greenColor];
    
    self.playerProperty = [[UIDynamicItemBehavior alloc]initWithItems:@[self.player]];
    self.playerProperty.allowsRotation = NO;
    self.playerProperty.density = 5;
    
    
    [self.view addSubview:self.player];
    [self.animator addBehavior:self.playerProperty];
    
    return self.player;
    
}

-(UIView *)createBlock
{
    self.block = [[UIView alloc]init];
    [self.block setFrame:CGRectMake(self.screenWidth - self.blockWidth, self.screenHeight - self.blockHeight, self.blockWidth, self.blockHeight)];
    self.block.backgroundColor = [UIColor grayColor];
    
    self.blockProperty = [[UIDynamicItemBehavior alloc]initWithItems:@[self.block]];
    self.blockProperty.allowsRotation = NO;
    self.blockProperty.density = 10;
    
    
    [self.view addSubview:self.block];
    [self.animator addBehavior:self.blockProperty];
    
    return self.block;
}

-(void)pushBlock:(UIView *)block
{
    UIPushBehavior *blockPusher = [[UIPushBehavior alloc] initWithItems:@[block] mode:UIPushBehaviorModeInstantaneous];
    blockPusher.pushDirection = CGVectorMake(-10, 0);
    blockPusher.active = YES;
    [self.animator addBehavior:blockPusher];
    
}

-(void)pushPlayer:(UIView *)player
{
    UIPushBehavior *playerPusher = [[UIPushBehavior alloc] initWithItems:@[player] mode:UIPushBehaviorModeInstantaneous];
    playerPusher.pushDirection = CGVectorMake(5, 0);
    playerPusher.active = YES;
    [self.animator addBehavior:playerPusher];
}

-(void)playerBlockCollider
{
    self.collider = [[UICollisionBehavior alloc] init];
    self.collider.collisionDelegate = self;
    self.collider.collisionMode = UICollisionBehaviorModeEverything;
    self.collider.translatesReferenceBoundsIntoBoundary = YES;


    [self.collider addItem:[self createPlayer]];
    [self.collider addItem:[self createBlock]];
    [self pushBlock:self.collider.items[1]];
    [self.animator addBehavior:self.collider];
}

-(void)createAnotherBlock
{
    [self.collider addItem:[self createBlock]];
    [self pushBlock:self.collider.items[self.collider.items.count-1]];
    [self.animator addBehavior:self.collider];
}

-(void)punchBlock
{
  
//    NSLog(@"%@", self.collider.items[0]);
//    if (self.tapRecognizer.state == UIGestureRecognizerStateEnded) {
//        [self returnPlayer:self.collider.items[0]];
//        [self.animator addBehavior:self.collider];
//        NSLog(@"tap released");
//        return;
//    }
    [self pushPlayer:self.collider.items[0]];
    [self.animator addBehavior:self.collider];

    
}

-(BOOL)isColliding
{
    if (CGRectIntersectsRect(self.player.frame, self.block.frame)) {
         NSLog(@"collides");
        return YES;
    }
    NSLog(@"not colliding");
    return NO;
}


/*
 -(void)animateBlock:(UIView *)block
 {
 int screenWidth = [UIScreen mainScreen].bounds.size.width;
 int blockWidth = 50;
 CGRect moveBlock = block.frame;
 moveBlock.origin.x -= screenWidth + blockWidth;
 
 
 [UIView animateWithDuration:2.0
 delay:0
 options: UIViewAnimationOptionTransitionNone
 animations:^{
 block.frame = moveBlock;
 }
 completion:^(BOOL finished) {
 [self animateBlock:[self createBlock]];
 }
 ];
 }
 */


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