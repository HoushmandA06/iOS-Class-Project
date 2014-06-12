//
//  STSSingleton.h
//  STATUS
//
//  Created by Ali Houshmand on 5/21/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STSSingleton : NSObject


+(STSSingleton *)data;

@property (nonatomic) NSInteger color;
@property (nonatomic) NSInteger smiley;
@property (nonatomic) NSString * cityState;
@property (nonatomic) float latitude;
@property (nonatomic) float longitude;
@property (nonatomic) NSString * endDate;
@property (nonatomic) NSString * beginDate;

@end
