//
//  BBAGameData.m
//  BrickBreaker
//
//  Created by Ali Houshmand on 5/7/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "BBAGameData.h"

@implementation BBAGameData

+(BBAGameData *)mainData //singleton method, creates an instance object
{
    static dispatch_once_t create; //declares a block that will be called once
    
    static BBAGameData * singleton = nil;
    
    //below will alloc once only
    dispatch_once(&create, ^ {
        singleton = [[BBAGameData alloc] init];
    });
    
    return singleton;
    
}

//self.currentScore, -currentScore,return _currentScore, getter
// self.currentScore = 100;  setCurrentScore,_currentScore = currentScore, assignment involved, setter
// property is an accessor to an instance object (getter,setter)

-(void)setCurrentScore:(NSInteger)currentScore
{
    _currentScore = currentScore;
    
    if(currentScore > _topScore) _topScore = currentScore;
    
    NSLog(@"currentScore %d _topScore %d",currentScore,_topScore);
    
    
}


-(NSArray *)gameScores;
{
    return @[];
    
}


@end
