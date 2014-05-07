//
//  BVRSecondVC.h
//  BlueVRed
//
//  Created by Ali Houshmand on 5/7/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BVRBlueVCDelegate;

@interface BVRBlueVC : UIViewController

@property (nonatomic, assign) id<BVRBlueVCDelegate> delegate;

@end

@protocol BVRBlueVCDelegate <NSObject>

-(void)setBlueScore:(NSInteger)scoreCountBlue;
-(void)setRedScore:(NSInteger)scoreCountRed;

@end
