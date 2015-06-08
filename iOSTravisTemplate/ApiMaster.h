//
//  ApiMaster.h
//  Outlastr
//
//  Created by Max Rogers on 5/20/15.
//  Copyright (c) 2015 Carrot Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface ApiMaster : NSObject

@property NSString *token;
@property NSString *key;

@property AFHTTPRequestOperationManager *manager;

- (id)init;
+ (id)sharedInstance;

-(NSString *)path:(NSString *)formatString, ...;

-(void)loginAttempt:(NSString *)email
       withPassword:(NSString *) password
     successHandler:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
     failureHandler:(void (^)(AFHTTPRequestOperation *operation, NSError *error)) fail;

//This should return an array of user so the result will be a MutuableArray of NSDictionaries
-(void)getUsers:(NSInteger *)limit
 successHandler:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
 failureHandler:(void (^)(AFHTTPRequestOperation *operation, NSError *error)) fail;

//The response id will be a single NSDictionary object
-(void)getUser:(NSString *)_id
successHandler:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
failureHandler:(void (^)(AFHTTPRequestOperation *operation, NSError *error)) fail;

-(void)updateUser:(NSString *)_id
        parameter:(NSDictionary *) json
   successHandler:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
   failureHandler:(void (^)(AFHTTPRequestOperation *operation, NSError *error)) fail;

-(void)getBreakups:(NSString *)token
           userKey:(NSString *)key
    successHandler:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
    failureHandler:(void (^)(AFHTTPRequestOperation *operation, NSError *error)) fail;

-(void)getBreakupsWithSuccessHandler:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                      failureHandler:(void (^)(AFHTTPRequestOperation *operation, NSError *error)) fail;

-(void)getBreakup:(NSString *)_id
WithSuccessHandler:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
andFailureHandler:(void (^)(AFHTTPRequestOperation *operation, NSError *error)) fail;

-(void)checkUsernameAvailability:(NSString *) email
              withSuccessHandler:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
               andFailureHandler:(void (^)(AFHTTPRequestOperation *operation, NSError *error)) fail;

-(void)createUser:(NSDictionary *) data
withSuccessHandler: (void (^)(AFHTTPRequestOperation *operation, id responseObject))success
andWithFailureHandler: (void (^)(AFHTTPRequestOperation *operation, NSError *error)) fail;

-(BOOL)alreadyLoggedIn;
@end

@interface NSString (emailValidation)
- (BOOL)isValidEmail;
- (BOOL)isValidPassword;
@end