//
//  SLFTableViewCell.m
//  Selfy
//
//  Created by Ali Houshmand on 4/21/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "SLFTableViewCell.h"

@implementation SLFTableViewCell

{
    UIImageView *profileImage; // frame for the image
    UIImageView *profileAvatar; // frame for the avatar
    UILabel *profileUserId; // label for UserId
    UILabel *profileCaption; // label for caption
    
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
       

//        self.backgroundColor = [UIColor blackColor];
        
        profileImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
        profileImage.layer.cornerRadius = 30;
        profileImage.layer.masksToBounds = YES;
        [self.contentView addSubview:profileImage];
        
        profileAvatar = [[UIImageView alloc] initWithFrame:CGRectMake(0, 320, 30, 30)];
        profileAvatar.layer.cornerRadius = 15;
        profileAvatar.layer.masksToBounds = YES;
        [self.contentView addSubview:profileAvatar];
        
        profileUserId = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 200, 30)];
        profileUserId.textColor = [UIColor blueColor];
        profileUserId.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:profileUserId];

        profileCaption = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 30)];
        profileCaption.textColor = [UIColor blueColor];
        profileCaption.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:profileCaption];
    }
    return self;
}

- (void)setProfileInfo:(NSDictionary *)profileInfo; // THIS IS A SETTER
{
    NSString *imageUrlString = profileInfo[@"image"];
    NSURL *imageUrl = [[NSURL alloc] initWithString:imageUrlString];
    NSData *imageData = [NSData dataWithContentsOfURL:imageUrl];
    UIImage *image = [UIImage imageWithData:imageData];
    profileImage.image = image;
    profileImage.contentMode = UIViewContentModeScaleAspectFit;
    
    NSString *avatarUrlString = profileInfo[@"avatar"];
    NSURL *avatarUrl = [[NSURL alloc] initWithString:avatarUrlString];
    NSData *avatarData = [NSData dataWithContentsOfURL:avatarUrl];
    UIImage *avatarImage = [UIImage imageWithData:avatarData];
    profileAvatar.image = avatarImage;
    profileAvatar.contentMode = UIViewContentModeScaleAspectFit;

    profileCaption.text = profileInfo[@"caption"];
    
    profileUserId.text = profileInfo[@"userid"];
    
    _profileInfo = profileInfo;
    
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
