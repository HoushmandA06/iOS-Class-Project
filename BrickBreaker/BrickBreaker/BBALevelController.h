//
//  BBALevelController.h
//  BrickBreaker
//
//  Created by Ali Houshmand on 4/17/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BBALevelDelegate;

@interface BBALevelController : UIViewController

@property (nonatomic, assign) id<BBALevelDelegate> delegate;

-(void)resetLevel;

@end

@protocol BBALevelDelegate <NSObject>

@optional  //when you run optional methods in protocol, you need an if/then test where it's being called

-(void) addPoints:(int)points;
-(void) gameDone;

@end
