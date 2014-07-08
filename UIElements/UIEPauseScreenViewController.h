//
//  UIEPauseScreenViewController.h
//  UIElements
//
//  Created by Keith Samson on 6/25/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PauseScreenViewControllerDelegate <NSObject>
-(void)pauseGameDelegateMethod;
@optional -(void)callDelegate;
@end

@interface UIEPauseScreenViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) id <PauseScreenViewControllerDelegate> delegate;


@end
