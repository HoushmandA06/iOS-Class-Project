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
    NSMutableDictionary * userInfo = [@{} mutableCopy];
    
    NSString * github = [NSString stringWithFormat:@"https://api.github.com/users/%@",username];
    
    NSURL * url = [NSURL URLWithString:github];
    
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    NSURLResponse * response = nil;
    NSError * error = nil;
    NSData * responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSError * jsonError = nil;
    NSDictionary * githubProfile = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&jsonError];
    
    if(githubProfile[@"name"] != nil) userInfo[@"name"] = githubProfile[@"name"];
    if(githubProfile[@"avatar_url"] != nil) userInfo[@"image"] = githubProfile[@"avatar_url"];
    if(githubProfile[@"html_url"] != nil) userInfo[@"github"] = githubProfile[@"html_url"];
    
    return userInfo;
    
}


@end
