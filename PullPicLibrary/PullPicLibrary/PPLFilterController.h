//
//  PPLFilterController.h
//  PullPicLibrary
//
//  Created by Ali Houshmand on 5/1/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PPLFilterControllerDelegate; // what is difference between line 11 and 21

@interface PPLFilterController : UIViewController

@property (nonatomic, assign) id<PPLFilterControllerDelegate> delegate;

@property (nonatomic) UIImage * imageToFilter;  // can have setter/getter

@end

@protocol PPLFilterControllerDelegate <NSObject>

-(void)updateCurrentImageWithFilteredImage:(UIImage *)image;

@end
