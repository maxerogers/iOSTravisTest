//
//  ProfileViewController.m
//  Outlastr
//
//  Created by Max Rogers on 5/21/15.
//  Copyright (c) 2015 Carrot Creative. All rights reserved.
//

#import "ProfileViewController.h"

@implementation ProfileViewController

-(void) addTitleLabel{
    _titleLabel = [[UILabel alloc] init];
    [_titleLabel setFont: [UIFont systemFontOfSize:28]];
    [_titleLabel setText:@"SIGN UP"];
    _titleLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:_titleLabel];
    _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:_titleLabel
                                                           attribute:NSLayoutAttributeTop
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeTop
                                                          multiplier:1.0
                                                            constant:self.view.frame.size.height * 0.1]];
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:_titleLabel
                                                           attribute:NSLayoutAttributeCenterX
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeCenterX
                                                          multiplier:1.0
                                                            constant:0]];
    
}

-(void) addAnniversaryLabel{
    _anniversaryLabel = [[UILabel alloc] init];
    [_anniversaryLabel setText:@"When's your anniversary?"];
    _anniversaryLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:_anniversaryLabel];
    _anniversaryLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:_anniversaryLabel
                                                           attribute:NSLayoutAttributeTop
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:_titleLabel
                                                           attribute:NSLayoutAttributeTop
                                                          multiplier:1.0
                                                            constant:self.view.frame.size.height * 0.05]];
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:_anniversaryLabel
                                                           attribute:NSLayoutAttributeCenterX
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeCenterX
                                                          multiplier:1.0
                                                            constant:0]];
    
}

-(void) addAnniversaryField:(UITextField *) newField left:(UITextField *) leftField{
    newField.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview: newField];
    
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:newField
                                                           attribute:NSLayoutAttributeLeading
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:leftField
                                                           attribute:NSLayoutAttributeLeading
                                                          multiplier:1.0
                                                            constant:self.view.frame.size.height * 0.165]];
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:newField
                                                           attribute:NSLayoutAttributeTop
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:_anniversaryLabel
                                                           attribute:NSLayoutAttributeTop
                                                          multiplier:1.0
                                                            constant:self.view.frame.size.height * 0.05]];
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:newField
                                                           attribute:NSLayoutAttributeWidth
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:leftField
                                                           attribute:NSLayoutAttributeWidth
                                                          multiplier:1.0
                                                            constant:0]];
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:newField
                                                           attribute:NSLayoutAttributeHeight
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:leftField
                                                           attribute:NSLayoutAttributeWidth
                                                          multiplier:1.0
                                                            constant:0]];
}

-(UITextField *)buildAnniversaryField:(NSString *) placeholder{
    UITextField *temp = [[UITextField alloc] init];
    temp.placeholder = placeholder;
    temp.textAlignment = NSTextAlignmentCenter;
    temp.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    temp.textColor = [UIColor whiteColor];
    temp.backgroundColor = [[UIColor alloc] initWithRed:209/255.0 green:180/255.0 blue:210/255.0 alpha:1.0];
    [temp setKeyboardType: UIKeyboardTypeNumberPad];
    temp.borderStyle = UITextBorderStyleRoundedRect;
    NSDictionary *settings = @{NSForegroundColorAttributeName: [UIColor whiteColor],
                               NSFontAttributeName: [UIFont fontWithName:@"Helvetica Neue" size:24]};
    
    temp.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholder attributes:settings ];
    return temp;
}

