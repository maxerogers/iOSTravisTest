
#import <Specta/Specta.h>
#import <Expecta.h>
#import "AFNetworking.h"
#import "ApiMaster.h"
#import "LoginViewController.h"

SpecBegin(ApiMaster)
describe(@"ApiMaster", ^{
    
    ApiMaster *apimaster = [ApiMaster sharedInstance];
    
    it(@"Hello World", ^{
        expect(@"foo").to.equal(@"foo");
    });
    
//    it(@"Get Users", ^{
//        waitUntil(^(DoneCallback done) {
//            // Async example blocks need to invoke done() callback.
//            
//            void(^success)(AFHTTPRequestOperation *operation, id responseObject) =
//            ^void(AFHTTPRequestOperation *operation, id responseObject) {
//                
//                NSMutableArray *jsonArray = [NSMutableArray arrayWithArray:responseObject];
//                done();
//            };
//            
//            void(^fail)(AFHTTPRequestOperation *operation, id responseObject) =
//            ^void(AFHTTPRequestOperation *operation, NSError *error) {
//                failure(@"You were supposed to get a bunch of users");
//                done();
//            };
//            [apimaster getUsers: 3 successHandler:success failureHandler:fail];
//            
//            
//        });
//    });
//    
//    
//    it(@"Get User/id", ^{
//        waitUntil(^(DoneCallback done) {
//            // Async example blocks need to invoke done() callback.
//            
//            void(^success)(AFHTTPRequestOperation *operation, id responseObject) =
//            ^void(AFHTTPRequestOperation *operation, id responseObject) {
//                //returns a NSDictionary
//                done();
//            };
//            
//            void(^fail)(AFHTTPRequestOperation *operation, id responseObject) =
//            ^void(AFHTTPRequestOperation *operation, NSError *error) {
//                failure(@"You were supposed to get a bunch of users");
//                done();
//            };
//            [apimaster getUser: @"555ce4fcc93b4aac3f7e9cc0" successHandler:success failureHandler:fail];
//            
//        });
//        
//    });
//    
//    it(@"Get User/id FAIL", ^{
//        waitUntil(^(DoneCallback done) {
//            // Async example blocks need to invoke done() callback.
//            
//            void(^success)(AFHTTPRequestOperation *operation, id responseObject) =
//            ^void(AFHTTPRequestOperation *operation, id responseObject) {
//                failure(@"You were supposed to get a bunch of users");
//                done();
//            };
//            
//            void(^fail)(AFHTTPRequestOperation *operation, id responseObject) =
//            ^void(AFHTTPRequestOperation *operation, NSError *error) {
//                done();
//            };
//            [apimaster getUser: @"1234567890" successHandler:success failureHandler:fail];
//            
//        });
//    });
//    
//    it(@"Update User/id", ^{
//        waitUntil(^(DoneCallback done) {
//            // Async example blocks need to invoke done() callback.
//            
//            void(^success)(AFHTTPRequestOperation *operation, id responseObject) =
//            ^void(AFHTTPRequestOperation *operation, id responseObject) {
//                expect(responseObject[@"full_name"]).to.equal(@"Steve Rogers");
//                done();
//            };
//            
//            void(^fail)(AFHTTPRequestOperation *operation, id responseObject) =
//            ^void(AFHTTPRequestOperation *operation, NSError *error) {
//                failure(@"You were supposed to get a bunch of users");
//                done();
//            };
//            NSDictionary *json = @{ @"full_name": @"Steve Rogers"};
//            [apimaster updateUser: @"555ce4fcc93b4aac3f7e9cc0" parameter: json successHandler:success failureHandler:fail];
//            
//        });
//    });
//    
//    it(@"Attempt Login", ^{
//        waitUntil(^(DoneCallback done) {
//            // Async example blocks need to invoke done() callback.
//            
//            void(^success)(AFHTTPRequestOperation *operation, id responseObject) =
//            ^void(AFHTTPRequestOperation *operation, id responseObject) {
//                NSLog(@"%@", responseObject);
//                apimaster.token = responseObject[@"token"];
//                apimaster.key = responseObject[@"user"];
//                done();
//            };
//            
//            void(^fail)(AFHTTPRequestOperation *operation, id responseObject) =
//            ^void(AFHTTPRequestOperation *operation, NSError *error) {
//                failure(@"Your login failed");
//                done();
//            };
//            
//            [apimaster loginAttempt: @"brad@pitt.com" withPassword:@"password" successHandler:success failureHandler:fail];
//            
//            
//        });
//    });
//    
//    it(@"Fail Login", ^{
//        waitUntil(^(DoneCallback done) {
//            // Async example blocks need to invoke done() callback.
//            
//            void(^success)(AFHTTPRequestOperation *operation, id responseObject) =
//            ^void(AFHTTPRequestOperation *operation, id responseObject) {
//                failure(@"You were supposed to fail");
//                done();
//            };
//            
//            void(^fail)(AFHTTPRequestOperation *operation, id responseObject) =
//            ^void(AFHTTPRequestOperation *operation, NSError *error) {
//                done();
//            };
//            [apimaster loginAttempt: @"brad@pitt.com" withPassword:@"badpassword" successHandler:success failureHandler:fail];
//        });
//    });
//    
//    it(@"Test ApiMaster Pathmaker", ^{
//        expect([apimaster path:@"%@/%@", @"user", @"1234567890"]).to.equal(@"http://localhost:3333/user/1234567890");
//    });
//    
//    describe(@"Authenication", ^{
//        
//        before(^{
//            if(!apimaster.token){
//                apimaster.token = @"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE0MzM3OTcyNTE3NzR9.zgOV6UtpXNyZlZILyTN5N8pAy7ZF3XkDSEfj1vnQBtI";
//                apimaster.key = @"brad@pitt.com";
//            }
//        });
//        
//        it(@"Get Breakup", ^{
//            waitUntil(^(DoneCallback done){
//                void(^success)(AFHTTPRequestOperation *operation, id responseObject) =
//                ^void(AFHTTPRequestOperation *operation, id responseObject) {
//                    NSLog(@"%@",responseObject);
//                    done();
//                };
//                
//                void(^fail)(AFHTTPRequestOperation *operation, id responseObject) =
//                ^void(AFHTTPRequestOperation *operation, NSError *error) {
//                    failure(@"You weren't supposed to fail");
//                    done();
//                };
//                
//                [apimaster getBreakupsWithSuccessHandler:success failureHandler:fail];
//            });
//        });
    
        /*
         it(@"Breakups/id Authenication",^{
         waitUntil(^(DoneCallback done){
         void(^success)(AFHTTPRequestOperation *operation, id responseObject) =
         ^void(AFHTTPRequestOperation *operation, id responseObject) {
         NSLog(@"%@",responseObject);
         expect(responseObject['member_1']).to.equal(@"Katy Perry");
         done();
         };
         
         void(^fail)(AFHTTPRequestOperation *operation, id responseObject) =
         ^void(AFHTTPRequestOperation *operation, NSError *error) {
         failure(@"You weren't supposed to fail");
         done();
         };
         [apimaster getBreakup:@"55564b5a9178197626f76419" WithSuccessHandler:success andFailureHandler:fail];
         });
         });
         */
        /*
         it("Breakups/id NO TOKEN Authenication",function(done){
         request.get('/breakup/'+katy_perry_id)
         .expect(401)
         .end(function(err, res){
         if (err) return done(err);
         done()
         })
         })
         
         it("Breakups/id BAD TOKEN Authenication",function(done){
         request.get('/breakup/'+katy_perry_id)
         .set('x-access-token','SALADFINGERS')
         .set('x-key',key)
         .expect(500)
         .end(function(err, res){
         if (err) return done(err);
         done()
         })
         })
         
         it("Breakups/id INVALID ID Authenication",function(done){
         request.get('/breakup/'+1234567890)
         .set('x-access-token', token)
         .set('x-key',key)
         .expect(500)
         .end(function(err, res){
         if (err) return done(err);
         done()
         })
         })
         */
});
SpecEnd