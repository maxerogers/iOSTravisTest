//
//  LoginViewController.h
//  Outlastr
//
//  Created by Max Rogers on 5/21/15.
//  Copyright (c) 2015 Carrot Creative. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ApiMaster.h"
#import "ProfileViewController.h"
#import "MainViewController.h"

@interface LoginViewController : UIViewController <UITextFieldDelegate>

@property UIButton *loginBtn;
@property UIButton *signupBtn;

@property UITextField *emailField;
@property UITextField *passwordField;

@property UIImageView *logoView;

@property UIActivityIndicatorView *indicator;
@property CALayer *indicatorLayer;
@end
