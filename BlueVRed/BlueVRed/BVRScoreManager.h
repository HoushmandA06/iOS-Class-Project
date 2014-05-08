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

@property (nonatomic) NSInteger scoreCountBlue;  //have getters/setters, by default = nill, which for NSInt = 0
@property (nonatomic) NSInteger scoreCountRed;
@property (nonatomic) NSInteger scoreTotal;

@end
