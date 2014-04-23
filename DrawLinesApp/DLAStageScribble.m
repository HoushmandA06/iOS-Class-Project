//
//  DLAStageScribble.m
//  DrawLinesApp
//
//  Created by Ali Houshmand on 4/15/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "DLAStageScribble.h"

@implementation DLAStageScribble



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        
        self.lines = [@[] mutableCopy];
        self.lineWidth = 2.0;  // default width
        self.lineColor = [UIColor colorWithWhite:0.3 alpha:1.0];  // default color

        self.backgroundColor = [UIColor blackColor];
    
    }
    return self;
}


-(void)clearStage
{
    [self.lines removeAllObjects];
    [self setNeedsDisplay]; // re-renders the page
}

-(void)undo
{
    [self.lines removeLastObject];
    [self setNeedsDisplay];
}



-(void)setLineWidth:(float)lineWidth
{
    _lineWidth = lineWidth;  // _lineWidth setter
    [self setNeedsDisplay];
}



    
-(void)setLineColor:(UIColor *)lineColor
{
    _lineColor = lineColor;
    [self setNeedsDisplay];
}


- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();  //addellipseinrect, fill path ---> play with CGContext Reference
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineJoin(context, kCGLineJoinRound);
    CGContextSetLineWidth(context, self.lineWidth);

    [[UIColor redColor] set]; // sequence matters with set
    
//    CGContextSetFillColor(context, CGColorGetComponents([UIColor redColor].CGColor));
    
    CGContextMoveToPoint(context, 50, 50);
    CGContextAddCurveToPoint(context, 270, 50, 270, 400, 50, 400);
    CGContextStrokePath(context);
    
    CGContextMoveToPoint(context, 100, 100);
    CGContextFillEllipseInRect(context, CGRectMake(75, 75, 50, 50)); //makes a filled circle
    CGContextStrokePath(context);
    CGContextFillRect (context, CGRectMake (50, 150, 100, 200));
    
    
    
    // CGContextClearRect(context, rect);  clears the context
    
    [self.lineColor set];
    
    for (NSDictionary * line in self.lines)
    {
        CGContextSetLineWidth(context, [line[@
                              "width"] floatValue]);
        [(UIColor *)line[@"color"] set];

        NSLog(@"%d",[line count]);

        NSArray * points = line[@"points"];
        CGPoint start = [points[0] CGPointValue];
        CGContextMoveToPoint(context, start.x, start.y);
        
        for (NSValue * value in points) {

            //int index = [scribble indexOfObject:value];
            //if (index > 0 || [scribble count] < 3)
            
            CGPoint point = [value CGPointValue];
            CGContextAddLineToPoint(context, point.x, point.y);
        }
        CGContextStrokePath(context); //run this to break up a line or shape
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    for (UITouch * touch in touches) {
        CGPoint location = [touch locationInView:self];
        
//        [self.lines addObject:[@[
//                                [NSValue valueWithCGPoint:location]]
//                                mutableCopy]];
        
        [self.lines addObject:[@{
                              @"color" : self.lineColor,
                              @"width" : @(self.lineWidth), // makes the float (or an int) an object
                              @"points" : [@[[NSValue valueWithCGPoint:location]] mutableCopy]} mutableCopy]];
        
        
    }
    [self setNeedsDisplay];
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self doTouch:touches];
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self doTouch:touches];
}


-(void)doTouch:(NSSet *)touches;
{
    UITouch * touch = [touches allObjects][0];
    CGPoint location = [touch locationInView:self];
    [[self.lines lastObject][@"points"] addObject:[NSValue valueWithCGPoint:location]];
    [self setNeedsDisplay];
}



@end
