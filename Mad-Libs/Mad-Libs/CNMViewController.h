//
//  CNMViewController.h
//  Mad-Libs
//
//  Created by Collin Mann on 2/12/14.
//  Copyright (c) 2014 Collin Mann. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CNMViewController : UIViewController <UIActionSheetDelegate>{

}
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *placeTextField;
@property (strong, nonatomic) IBOutlet UITextField *wordTextField;
@property (strong, nonatomic) IBOutlet UITextField *ageTextField;
@property (strong, nonatomic) IBOutlet UISlider *numberSlider;
@property (strong, nonatomic) IBOutlet UILabel *sliderCountLabel;
@property (strong, nonatomic) IBOutlet UISegmentedControl *animalSegment;
@property (strong, nonatomic) IBOutlet UIStepper *petsStepper;
@property (strong, nonatomic) IBOutlet UILabel *stepperCountLabel;
@property (strong, nonatomic) IBOutlet UISwitch *happySwitch;
@property (strong, nonatomic) IBOutlet UIButton *backgroundButton;
@property (strong, nonatomic) IBOutlet UIView *moreView;

@end
