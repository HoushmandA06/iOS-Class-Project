//
//  SCGCircle.m
//  Squares
//
//  Created by Ali Houshmand on 4/11/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "SCGCircle.h"

@implementation SCGCircle

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        self.backgroundColor = [UIColor clearColor];
        
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

 - (void)drawRect:(CGRect)rect
{
    //Drawing code
    
    CGContextRef context = UIGraphicsGetCurrentContext(); //gets your drawing context, grabs the "paper" for ur drawing
    
    [[UIColor lightGrayColor]set];  //sets the color you are drawing with
    
    float dotXY = (self.frame.size.width - 20) / 2; //
    
    CGContextAddEllipseInRect(context, CGRectMake(dotXY, dotXY, 20, 20));
    
    CGContextFillPath(context);
    
}


@end
