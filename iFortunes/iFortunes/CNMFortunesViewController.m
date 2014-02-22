//
//  CNMViewController.m
//  iFortunes
//
//  Created by Collin Mann on 2/13/14.
//  Copyright (c) 2014 Collin Mann. All rights reserved.
//

#import "CNMFortunesViewController.h"


@interface CNMFortunesViewController ()

@property (strong, nonatomic) CNMFortunesModel *fortunesModel;


@end

@implementation CNMFortunesViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
     CNMFortunesModel *fortunesModel = [[CNMFortunesModel alloc] init];
    
        UITapGestureRecognizer *singleTap =
        [[UITapGestureRecognizer alloc]
         initWithTarget:self
         action: @selector(singleTapRecognized:)];
        [self.view addGestureRecognizer:singleTap];
        
        UITapGestureRecognizer *doubleTap =
        [[UITapGestureRecognizer alloc]
         initWithTarget:self
         action: @selector(doubleTapRecognized:)];
        doubleTap.numberOfTapsRequired = 2;
        [self.view addGestureRecognizer:doubleTap];
    
    [singleTap requireGestureRecognizerToFail:doubleTap];
        //log the initial number of answers in the array for following tests
        NSString *b = [[NSString alloc] initWithFormat:@"%d",[fortunesModel numberOfAnswers]];
        NSLog(b);
        //remove the 1st object in the array and log the number of answers to test
        [fortunesModel removeAnswerAtIndex:0];
        NSString *k = [[NSString alloc] initWithFormat:@"%d",[fortunesModel numberOfAnswers]];
        NSLog(k);
        //insert j into the array and log the number of answers to test
        NSString *j = @"test";
        [fortunesModel insertAnswer:j atIndex:0];
        NSString *m = [[NSString alloc] initWithFormat:@"%d",[fortunesModel numberOfAnswers]];
        NSLog(m);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) singleTapRecognized: (UITapGestureRecognizer *)recognizer {
    CNMFortunesModel *fortunesModel = [[CNMFortunesModel alloc] init];
            NSString *answer = [[NSString alloc]
                                initWithFormat:@"%@",
                                [fortunesModel randomAnswer]];
    if(answer){
        [self displayAnswer: answer];
        NSUInteger index = [fortunesModel indexOfAnswer:answer];
        [fortunesModel removeAnswerAtIndex: index];
    }
}

- (void) doubleTapRecognized: (UITapGestureRecognizer *)recognizer {
    CNMFortunesModel *fortunesModel = [[CNMFortunesModel alloc] init];
    [self displayAnswer: [fortunesModel secretAnswer]];
}

- (BOOL) canBecomeFirstResponder {
    return YES;
}

- (void) viewDidAppear:(BOOL)animated {
    [self becomeFirstResponder];
}

- (void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake) {
        CNMFortunesModel *fortunesModel = [[CNMFortunesModel alloc] init];
        NSString *answer = [[NSString alloc]
                            initWithFormat:@"%@",
                            [fortunesModel randomAnswer]];
        if(answer){
            [self displayAnswer: answer];
            NSUInteger index = [fortunesModel indexOfAnswer:answer];
            [fortunesModel removeAnswerAtIndex: index];
        }
    }
}

- (void) displayAnswer:(NSString *)answer {
        [UIView animateWithDuration:1.0
                         animations:^{
                             self.answerLabel.alpha = 0;
                         }
                         completion:^(BOOL finished) {
                             [self animateAnswer: answer];
                         }];
    }
    
- (void) animateAnswer:(NSString *)answer {
        [UIView animateWithDuration:1.0
             animations:^{
                 self.answerLabel.text = answer;
                 
                 if(self.answerLabel.textColor  == UIColor.blackColor) {
                     self.answerLabel.textColor = [UIColor
                            colorWithRed: (153.0f/255.0f)
                            green:0.0 blue:0.0 alpha: 1.0];
                 } else {
                     self.answerLabel.textColor = UIColor.blackColor;
                 }
                 self.answerLabel.alpha = 1;

             }];
    }


@end
