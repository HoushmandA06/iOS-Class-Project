//
//  DLAStage.m
//  DrawLinesApp
//
//  Created by Ali Houshmand on 4/15/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "DLAStageLines.h"

@implementation DLAStageLines
{
    NSMutableArray * lines;
    
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code

        lines = [@[] mutableCopy];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

 
 - (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, rect);
    
    [[UIColor blueColor] set]; //color of line
    
    CGContextSetLineWidth(context, 2.0); //thickness of the line
    CGContextSetLineCap(context, kCGLineCapRound); //makes a line a dot if just pressing once
    
    
    
    for (NSArray * line in lines) {
        
        CGPoint start = [line[0] CGPointValue];
        CGPoint end = [line[1] CGPointValue];
        
        CGContextMoveToPoint(context, start.x, start.y);
        CGContextAddLineToPoint(context, end.x, end.y);

        CGContextStrokePath(context); //run this to break up a line or shape
        
    }

 }

 

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch * touch in touches)
    {
        CGPoint location = [touch locationInView:self];
        
        [lines addObject:[@[
                            [NSValue valueWithCGPoint:location],
                            [NSValue valueWithCGPoint:location]
                            ] mutableCopy]];
        
//        UIBezierPath * path = [[UIBezierPath alloc] init];
//        [path addLineToPoint:location];
//        [self addSubview:path.copy];
//        [self.layer addSublayer:path.bezierPath];
        
        
        NSLog(@"Touch X %f Y %f",location.x,location.y);
    }
    
    [self setNeedsDisplay];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch * touch in touches)
    {
        CGPoint location = [touch locationInView:self];
        
        [lines lastObject][1] = [NSValue valueWithCGPoint:location];
        
        
        
        NSLog(@"Touch X %f Y %f",location.x,location.y);
    }
        [self setNeedsDisplay];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch * touch in touches)
    {
        CGPoint location = [touch locationInView:self];
        
        [lines lastObject][1] = [NSValue valueWithCGPoint:location];

        
        NSLog(@"Touch X %f Y %f",location.x,location.y);
    }
        [self setNeedsDisplay];
}




@end
