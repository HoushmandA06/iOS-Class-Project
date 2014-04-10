//
//  TDLTableViewCell.h
//  NewToDo
//
//  Created by Ali Houshmand on 4/8/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TDLTableViewCellDelegate; // declaration

@interface TDLTableViewCell : UITableViewCell

@property (nonatomic,assign) id<TDLTableViewCellDelegate> delegate;

@property (nonatomic) UILabel *nameLabel;
@property (nonatomic) UIView *bgView;
@property (nonatomic) UIButton *circleButton;
@property (nonatomic) UIView *strikeThrough;
@property (nonatomic) BOOL struck; // not using this now, replaced with TJ method (using "constant" key)
@property (nonatomic) BOOL swiped;

-(void)resetLayout;

-(void)showCircleButtons;
-(void)hideCircleButtons;

-(void)showDeleteButton;
-(void)hideDeleteButton;

@end

@protocol TDLTableViewCellDelegate <NSObject> // definition

-(void)deleteItem:(TDLTableViewCell *)cell;
-(void)setItemPriority:(int)priority withItem:(TDLTableViewCell *)cell;


@optional

-(void)optionalMethod;


@end
