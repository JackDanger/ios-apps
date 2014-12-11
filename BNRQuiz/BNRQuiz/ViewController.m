//
//  ViewController.m
//  BNRQuiz
//
//  Created by Jack Danger on 12/8/14.
//  Copyright (c) 2014 Jack Danger. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) int currentQuestionIndex;

@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;

@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;

@end

@implementation ViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.questions = @[@"What do you call the indentation on the bottom of a wine bottle?",
                           @"What is the name of the ring in the middle of a lamp shade?",
                           @"What are the two closest (living) relatives of homo sapiens?"];
        self.answers = @[@"Punt",
                         @"Harp",
                         @"Bonobos, Chimpanzees"];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showQuestion:(id)sender {
    self.questionLabel.text = self.questions[self.currentQuestionIndex];
}
- (IBAction)showAnswer:(id)sender {
    self.answerLabel.text = self.answers[self.currentQuestionIndex];
    self.currentQuestionIndex++;
    if (self.currentQuestionIndex >= self.questions.count) {
        self.currentQuestionIndex = 0;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
