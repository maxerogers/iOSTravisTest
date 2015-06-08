//
//  LoginViewController.m
//  Outlastr
//
//  Created by Max Rogers on 5/21/15.
//  Copyright (c) 2015 Carrot Creative. All rights reserved.
//

#import "LoginViewController.h"

@implementation LoginViewController

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self loginAction];
    return YES;
}

-(void)addEmailField{
    _emailField = [[UITextField alloc ]init];
    _emailField.placeholder = @"email";
    [_emailField setKeyboardType: UIKeyboardTypeEmailAddress];
    _emailField.borderStyle = UITextBorderStyleRoundedRect;
    _emailField.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_emailField];
    
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem: _emailField
                                                           attribute:NSLayoutAttributeCenterX
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeCenterX
                                                          multiplier:1.0
                                                            constant:0] ];
    
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:_emailField
                                                           attribute: NSLayoutAttributeWidth
                                                           relatedBy: NSLayoutRelationEqual
                                                              toItem: self.view
                                                           attribute:NSLayoutAttributeWidth
                                                          multiplier:0.8
                                                            constant:0]];
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:_emailField
                                                           attribute: NSLayoutAttributeTop
                                                           relatedBy: NSLayoutRelationEqual
                                                              toItem: self.view
                                                           attribute: NSLayoutAttributeTop
                                                          multiplier: 1
                                                            constant: self.view.frame.size.height * 0.4]];
}

-(void)addPasswordField{
    _passwordField = [[UITextField alloc ]init];
    _passwordField.placeholder = @"password";
    _passwordField.secureTextEntry = YES;
    _passwordField.borderStyle = UITextBorderStyleRoundedRect;
    _passwordField.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_passwordField];
    
    
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem: _passwordField
                                                           attribute:NSLayoutAttributeCenterX
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeCenterX
                                                          multiplier:1.0
                                                            constant:0] ];
    
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:_passwordField
                                                           attribute: NSLayoutAttributeWidth
                                                           relatedBy: NSLayoutRelationEqual
                                                              toItem: self.view
                                                           attribute:NSLayoutAttributeWidth
                                                          multiplier:0.8
                                                            constant:0]];
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:_passwordField
                                                           attribute: NSLayoutAttributeTop
                                                           relatedBy: NSLayoutRelationEqual
                                                              toItem:_emailField
                                                           attribute:NSLayoutAttributeBottom
                                                          multiplier:1.0
                                                            constant:8]];
}

-(void)addLoginBtn{
    _loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    //_loginBtn.layer.cornerRadius = 2;
    //_loginBtn.layer.borderWidth = 2;
    //_loginBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    
    _loginBtn.tintColor = [UIColor whiteColor];
    [_loginBtn setTitle:@"LOGIN" forState:UIControlStateNormal];
    _loginBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview: _loginBtn];
    
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:_loginBtn
                                                           attribute:NSLayoutAttributeTop
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:_passwordField
                                                           attribute:NSLayoutAttributeBottom
                                                          multiplier:1.0
                                                            constant:8]];
    
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:_loginBtn
                                                           attribute:NSLayoutAttributeTrailing
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:_passwordField
                                                           attribute:NSLayoutAttributeTrailing
                                                          multiplier:1.0
                                                            constant:0]];
    
}

-(void)addSignupBtn{
    _signupBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [_signupBtn setTitle:@"SIGNUP" forState:UIControlStateNormal];
    _signupBtn.translatesAutoresizingMaskIntoConstraints = NO;
    _signupBtn.tintColor = [UIColor whiteColor];
    [self.view addSubview: _signupBtn];
    
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:_signupBtn
                                                           attribute:NSLayoutAttributeTop
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:_passwordField
                                                           attribute:NSLayoutAttributeBottom
                                                          multiplier:1.0
                                                            constant:8]];
    
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:_signupBtn
                                                           attribute:NSLayoutAttributeLeading
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:_passwordField
                                                           attribute:NSLayoutAttributeLeading
                                                          multiplier:1.0
                                                            constant:0]];
    
}

-(void)addLogo{
    _logoView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"logo" ]];
    [self.view addSubview: _logoView];
    _logoView.contentMode = UIViewContentModeScaleAspectFit;
    _logoView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:_logoView
                                                           attribute:NSLayoutAttributeBottom
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:_emailField
                                                           attribute:NSLayoutAttributeTop
                                                          multiplier:1.0
                                                            constant:0]];
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:_logoView
                                                           attribute:NSLayoutAttributeWidth
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeWidth
                                                          multiplier:0.8
                                                            constant:0]];
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:_logoView
                                                           attribute:NSLayoutAttributeCenterX
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeCenterX
                                                          multiplier:1.0
                                                            constant:0]];
}

