//
//  TDLTableViewCell.m
//  ToDo
//
//  Created by Ali Houshmand on 4/3/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "TDLTableViewCell.h"

@implementation TDLTableViewCell

// @synthesize profileInfo = _profileInfo;  //can do multiple properties, separate with commas  WE DONT NEED THIS ANYMORE
{
    UIImageView *profileImage;
    UILabel *profileName;
    UILabel *profileURL;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.backgroundColor = [UIColor blackColor];
    
        profileImage = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 60, 60)];
        profileImage.layer.cornerRadius = 30;
        profileImage.layer.masksToBounds = YES;
        [self.contentView addSubview:profileImage];
        
        profileName = [[UILabel alloc] initWithFrame:CGRectMake(100, 20, 200, 30)];
        profileName.font = [UIFont systemFontOfSize:30];
        profileName.textColor = [UIColor whiteColor];
        [self.contentView addSubview:profileName];
        
        profileURL = [[UILabel alloc] initWithFrame:CGRectMake(100, 50, 200, 30)];
        profileURL.textColor = [UIColor blueColor];
        profileURL.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:profileURL];
        
    }
    return self;
}

/*- (NSDictionary *)profileInfo    THIS IS A GETTER, WE ARE NOT USING IT ANYMORE
{
    if (_profileInfo == nil)
    {
        _profileInfo = @{@"name":@"Default Name",@"image":[UIImage imageNamed:@"default"]};
    }
    
    return _profileInfo;
    
    //@property does the above for you, in this case, we are overwriting with a specific case for the property "profile" which we defined in the .h
    
    
}*/

- (void)setProfileInfo:(NSDictionary *)profileInfo; // THIS IS A SETTER
{
    NSString *imageUrlString = profileInfo[@"image"];
    
    NSURL *imageUrl = [[NSURL alloc] initWithString:imageUrlString];
    NSData *imageData = [NSData dataWithContentsOfURL:imageUrl];
    
    UIImage *image = [UIImage imageWithData:imageData];
    profileImage.image = image;
    
    profileName.text = profileInfo[@"name"];
    profileURL.text = profileInfo[@"github"];
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
