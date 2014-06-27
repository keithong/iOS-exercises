//
//  GameScene.m
//  Break
//
//  Created by Keith Samson on 6/27/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "GameScene.h"
@interface GameScene ()
@property BOOL contentCreated;
@property (retain, nonatomic) SKSpriteNode *paddle;
@property (retain, nonatomic) SKSpriteNode *coin;
@property (retain, nonatomic) SKSpriteNode *floor;
@property (retain, nonatomic) SKAction *actionMoveLeft;
@property (retain, nonatomic) SKAction *actionMoveRight;
@property (nonatomic) int x;
@property (nonatomic) int randomXPosition;
@end

@implementation GameScene

-(void)didMoveToView:(SKView *)view
{
    if (!self.contentCreated)
    {
        [self createSceneContents];
        self.contentCreated = YES;
    }
}

-(void)createSceneContents
{
    
    self.backgroundColor = [SKColor grayColor];
    self.scaleMode = SKSceneScaleModeAspectFit;
    [self addChild: [self paddleNode]];
//    [self addChild:[self floorNode]];
    
    SKAction *makeCoins = [SKAction sequence: @[
                                                [SKAction performSelector:@selector(addCoinNode) onTarget:self],
                                                [SKAction waitForDuration:0.20 withRange:0.15]
                                                ]];
    
    [self runAction: [SKAction repeatActionForever:makeCoins]];
    
}

-(SKSpriteNode *)paddleNode
{
    // Add the sprite of paddle
    self.paddle = [[SKSpriteNode alloc] initWithColor:[SKColor whiteColor] size:CGSizeMake(100, 15)];
    self.paddle.position = CGPointMake(CGRectGetMidX(self.frame), 10);
    
    // Add the physical body of paddle
    self.paddle.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.paddle.size];
    self.paddle.physicsBody.dynamic = NO;
    
    self.actionMoveLeft = [SKAction moveByX:-30 y:0 duration:.2];
    self.actionMoveRight = [SKAction moveByX:30 y:0 duration:.2];
    return self.paddle;
}

-(SKSpriteNode *)coinNode
{
    self.coin = [[SKSpriteNode alloc] initWithColor:[SKColor yellowColor] size:CGSizeMake(20, 20)];
    self.coin.name = @"coin";
    self.coin.position = CGPointMake(self.randomXPosition = arc4random() % (int)self.frame.size.width, self.frame.size.height);
    
    // Add the physical body of coin
    self.coin.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.coin.size];
    self.coin.physicsBody.dynamic = YES;
    
    return self.coin;
}

-(void)addCoinNode
{
    [self addChild:self.coinNode];
}

-(SKSpriteNode *)floorNode
{
    self.floor = [[SKSpriteNode alloc] initWithColor:[SKColor blackColor] size:CGSizeMake(self.frame.size.width, 1)];
    self.floor.position = CGPointMake(CGRectGetMidX(self.frame), 0);
    
    // Add the physical body of the floor
    self.floor.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.floor.size];
    self.floor.physicsBody.dynamic = NO;
    
    return self.floor;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInNode:self.scene];
    if(touchLocation.x > self.paddle.position.x){
        if(self.paddle.position.x < 270){
            [self.paddle runAction:self.actionMoveRight];
        }
    }else{
        if(self.paddle.position.x > 50){
            [self.paddle runAction:self.actionMoveLeft];
        }
    }
}


-(void)didSimulatePhysics
{
    [self enumerateChildNodesWithName:@"coin" usingBlock:^(SKNode *node, BOOL *stop) {
        if (node.position.y < 0)
            [node removeFromParent];
    }];
}
@end
