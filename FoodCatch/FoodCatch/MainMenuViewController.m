//
//  MainMenuViewController.m
//  FoodCatch
//
//  Created by Keith Samson on 7/17/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "MainMenuViewController.h"
#import "InstructionsViewController.h"
#import "HighScoreViewController.h"
#import "AboutViewController.h"
#import "GameViewController.h"

@interface MainMenuViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnAbout;
@property (weak, nonatomic) IBOutlet UIButton *btnHighScores;
@property (weak, nonatomic) IBOutlet UIButton *btnInstructions;
@property (weak, nonatomic) IBOutlet UIButton *btnPlay;

@end

@implementation MainMenuViewController
- (IBAction)goToPlay:(id)sender {
    
    GameViewController *gameVC = [[GameViewController alloc]init];
    [self.navigationController pushViewController:gameVC animated:NO];
    
}
- (IBAction)goToAbout:(id)sender {
    
    AboutViewController *aboutVC = [[AboutViewController alloc]init];
    
                                    [self.navigationController pushViewController:aboutVC animated:NO];
    
}
- (IBAction)goToHighScore:(id)sender {
    
    HighScoreViewController *highScoresVC = [[HighScoreViewController alloc]init];
    
    [self.navigationController pushViewController:highScoresVC animated:NO];
    
}
- (IBAction)goToInstructions:(id)sender {
    InstructionsViewController *instructionsVC = [[InstructionsViewController alloc]init];
    
    [self.navigationController pushViewController:instructionsVC animated:NO];
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

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
