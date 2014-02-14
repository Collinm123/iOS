//
//  CNMViewController.m
//  LeftvsRight
//
//  Created by Collin Mann on 2/6/14.
//  Copyright (c) 2014 Collin Mann. All rights reserved.
//

#import "CNMViewController.h"

@interface CNMViewController ()

@end

@implementation CNMViewController

- (void)viewDidLoad{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.messageLabel.text = @"";
    
    [self.leftButton setTitle:@"" forState:UIControlStateNormal];
    [self.rightButton setTitle:@"" forState:UIControlStateNormal];
    self.leftButton.layer.cornerRadius = 8;
    self.rightButton.layer.cornerRadius = 8;

}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)handleLeftClick:(id)sender {
    [self.nameTextField resignFirstResponder];
    if (![self.nameTextField.text  isEqual: @""]) {
            self.messageLabel.text = [NSString stringWithFormat:@"%@, it sounds like you're a pretty logical person. And possibly quite boring.", [self.nameTextField.text capitalizedString]] ;
            self.nameTextField.text = @"";
    }else{
        self.messageLabel.text = @"Please enter your name in the text field above.";
    }

}

- (IBAction)handleRightClick:(id)sender {
    [self.nameTextField resignFirstResponder];
     if (![self.nameTextField.text  isEqual: @""]) {
         self.messageLabel.text = [NSString stringWithFormat:@"%@, it sounds like you're an extremely creative person. You should be an artist! Or better yet, a programmer!", [self.nameTextField.text capitalizedString]];
         self.nameTextField.text = @"";
     }else{
         self.messageLabel.text = @"Please enter your name in the text field above.";
     }
}


- (IBAction)textFieldExit:(id)sender {
    [sender resignFirstResponder];
}
- (IBAction)backgroundTouched:(id)sender {
    [self.nameTextField resignFirstResponder];
}

@end
