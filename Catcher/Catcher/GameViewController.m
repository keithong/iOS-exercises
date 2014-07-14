//
//  GameViewController.m
//  Catcher
//
//  Created by Keith Samson on 7/10/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController () <UICollisionBehaviorDelegate>
@property (retain, nonatomic) NSTimer *foodTimer;
@property (retain, nonatomic) UIView *basket;
@property (retain, nonatomic) UIView *food;
@property (retain, nonatomic) UIDynamicItemBehavior *basketProperty;
@property (retain, nonatomic) UIDynamicItemBehavior *foodProperty;
@property (retain, nonatomic) UICollisionBehavior *collider;
@property (retain, nonatomic) UIGravityBehavior *gravity;
@property (retain, nonatomic) UIDynamicAnimator *animator;

@property (nonatomic) int screenWidth;
@property (nonatomic) int screenHeight;
@property (nonatomic) int basketWidth;
@property (nonatomic) int basketHeight;
@property (nonatomic) int foodWidth;
@property (nonatomic) int foodHeight;
@property (nonatomic) int foodRandomPosition;
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
    [self gameElements];
    
    //    [self createBasket];
    //    [self createAnotherFood];
    //    [self foodBasketCollider];
    //    [self rainFood];
    self.foodTimer = [NSTimer scheduledTimerWithTimeInterval:.5 target:self selector:@selector(createAnotherFood) userInfo:nil repeats:YES];
    
    [self foodBasketCollider];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)gameElements
{
    self.screenWidth = [UIScreen mainScreen].bounds.size.width;
    self.screenHeight = [UIScreen mainScreen].bounds.size.height;
    self.basketWidth = 60;
    self.basketHeight= 20;
    self.foodWidth = 15;
    self.foodHeight = 15;
    self.animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    self.gravity = [[UIGravityBehavior alloc]init];
    
}

-(UIView *)createBasket
{
    self.basket = [[UIView alloc]initWithFrame:
                   CGRectMake(CGRectGetMidX([UIScreen mainScreen].bounds) - self.basketWidth,
                              self.screenHeight-self.basketHeight,
                              self.basketWidth,
                              self.basketHeight)];
    
    self.basket.backgroundColor = [UIColor grayColor];
    
    self.basketProperty = [[UIDynamicItemBehavior alloc]initWithItems:@[self.basket]];
    self.basketProperty.allowsRotation = NO;
    self.basketProperty.density = 10000;
    
    
    [self.view addSubview:self.basket];
    [self.animator addBehavior:self.basketProperty];
    
    return self.basket;
}

-(UIView *)createFood
{
    self.foodRandomPosition = arc4random() % self.screenWidth;
    self.food = [[UIView alloc] initWithFrame:CGRectMake(self.foodRandomPosition, 0, self.foodWidth, self.foodHeight)];
    self.food.backgroundColor = [UIColor brownColor];
    
    self.foodProperty = [[UIDynamicItemBehavior alloc]initWithItems:@[self.food]];
    self.foodProperty.allowsRotation = YES;
    
    
    [self.view addSubview:self.food];
    [self.animator addBehavior:self.foodProperty];
    return self.food;
}

-(void)rainFood:(UIView *)food
{
    [self.gravity addItem:food];
    [self.animator addBehavior:self.gravity];
//    NSLog(@"%@", self.gravity.items.lastObject);
}

-(void)foodBasketCollider
{
    self.collider = [[UICollisionBehavior alloc] init];
    self.collider.collisionDelegate = self;
    self.collider.collisionMode = UICollisionBehaviorModeEverything;
    [self.collider addItem:[self createBasket]];
    [self.animator addBehavior:self.collider];
}

-(void)createAnotherFood
{
    [self rainFood:[self createFood]];
    [self.collider addItem:self.gravity.items.lastObject];
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
