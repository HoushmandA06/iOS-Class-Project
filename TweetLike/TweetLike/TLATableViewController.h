//
//  TLATableViewController.h
//  TweetLike
//
//  Created by Ali Houshmand on 4/23/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TLATableViewController : UITableViewController 

@property (nonatomic) NSMutableArray * tweetItems;

@property (nonatomic, getter = isTweetItemsEmpty,readonly) BOOL tweetItemsEmpty;

-(void)createNewTweet:(NSString *)tweet;


@end
