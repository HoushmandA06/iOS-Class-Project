//
//  TTTCoolView.m
//  Day2Lecture
//
//  Created by Ali Houshmand on 4/1/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "TTTCoolView.h"

@implementation TTTCoolView



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


+ (NSNumber *)randomNumber

{
    NSNumber *num;
    
    num = @5;
    
    return num;

}

- (NSString *)whatIsMyTitle
{
    return self.coolTitle;
    
}


@end
