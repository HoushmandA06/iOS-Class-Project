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
        self.bgView = [[UIView alloc] initWithFrame:CGRectMake(10, 0, self.frame.size.width - 20, 40)];
        self.bgView.layer.cornerRadius = 6;
        [self.contentView addSubview:self.bgView];
        
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(15,5,200,30)];
        self.nameLabel.textColor = [UIColor whiteColor];
        self.nameLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:18];
        [self.contentView addSubview:self.nameLabel];
        
        self.circleButton = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width - 40, 10, 20, 20)];
        self.circleButton.backgroundColor = [UIColor whiteColor];
        self.circleButton.layer.cornerRadius = 10;
        [self.contentView addSubview:self.circleButton];

        
       /* UIButton *strikeThrough = [[UIButton alloc] initWithFrame:CGRectMake(270, 10, 30, 30)];
        [strikeThrough setTitle:@"x" forState:UIControlStateNormal];
        strikeThrough.backgroundColor = [UIColor whiteColor];
        strikeThrough.layer.cornerRadius = 15;
        [strikeThrough addTarget:self action:@selector(newTodoitem) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:strikeThrough]; */
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
