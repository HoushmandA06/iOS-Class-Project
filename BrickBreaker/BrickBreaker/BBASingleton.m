//
//  DNASingleton.m
//  DataNowApp
//
//  Created by Ali Houshmand on 5/6/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "BBASingleton.h"

@implementation BBASingleton

// the below can be used as template for use of singletons in future apps

+ (BBASingleton *)sharedSingleton
{
    static dispatch_once_t singletonBlock;
    static BBASingleton * singleton = nil;
    
    dispatch_once(&singletonBlock, ^ {
        singleton = [[BBASingleton alloc] init];
    });
    
    return singleton;
    
}


-(NSArray *)allRowsForSection:(NSString *)sectionName
{
    return self.sectionInfo[sectionName];
}


-(NSArray *)allSections
{
    return [self.sectionInfo allKeys];
}




@end
