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


@end
