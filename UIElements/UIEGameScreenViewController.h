//
//  UIEGameScreenViewController.h
//  UIElements
//
//  Created by Keith Samson on 6/25/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIEPauseScreenViewController.h"

@interface UIEGameScreenViewController : UIViewController <PauseScreenViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIButton *pauseButton;

@end
