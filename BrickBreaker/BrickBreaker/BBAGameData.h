//
//  BBAGameData.h
//  BrickBreaker
//
//  Created by Ali Houshmand on 5/7/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BBAGameData : NSObject

+(BBAGameData *)mainData;

@property (nonatomic, readonly) NSInteger topScore;
@property (nonatomic) NSInteger currentScore;

-(NSArray *)gameScores;


@end
