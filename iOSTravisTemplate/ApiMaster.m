//
//  ApiMaster.m
//  Outlastr
//
//  Created by Max Rogers on 5/20/15.
//  Copyright (c) 2015 Carrot Creative. All rights reserved.
//

#import "ApiMaster.h"

@implementation ApiMaster

- (id)init
{
    self = [super init];
    if (nil == self) return nil;
    _manager = [AFHTTPRequestOperationManager manager];
    return self;
}

+ (id)sharedInstance
{
    // structure used to test whether the block has completed or not
    static dispatch_once_t p = 0;
    
    // initialize sharedObject as nil (first call only)
    __strong static id _sharedObject = nil;
    
    // executes a block object once and only once for the lifetime of an application
    dispatch_once(&p, ^{
        _sharedObject = [[self alloc] init];
    });
    
    // returns the same object each time
    return _sharedObject;
}

-(NSString *)path:(NSString *)formatString, ...{
    va_list args;
    va_start(args, formatString);
    NSString *contents = [[NSString alloc] initWithFormat:formatString arguments:args];
    va_end(args);
    //    return [[NSString alloc ]initWithFormat:@"http://localhost:3333/%@", contents];
    return [[NSString alloc ]initWithFormat:@"https://outlastr-api-staging.herokuapp.com/%@", contents];
}

-(void)loginAttempt:(NSString *)email
       withPassword:(NSString *) password
     successHandler:(void (^)(AFHTTPRequestOperation *operation, id responseObject)) success
     failureHandler:(void (^)(AFHTTPRequestOperation *operation, NSError *error)) fail{
    
    NSDictionary *parameters = @{ @"username": email, @"password": password};
    [_manager POST:[self path:@"login"] parameters:parameters success: success failure: fail];
}

-(void)getUsers:(NSInteger *)limit
 successHandler:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
 failureHandler:(void (^)(AFHTTPRequestOperation *operation, NSError *error)) fail{
    [_manager GET:[self path:@"user"] parameters: nil success: success failure: fail];
}

-(void)getUser:(NSString *)_id
successHandler:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
failureHandler:(void (^)(AFHTTPRequestOperation *operation, NSError *error)) fail{
    
    [_manager GET: [self path:@"user/%@", _id] parameters: nil success: success failure: fail];
}

-(void)updateUser:(NSString *)_id
        parameter:(NSDictionary *) json
   successHandler:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
   failureHandler:(void (^)(AFHTTPRequestOperation *operation, NSError *error)) fail{
    
    [_manager PUT: [self path:@"user/%@", _id] parameters: json success: success failure: fail];
}

-(void)getBreakups:(NSString *)token
           userKey:(NSString *)key
    successHandler:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
    failureHandler:(void (^)(AFHTTPRequestOperation *operation, NSError *error))fail{
    
    [_manager.requestSerializer setValue:token forHTTPHeaderField:@"x-access-token"];
    [_manager.requestSerializer setValue:key forHTTPHeaderField:@"x-key"];
    [_manager GET: [self path:@"breakups"] parameters: nil success: success failure: fail];
}

-(void)getBreakupsWithSuccessHandler:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                      failureHandler:(void (^)(AFHTTPRequestOperation *operation, NSError *error)) fail{
    
    [_manager.requestSerializer setValue:_token forHTTPHeaderField:@"x-access-token"];
    [_manager.requestSerializer setValue:_key forHTTPHeaderField:@"x-key"];
    [_manager GET: [self path:@"breakups"] parameters: nil success: success failure: fail];
}

-(void)getBreakup:(NSString *)_id
WithSuccessHandler:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
andFailureHandler:(void (^)(AFHTTPRequestOperation *operation, NSError *error)) fail{
    
    [_manager GET: [self path:@"breakup/%@", _id] parameters: nil success: success failure: fail];
}

-(void)checkUsernameAvailability:(NSString *) email
              withSuccessHandler:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
               andFailureHandler:(void (^)(AFHTTPRequestOperation *operation, NSError *error)) fail{
    NSDictionary *dict = @{ @"email": email};
    [_manager POST: [self path:@"username_available"] parameters: dict success: success failure: fail];
}

-(void)createUser:(NSDictionary *) data
withSuccessHandler: (void (^)(AFHTTPRequestOperation *operation, id responseObject))success
andWithFailureHandler: (void (^)(AFHTTPRequestOperation *operation, NSError *error)) fail{
    [_manager POST: [self path:@"user"] parameters: data success: success failure: fail];
}

-(BOOL)alreadyLoggedIn{
    if(_token && _key){
        return true;
    }else{
        return false;
    }
}
@end

@implementation NSString (emailValidation)
-(BOOL)isValidEmail
{
    BOOL stricterFilter = NO; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}
- (BOOL)isValidPassword{
    if([self length] < 8){
        return false;
    }
    NSCharacterSet *ownSet = [NSCharacterSet characterSetWithCharactersInString:self];
    NSCharacterSet *approvedCharacterSet = [NSCharacterSet alphanumericCharacterSet];
    return [approvedCharacterSet isSupersetOfSet:ownSet];
}
@end