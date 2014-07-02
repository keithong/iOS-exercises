//
//  BNRQuizViewController.m
//  Quiz
//
//  Created by Keith Samson on 6/13/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "BNRQuizViewController.h"

@interface BNRQuizViewController ()

@property (nonatomic) int currentQuestionIndex;

@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;

@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;

@end

@implementation BNRQuizViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil
                        bundle:(NSBundle *)nibBundleOrNil
{
    // Call the init method implemented by the superclass
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){
        // Create two arrays filled with questions and answers
        // and make the pointers point to them
    }
    self.questions = @[@"What does the fox say?",
                       @"What is 7+7?",
                       @"What is the capital of Philppines?"
                       ];
    
    self.answers = @[@"Hatee-hatee-hatee-ho!",
                     @"14",
                     @"Manila"
                     ];
    
    // Set the tab bar item's title
    self.tabBarItem.title = @"Quiz";
    
    // Create a UIImage from a file
    // This will use Hypno@2x.png on retina display devices
    UIImage *image = [UIImage imageNamed:@"Hypno.png"];
    
    // Put that image on the tab bar item
    self.tabBarItem.image = image;
    
    // Return the address of the new object
    return self;

}

-(IBAction)showQuestion:(id)sender
{
    // Step to the next question
    self.currentQuestionIndex++;
    
    // Am I past the last question?
    if(self.currentQuestionIndex == [self.questions count]){
    
        // Go back to the first question
        self.currentQuestionIndex = 0;
    }
    
    // Get the string at that index in the questions array
    NSString *question = self.questions[self.currentQuestionIndex];
    
    // Display the string in the question label
    self.questionLabel.text = question;
    
    // Reset the answer label
    self.answerLabel.text = @"???";

}
-(IBAction)showAnswer:(id)sender
{
    
    // What is the answer to the current question?
    NSString *answer = self.answers[self.currentQuestionIndex];
    
    // Display it in the answer label
    self.answerLabel.text = answer;

}

@end