-(void) addAnniversaryFields{
    _dateField = [self buildAnniversaryField:@"dd"];
    
    _dateField.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview: _dateField];
    
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:_dateField
                                                           attribute:NSLayoutAttributeLeading
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeLeading
                                                          multiplier:1.0
                                                            constant:self.view.frame.size.height * 0.040]];
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:_dateField
                                                           attribute:NSLayoutAttributeWidth
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeWidth
                                                          multiplier:(1.0-0.2)/3
                                                            constant:0]];
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:_dateField
                                                           attribute:NSLayoutAttributeHeight
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeWidth
                                                          multiplier:(1.0-0.2)/3
                                                            constant:0]];
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:_dateField
                                                           attribute:NSLayoutAttributeTop
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:_anniversaryLabel
                                                           attribute:NSLayoutAttributeTop
                                                          multiplier:1.0
                                                            constant:self.view.frame.size.height * 0.05]];
    
    _monthField = [self buildAnniversaryField:@"mm"];
    [self addAnniversaryField:_monthField left:_dateField];
    
    _yearField = [self buildAnniversaryField:@"yyyy"];
    [self addAnniversaryField:_yearField left:_monthField];
    
}

-(UITextField *) buildField:(NSString *) placeholder{
    UITextField *temp = [[UITextField alloc] init];
    temp.placeholder = placeholder;
    temp.translatesAutoresizingMaskIntoConstraints = NO;
    temp.backgroundColor = [UIColor whiteColor];
    temp.borderStyle = UITextBorderStyleRoundedRect;
    return temp;
}

-(void) addField:(UITextField *) temp above:(UITextField *)above{
    
    [self.view addSubview:temp];
    
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:temp
                                                           attribute:NSLayoutAttributeTop
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:above
                                                           attribute:NSLayoutAttributeBottom
                                                          multiplier:1.0
                                                            constant:self.view.frame.size.height * 0.01]];
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:temp
                                                           attribute:NSLayoutAttributeWidth
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:above
                                                           attribute:NSLayoutAttributeWidth
                                                          multiplier:1.0
                                                            constant:0]];
    
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:temp
                                                           attribute:NSLayoutAttributeTrailing
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:above
                                                           attribute:NSLayoutAttributeTrailing
                                                          multiplier:1.0
                                                            constant:0]];
}

- (void) addFields{
    _fullNameField = [[UITextField alloc] init];
    _fullNameField.placeholder = @"FULL NAME";
    _fullNameField.translatesAutoresizingMaskIntoConstraints = NO;
    _fullNameField.backgroundColor = [UIColor whiteColor];
    _fullNameField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_fullNameField];
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:_fullNameField
                                                           attribute:NSLayoutAttributeTop
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:_yearField
                                                           attribute:NSLayoutAttributeBottom
                                                          multiplier:1.0
                                                            constant:self.view.frame.size.height * 0.01]];
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:_fullNameField
                                                           attribute:NSLayoutAttributeWidth
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeWidth
                                                          multiplier:0.85
                                                            constant:0]];
    
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:_fullNameField
                                                           attribute:NSLayoutAttributeTrailing
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:_yearField
                                                           attribute:NSLayoutAttributeTrailing
                                                          multiplier:1.0
                                                            constant:0]];
    _partnerNameField = [self buildField: @"PARTNER NAME"];
    [self addField:_partnerNameField above: _fullNameField];
    _passwordField = [self buildField: @"PASSWORD"];
    [self addField:_passwordField above: _partnerNameField];
    _passwordField.secureTextEntry = YES;
    if([_password length] > 7){
        _passwordField.text = _password;
    }
}

- (void) addDoneBtn{
    _doneBtn = [[UIButton alloc] init];
    [_doneBtn setTitle:@"DONE" forState: UIControlStateNormal];
    [_doneBtn setTitleColor: [[UIColor alloc] initWithRed:1.0 green:1.0 blue:1.0 alpha:0.5] forState: UIControlStateHighlighted];
    _doneBtn.backgroundColor = [[UIColor alloc] initWithRed:129/255.0 green:196/255.0 blue:91/255.0 alpha:1.0];
    _doneBtn.layer.cornerRadius = 5;
    _doneBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview: _doneBtn];
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:_doneBtn
                                                           attribute:NSLayoutAttributeTop
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:_passwordField
                                                           attribute:NSLayoutAttributeBottom
                                                          multiplier:1.0
                                                            constant:self.view.frame.size.height * 0.01]];
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:_doneBtn
                                                           attribute:NSLayoutAttributeTrailing
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:_passwordField
                                                           attribute:NSLayoutAttributeTrailing
                                                          multiplier:1.0
                                                            constant:0]];
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:_doneBtn
                                                           attribute:NSLayoutAttributeWidth
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:_passwordField
                                                           attribute:NSLayoutAttributeWidth
                                                          multiplier:0.5
                                                            constant:0]];
}