-(void)loginAction{
    //TODO Consider adding a Loading Spinner here
    
    //do log in stuff
    [[ApiMaster sharedInstance] loginAttempt:_emailField.text
                                withPassword:_passwordField.text
                              successHandler:^void(AFHTTPRequestOperation *operation, id responseObject){
                                  //We will move on to whatever
                                  NSDictionary *dict = (NSDictionary *) responseObject;
                                  ApiMaster *apimaster = [ApiMaster sharedInstance];
                                  apimaster.token = dict[@"token"];
                                  apimaster.key = dict[@"key"];
                                  MainViewController *vc = [[MainViewController alloc] init];
                                  [self presentViewController:vc animated:YES completion:nil];
                              }
                              failureHandler:^void(AFHTTPRequestOperation *operation, id responseObject){
                                  //Tell them their information is wrong
                                  
                                  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failure to Login" message:@"Your email or password appeart to be incorrect. Please re-enter them." delegate:self cancelButtonTitle:@"Close" otherButtonTitles:nil];
                                  // optional - add more buttons:
                                  [alert show];
                                  
                              }];
}

-(void)signupAction{
    //Check for valid email and password
    if( [_emailField.text isValidEmail]){
        if( [_passwordField.text isValidPassword]){
            //do log in stuff
            [[ApiMaster sharedInstance] checkUsernameAvailability: _emailField.text
                                               withSuccessHandler:^void(AFHTTPRequestOperation *operation, id responseObject){
                                                   NSDictionary *dict = (NSDictionary *) responseObject;
                                                   if( [dict[@"message"] isEqualToString: @"Email is available"]){
                                                       ProfileViewController *vc = [[ProfileViewController alloc] init];
                                                       vc.email = _emailField.text;
                                                       vc.password = _passwordField.text;
                                                       [self presentViewController:vc animated:YES completion:nil];
                                                   }else{
                                                       UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failure to Signup" message:@"That email appears to be already taken" delegate:self cancelButtonTitle:@"Close" otherButtonTitles:nil];
                                                       // optional - add more buttons:
                                                       [alert show];
                                                   }
                                                   
                                               }andFailureHandler:^void(AFHTTPRequestOperation *operation, id responseObject){
                                                   //Tell them their information is wrong
                                                   UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failure to Signup" message:@"That email appears to be already taken" delegate:self cancelButtonTitle:@"Close" otherButtonTitles:nil];
                                                   // optional - add more buttons:
                                                   [alert show];
                                               }];
        }else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Password" message:@"Should be atleast 8 characters and consist of only numbers and letters" delegate:self cancelButtonTitle:@"Close" otherButtonTitles:nil];
            // optional - add more buttons:
            [alert show];
        }
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Email" message:@"That email appears to be invalid" delegate:self cancelButtonTitle:@"Close" otherButtonTitles:nil];
        // optional - add more buttons:
        [alert show];
    }
}

-(void)loadSpinner{
    _indicatorLayer = [CALayer layer];
    _indicatorLayer.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    _indicatorLayer.backgroundColor = [[UIColor alloc] initWithRed:0.0 green:0.0 blue:0.0 alpha:0.5].CGColor;
    [self.view.layer addSublayer: _indicatorLayer];
    
    _indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    _indicator.frame = CGRectMake(0.0, 0.0, 40.0, 40.0);
    _indicator.center = self.view.center;
    [self.view addSubview:_indicator];
    [_indicator bringSubviewToFront:self.view];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = TRUE;
    [_indicator startAnimating];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addEmailField];
    [self addPasswordField];
    [self addSignupBtn];
    [self addLoginBtn];
    
    [self addLogo];
    [_loginBtn addTarget:self
                  action:@selector(loginAction)
        forControlEvents:UIControlEventTouchUpInside];
    
    [_signupBtn addTarget:self
                   action:@selector(signupAction)
         forControlEvents:UIControlEventTouchUpInside];
    
    self.view.backgroundColor = [[UIColor alloc] initWithRed:165/255.0 green:105/255.0 blue:165/255.0 alpha:1.0];
    _emailField.delegate = self;
    _passwordField.delegate = self;
}

@end
