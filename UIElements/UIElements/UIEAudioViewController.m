//
//  UIEAudioViewController.m
//  UIElements
//
//  Created by Keith Samson on 6/30/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "UIEAudioViewController.h"

@interface UIEAudioViewController ()

@property (retain, nonatomic) AVAudioPlayer *audioPlayer;

@end

@implementation UIEAudioViewController

- (IBAction)stopMusic:(id)sender {
    [self.audioPlayer stop];
    self.audioPlayer.currentTime = 0;
}

- (IBAction)playMusic:(id)sender {
    self.audioPlayer.numberOfLoops = -1;
    [self.audioPlayer play];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSBundle *mainBundle = [NSBundle mainBundle];
    
    NSString *filePath = [mainBundle pathForResource:@"epicsaxguy" ofType:@"mp4"];
    NSData *fileData = [NSData dataWithContentsOfFile:filePath];
    
    self.audioPlayer = [[AVAudioPlayer alloc] initWithData:fileData error:nil];
    [self.audioPlayer prepareToPlay];
}


@end