-(void) updateUser:(id)sender{
    NSLog(@"BOOP");
    ApiMaster *api = [ApiMaster sharedInstance];
    //Add Month,Day and Year checks
    NSString *dateString = [NSString stringWithFormat:@"%@-%@-%@ 00:00:00 EST", _yearField.text, _monthField.text, _dateField.text];
    NSDictionary *data = @{@"email": _email, @"password": _password, @"full_name": _fullNameField.text , @"partner_name": _partnerNameField.text, @"anniversary_date": dateString};
    
    
    //check if already logged in
    if([api alreadyLoggedIn]){
        //just update user
        //TODO add step where we have the user name stored
        
        //        api updateUser:@"need_to_get_user_id" parameter:data successHandler:^void(AFHTTPRequestOperation *operation, id responseObject) {} failureHandler: void(^failure)(AFHTTPRequestOperation *operation, id responseObject){}
    }else{
        //create user
        void(^success)(AFHTTPRequestOperation *operation, id responseObject) =
        ^void(AFHTTPRequestOperation *operation, id responseObject) {
            //Then Login and store key&token
            [api loginAttempt:_email withPassword:_password successHandler: ^void(AFHTTPRequestOperation *operation, id responseObject) {
                
                //Add to local storage
                NSDictionary *dict = (NSDictionary *) responseObject;
                api.token = dict[@"token"];
                api.key = dict[@"key"];
                
                //Save Personal info
                [[A0SimpleKeychain keychain] setString:dict[@"token"] forKey:@"outlastr-user-jwt"];
                [[A0SimpleKeychain keychain] setString:_passwordField.text forKey:@"outlastr-user-password"];
                
                //Save Profile Info
                NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                [defaults setObject:_email forKey:@"email"];
                [defaults setObject:dateString forKey:@"anniversary_date"];
                [defaults setObject:_fullNameField.text forKey:@"full_name"];
                [defaults setObject:_partnerNameField.text forKey:@"partner_name"];
                [defaults setObject:dict[@"token"] forKey:@"token"];
                [defaults synchronize];
                
                MainViewController *vc = [[MainViewController alloc] init];
                [self presentViewController:vc animated:YES completion:nil];
                
            }failureHandler: ^void(AFHTTPRequestOperation *operation, id responseObject) {
                NSLog(@"%@", responseObject);
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failure to create User" message:@"Something went wrong. Please try again later." delegate:self cancelButtonTitle:@"Close" otherButtonTitles:nil];
                [alert show];
                
            }];
        };
        
        void(^failure)(AFHTTPRequestOperation *operation, id responseObject) =
        ^void(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"%@", responseObject);
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failure to create User" message:@"Something went wrong. Please try again later." delegate:self cancelButtonTitle:@"Close" otherButtonTitles:nil];
            [alert show];
        };
        
        //POST /user
        [api createUser: data withSuccessHandler: success andWithFailureHandler: failure];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self addTitleLabel];
    [self addAnniversaryLabel];
    [self addAnniversaryFields];
    [self addFields];
    [self addDoneBtn];
    [_doneBtn addTarget:self action:@selector(updateUser:) forControlEvents: UIControlEventTouchUpInside];
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.backgroundColor = [[UIColor alloc] initWithRed:165/255.0 green:105/255.0 blue:165/255.0 alpha:1.0];
}

@end
