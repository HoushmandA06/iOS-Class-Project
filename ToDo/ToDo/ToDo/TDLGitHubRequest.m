//
//  TDLGitHubRequest.m
//  ToDo
//
//  Created by Ali Houshmand on 4/7/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "TDLGitHubRequest.h"

@implementation TDLGitHubRequest

+ (NSDictionary *)getUserWithUsername:(NSString *)username
{
    NSDictionary * userInfo = @{};  //literal - it's alloc and init'ing an NSDictionary
    
    NSString * github = [NSString stringWithFormat:@"https://api.github.com/users/%@",username];
    
    NSURL * url = [NSURL URLWithString:github];
    
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
//    NSOperationQueue * queue = [[NSOperationQueue alloc] init];
    
/*    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
    {
        if (connectionError == nil)
        {
            
        } else
        {
            NSlog(@"%@",connectionError);
        }
        
        
    }]; */
    
    NSURLResponse * response = nil;
    NSError * error = nil;
    NSData * responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSError * jsonError = nil;
    NSDictionary * githubProfile = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&jsonError];
    
 //   for (NSString * key in [githubProfile allKeys]) {
 //
 //
 //   }
    
   
        userInfo = @{@"name":githubProfile[@"name"],
                     @"image":githubProfile[@"avatar_url"],
                     @"github":githubProfile[@"html_url"]
                     };

    return userInfo;
    
}


@end
