//
//  TDLTableViewCell.m
//  NewToDo
//
//  Created by Ali Houshmand on 4/8/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "TDLTableViewCell.h"

@implementation TDLTableViewCell

{
    UILabel *profileName;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.backgroundColor = [UIColor blackColor];
        
        profileName = [[UILabel alloc] initWithFrame:CGRectMake(100, 20, 200, 30)];
        profileName.font = [UIFont systemFontOfSize:30];
        profileName.textColor = [UIColor whiteColor];
        [self.contentView addSubview:profileName];
        
    }
    return self;
}

- (void)setProfileInfo:(NSDictionary *)profileInfo; // THIS IS A SETTER
{

    profileName.text = profileInfo[@"name"];
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
