//
//  TLANavController.h
//  TweetLike
//
//  Created by Ali Houshmand on 4/23/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TLATableViewController; // did this so void will recognize TLATVC, because in the .m we will import the required file to make methods work in same .m

@interface TLANavController : UINavigationController <UITextViewDelegate>

-(void)addTableViewController:(TLATableViewController *)viewController;


@end
