//
//  TLATableViewCell.m
//  TweetLike
//
//  Created by Ali Houshmand on 4/23/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "TLATableViewCell.h"

@implementation TLATableViewCell
{
    UILabel * likesLabel;
    UILabel * textLabel;
    
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

    UIImageView * heart = [[UIImageView alloc] initWithFrame:CGRectMake(20,30,20,20)];
    heart.image = [UIImage imageNamed:@"grenade"];
        
    // heart.layer.masksToBounds = YES;
    [self.contentView addSubview:heart];
        
    likesLabel = [[UILabel alloc] initWithFrame:CGRectMake(60,30,30,20)];
    likesLabel.text = @"55";
    likesLabel.textAlignment = NSTextAlignmentCenter;
    likesLabel.textColor = [UIColor blueColor];
    [self.contentView addSubview:likesLabel];
        
    textLabel = [[UILabel alloc] initWithFrame:CGRectMake(100,0,200,80)];
    textLabel.text = @"blah blah blah blah blaaaaaaaaaaaaaaaaaaaaaaaah";
    textLabel.font = [UIFont systemFontOfSize:13];
    textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    textLabel.numberOfLines = 0; //allows as many lines as u need for the text, but row height/width need to work
    [self.contentView addSubview:textLabel];
        
    }
    return self;
}

- (void)setTweet:(NSDictionary *)tweet;
{
    _tweet = tweet;
   
    likesLabel.text = [tweet[@"likes"] stringValue];
    textLabel.text = tweet[@"text"];

    
}


- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
