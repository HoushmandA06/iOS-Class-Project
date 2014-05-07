//
//  BVRScoreManager.m
//  BlueVRed
//
//  Created by Ali Houshmand on 5/7/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "BVRScoreManager.h"

@implementation BVRScoreManager

+(BVRScoreManager *)mainData
{
    static dispatch_once_t create;
    static BVRScoreManager * singleton = nil;
    
    dispatch_once(&create, ^{
        singleton = [[BVRScoreManager alloc] init];
    });
    return singleton;
}

-(id)init
{
    self = [super init];
    if(self)
    {
        self.scoreCountBlue = 0;
        self.scoreCountRed = 0;
        self.scoreTotal = 0;
    }
    return self;
}

-(NSInteger)scoreCountBlue
{
    return _scoreCountBlue;
}

-(NSInteger)scoreCountRed
{
    return _scoreCountRed;
}

-(NSInteger)scoreTotal
{
    return _scoreTotal;
}



@end
