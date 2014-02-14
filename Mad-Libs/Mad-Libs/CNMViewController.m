//
//  CNMViewController.m
//  Mad-Libs
//
//  Created by Collin Mann on 2/12/14.
//  Copyright (c) 2014 Collin Mann. All rights reserved.
//

#import "CNMViewController.h"

@interface CNMViewController ()

@end

@implementation CNMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    int myInt = (int) self.numberSlider.value;
    int myStepperInt = (int) self.petsStepper.value;
    self.moreView.hidden = YES;
    self.sliderCountLabel.text = [NSString stringWithFormat:@"%d", myInt];
    self.stepperCountLabel.text = [NSString stringWithFormat:@"%d", myStepperInt];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)textFieldExit:(id)sender {
    [sender resignFirstResponder];
}

- (IBAction)backgroundTouched:(id)sender {
    [self.nameTextField resignFirstResponder];
    [self.placeTextField resignFirstResponder];
    [self.wordTextField resignFirstResponder];
    [self.ageTextField resignFirstResponder];
}

- (IBAction)lessMoreButtonTouched:(id)sender {
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    if (segmentedControl.selectedSegmentIndex == 0) {
        self.moreView.hidden = YES;
    }else{
        self.moreView.hidden = NO;
    }
}
- (IBAction)sliderChanged:(id)sender {
    UISlider *slider = (UISlider *)sender;
    int numberAsInt = (int) (slider.value + 0.5f);
    NSString *newText = [[NSString alloc] initWithFormat: @"%d", numberAsInt];
    self.sliderCountLabel.text = newText;
}
- (IBAction)animalSegmentTouched:(id)sender {

}


- (IBAction)stepperTouched:(id)sender {
    UIStepper *stepper = (UIStepper *) sender;
    int stepperNum = (int)stepper.value;
    NSString *numPets = [[NSString alloc] initWithFormat:@"%d", stepperNum];
    self.stepperCountLabel.text = numPets;
}


- (IBAction)buildStoryTouched:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Are you ready for your story?" delegate:self cancelButtonTitle:@"Not Yet" destructiveButtonTitle:@"Yes!" otherButtonTitles:nil];
    [actionSheet showInView:self.view];

}

-(void)actionSheet: (UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex != [actionSheet cancelButtonIndex]){
        [self buildStory];
    }
}

-(void)buildStory {
    NSString *name = self.nameTextField.text;
    NSString *place = self.placeTextField.text;
    NSString *word = self.wordTextField.text;
    NSString *age = self.ageTextField.text;
    NSUInteger slider = self.numberSlider.value;
    NSString *animal = [self.animalSegment titleForSegmentAtIndex:self.animalSegment.selectedSegmentIndex];
    NSUInteger stepper = self.petsStepper.value;
    BOOL switchy = self.happySwitch.isOn;
    NSString *switch1 = [[NSString alloc] initWithFormat:@""];
    if (switchy == 1) {
        switch1 = @"lived happily ever after";
    } else {
        switch1 = @"dies";
    }
    if(![name  isEqual: @""] && ![place  isEqual: @""] && ![word  isEqual: @""] && ![age  isEqual: @""]){
        NSString *story = [[NSString alloc] initWithFormat:@"%@ went to %@ at the age of %@. %@ %@ with %i %@s. %@ has %i wild children and then %@ after 5 years %@.", name, place, age, name, word, slider, animal, name, stepper, name, switch1];
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Mad Libs Story"
                              message:story
                              delegate:self
                              cancelButtonTitle:@"Done"
                              otherButtonTitles:nil];
        [alert show];
    }else{
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@""
                              message:@"Please make sure you filled out your Name, Favorite Place, Action Word, and Age"
                              delegate:self
                              cancelButtonTitle:@"Done"
                              otherButtonTitles:nil];
        [alert show];
    }
    
}


@end
