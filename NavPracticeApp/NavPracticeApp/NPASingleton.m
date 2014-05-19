//
//  NPASingleton.m
//  NavPracticeApp
//
//  Created by Ali Houshmand on 5/19/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "NPASingleton.h"

@implementation NPASingleton

+(NPASingleton *)data
{
    
    static dispatch_once_t create;
    static NPASingleton * singleton = nil;
    
    dispatch_once(&create, ^ {
        singleton = [[NPASingleton alloc] init];
    });
    
    return singleton;

}








@end
