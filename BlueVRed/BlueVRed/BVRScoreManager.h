//
//  BVRScoreManager.h
//  BlueVRed
//
//  Created by Ali Houshmand on 5/7/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BVRScoreManager : NSObject

+(BVRScoreManager *)mainData;

@property (nonatomic) NSInteger scoreCountBlue;
@property (nonatomic) NSInteger scoreCountRed;
@property (nonatomic) NSInteger scoreTotal;

@end
