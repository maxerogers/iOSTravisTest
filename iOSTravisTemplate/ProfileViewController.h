//
//  ProfileViewController.h
//  Outlastr
//
//  Created by Max Rogers on 5/21/15.
//  Copyright (c) 2015 Carrot Creative. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ApiMaster.h"
#import "MainViewController.h"
#import <SimpleKeychain/A0SimpleKeychain.h>

@interface ProfileViewController : UIViewController

@property NSString *email;
@property NSString *password;
@property UILabel *titleLabel;
@property UILabel *anniversaryLabel;
@property UITextField *dateField;
@property UITextField *monthField;
@property UITextField *yearField;
@property UITextField *fullNameField;
@property UITextField *partnerNameField;
@property UITextField *passwordField;
@property UIButton *doneBtn;

//Room for avatar upload
//Partner upload

@end
