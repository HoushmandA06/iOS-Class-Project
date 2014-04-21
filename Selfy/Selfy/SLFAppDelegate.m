//
//  SLFAppDelegate.m
//  Selfy
//
//  Created by Ali Houshmand on 4/21/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "SLFAppDelegate.h"
#import "SLFTableViewController.h"

@implementation SLFAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.

    
    self.window.rootViewController = [[SLFTableViewController alloc] initWithStyle:UITableViewStylePlain];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}



@end
