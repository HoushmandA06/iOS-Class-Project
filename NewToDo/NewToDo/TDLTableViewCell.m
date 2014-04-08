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
        
        profileName = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 200, 30)];
        profileName.font = [UIFont systemFontOfSize:30];
        profileName.textColor = [UIColor whiteColor];
        [self.contentView addSubview:profileName];
        
        UIButton *strikeThrough = [[UIButton alloc] initWithFrame:CGRectMake(270, 10, 30, 30)];
        [strikeThrough setTitle:@"x" forState:UIControlStateNormal];
        strikeThrough.backgroundColor = [UIColor blueColor];
        strikeThrough.layer.cornerRadius = 15;
        [strikeThrough addTarget:self action:@selector(newTodoitem) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:strikeThrough];
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
