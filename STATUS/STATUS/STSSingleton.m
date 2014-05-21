//
//  STSSingleton.m
//  STATUS
//
//  Created by Ali Houshmand on 5/21/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "STSSingleton.h"

@implementation STSSingleton

+(STSSingleton *)data;

{
    static dispatch_once_t create;
    static STSSingleton * singleton = nil;
    
    dispatch_once(&create, ^ {
        singleton = [[STSSingleton alloc] init];
        
    });
    
    return singleton;
    
}






@end
