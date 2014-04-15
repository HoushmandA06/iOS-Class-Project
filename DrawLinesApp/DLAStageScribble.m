//
//  DLAStageScribble.m
//  DrawLinesApp
//
//  Created by Ali Houshmand on 4/15/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "DLAStageScribble.h"

@implementation DLAStageScribble
{
    NSMutableArray * scribbles;
    UIButton * redColorButton;
    UIButton * greenColorButton;
    UIButton * blueColorButton;
    UISlider * widthSlider;
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        scribbles = [@[] mutableCopy];
        
        redColorButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-300, SCREEN_HEIGHT * .85, 50, 50)];
        redColorButton.tag = 0;
        [redColorButton setTitle:@"Red" forState:UIControlStateNormal];
        [redColorButton addTarget:self action:@selector(changeLineColor) forControlEvents:UIControlEventTouchUpInside];
        [redColorButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        redColorButton.backgroundColor = [UIColor redColor];
        redColorButton.layer.cornerRadius = 25;
        [self addSubview:redColorButton];
        
        greenColorButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-240, SCREEN_HEIGHT * .85, 50, 50)];
        greenColorButton.tag = 1;
        [greenColorButton setTitle:@"Green" forState:UIControlStateNormal];
        [greenColorButton addTarget:self action:@selector(changeLineColor) forControlEvents:UIControlEventTouchUpInside];
        [greenColorButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        greenColorButton.backgroundColor = [UIColor greenColor];
        greenColorButton.layer.cornerRadius = 25;
        [self addSubview:greenColorButton];
        
        blueColorButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-180, SCREEN_HEIGHT * .85, 50, 50)];
        blueColorButton.tag = 2;
        [blueColorButton setTitle:@"Blue" forState:UIControlStateNormal];
        [blueColorButton addTarget:self action:@selector(changeLineColor) forControlEvents:UIControlEventTouchUpInside];
        [blueColorButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        blueColorButton.backgroundColor = [UIColor blueColor];
        blueColorButton.layer.cornerRadius = 25;
        [self addSubview:blueColorButton];
        
        widthSlider = [[UISlider alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-300, SCREEN_HEIGHT * .75,170,30)];
        widthSlider.backgroundColor = [UIColor blackColor];
        // [widthSlider addTarget:self action:@selector(<#selector#>) forControlEvents:...]
        widthSlider.layer.cornerRadius = 6;
        [self addSubview:widthSlider];
        
        
        
    }
    return self;
}


-(void)changeLineColor
{
//would set the property of the UIColor
    
    
    
    
}



// override my setters inside UIView subclass, [self setNeedsDisplay] after the color changes and line width changes




// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineWidth(context, 5.0);
    
 
    
    [[UIColor blueColor] set];
    
    for (NSArray * scribble in scribbles)
    {
        NSLog(@"%d",[scribble count]);
        CGPoint start = [scribble[0] CGPointValue];
        CGContextMoveToPoint(context, start.x, start.y);
        for (NSValue * value in scribble) {

            //int index = [scribble indexOfObject:value];
            
            CGPoint point = [value CGPointValue];

            //if (index > 0 || [scribble count] < 3)
                CGContextAddLineToPoint(context, point.x, point.y);
        }
        CGContextStrokePath(context); //run this to break up a line or shape
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    for (UITouch * touch in touches) {
        CGPoint location = [touch locationInView:self];
        [scribbles addObject:[@[
                                [NSValue valueWithCGPoint:location]]
                                mutableCopy]];
        
    }
    [self setNeedsDisplay];
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch * touch in touches) {
        CGPoint location = [touch locationInView:self];
        [[scribbles lastObject] addObject:[NSValue valueWithCGPoint:location]];
    

    }
    [self setNeedsDisplay];
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch * touch in touches) {
        CGPoint location = [touch locationInView:self];
        [[scribbles lastObject] addObject:[NSValue valueWithCGPoint:location]];

    }
    [self setNeedsDisplay];
}




@end
