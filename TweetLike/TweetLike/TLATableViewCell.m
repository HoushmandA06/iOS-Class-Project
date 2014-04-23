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
    
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

    UIImageView * heart = [[UIImageView alloc] initWithFrame:CGRectMake(20,30,20,20)];
    heart.image = [UIImage imageNamed:@"heart"];
    // heart.layer.masksToBounds = YES;
    [self.contentView addSubview:heart];
        
    
        
        
    }
    return self;
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
