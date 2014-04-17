//
//  DLAStage.m
//  DrawLinesApp
//
//  Created by Ali Houshmand on 4/15/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "DLAStageLines.h"

@implementation DLAStageLines


//- (id)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        // Initialization code
//
//        self.lines = [@[] mutableCopy];
//        self.lineWidth = 2.0;  // default width
//        self.lineColor = [UIColor colorWithWhite:0.3 alpha:1.0];  // default color
//    }
//    return self;
//}


//-(void)clearStage
//{
//    [self.lines removeAllObjects];
//    [self setNeedsDisplay]; // re-renders the page
//}
//
//-(void)undo
//{
//    [self.lines removeLastObject];
//    
//    [self setNeedsDisplay];
//}



// - (void)drawRect:(CGRect)rect
//{
//    CGContextRef context = UIGraphicsGetCurrentContext(); // remind me what is context
//    CGContextSetLineCap(context, kCGLineCapRound);
//    CGContextClearRect(context, rect);
//    CGContextSetLineWidth(context, self.lineWidth);
//    CGContextClearRect(context, rect);
//    
//    [self.lineColor set];
//    
//    for (NSDictionary * line in self.lines) {
//        
//        CGContextSetLineWidth(context, [line[@"width"] floatValue]);
//        [(UIColor *)line[@"color"] set];
//        
//        CGPoint start = [line[@"points"][0] CGPointValue];
//        CGPoint end = [line[@"points"][1] CGPointValue];
//            
//        CGContextMoveToPoint(context, start.x, start.y);
//        CGContextAddLineToPoint(context, end.x, end.y);
//        CGContextStrokePath(context); // to break up line properties for next line
//    }
// }

 

//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    
//    
//    for (UITouch * touch in touches)
//    {
//        CGPoint location = [touch locationInView:self];
//        
//        [self.lines addObject:[@{
//                                @"color" : self.lineColor,
//                                @"width" : @(self.lineWidth), // makes the float (or an int) an object
//                                @"points" : [
//                                             @[
//                                               [NSValue valueWithCGPoint:location],
//                                               [NSValue valueWithCGPoint:location]
//                                               ] mutableCopy]
//                                } mutableCopy]];
//        
//        
//        NSLog(@"Touch X %f Y %f",location.x,location.y);
//        
//        
//    }
//    
//    [self setNeedsDisplay];
//}



-(void)doTouch:(NSSet *)touches;
{
    UITouch * touch = [touches allObjects][0];
    CGPoint location = [touch locationInView:self];
    [self.lines lastObject][@"points"][1] = [NSValue valueWithCGPoint:location];
    [self setNeedsDisplay];
}


@end