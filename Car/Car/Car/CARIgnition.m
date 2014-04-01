//
//  CARIgnition.m
//  Car
//
//  Created by Ali Houshmand on 4/1/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "CARIgnition.h"

@implementation CARIgnition

- (id)init
{
    self = [super init];
    if (self)
    {
        
        self.backgroundColor = [UIColor greenColor];
        self.layer.cornerRadius = 25;
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
