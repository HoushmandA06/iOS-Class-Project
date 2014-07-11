//
//  DLAStageScribble.h
//  DrawLinesApp
//
//  Created by Ali Houshmand on 6/18/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DLAStageScribble : UIView


@property (nonatomic) float lineWidth;
@property (nonatomic) UIColor * lineColor;
@property (nonatomic) NSMutableArray * lines;

-(void)clearStage;
-(void)undo;

@end
