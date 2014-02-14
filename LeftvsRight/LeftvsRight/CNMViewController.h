//
//  CNMViewController.h
//  LeftvsRight
//
//  Created by Collin Mann on 2/6/14.
//  Copyright (c) 2014 Collin Mann. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface CNMViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *messageLabel;
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UIButton *leftButton;
@property (strong, nonatomic) IBOutlet UIButton *rightButton;

@end
