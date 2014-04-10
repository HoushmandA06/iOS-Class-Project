//
//  TDLTableViewCell.m
//  NewToDo
//
//  Created by Ali Houshmand on 4/8/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "TDLTableViewCell.h"
#import "MOVE.h"

@implementation TDLTableViewCell

{
    UIButton * submitButtonHigh;
    UIButton * submitButtonMed;
    UIButton * submitButtonLow;
    
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
        [self.bgView addSubview:self.nameLabel];
        
        self.strikeThrough = [[UIView alloc] initWithFrame:CGRectMake(5, 22, self.frame.size.width - 30, 1)];
        self.strikeThrough.backgroundColor = [UIColor whiteColor];
        self.strikeThrough.alpha = 0;
        [self.bgView addSubview:self.strikeThrough];
        
        self.circleButton = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width - 50, 10, 20, 20)];
        self.circleButton.backgroundColor = [UIColor whiteColor];
        self.circleButton.layer.cornerRadius = 10;
        [self.bgView addSubview:self.circleButton];

    }
    return self;
}

- (void)showCircleButtons
{
    
    submitButtonHigh = [[UIButton alloc] initWithFrame:CGRectMake(270, 5, 30, 30)];
    submitButtonHigh.tag = 3;
    submitButtonHigh.alpha = 0;
    [submitButtonHigh setTitle:@"H" forState:UIControlStateNormal];
    submitButtonHigh.backgroundColor = RED_COLOR;
    submitButtonHigh.layer.cornerRadius = 15;
    // [submitButtonHigh addTarget:self action:@selector(newTodoitem:) forControlEvents:UIControlEventTouchUpInside]
    [self.contentView addSubview:submitButtonHigh];
    
    
    submitButtonMed = [[UIButton alloc] initWithFrame:CGRectMake(235, 5, 30, 30)];
    submitButtonMed.tag = 2;
    submitButtonMed.alpha = 0;
    [submitButtonMed setTitle:@"M" forState:UIControlStateNormal];
    submitButtonMed.backgroundColor = ORANGE_COLOR;
    submitButtonMed.layer.cornerRadius = 15;
    //[submitButtonMed addTarget:self action:@selector(newTodoitem:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:submitButtonMed];
    
    
    submitButtonLow = [[UIButton alloc] initWithFrame:CGRectMake(200, 5, 30, 30)];
    submitButtonLow.tag = 1;
    submitButtonLow.alpha = 0;
    [submitButtonLow setTitle:@"L" forState:UIControlStateNormal];
    submitButtonLow.backgroundColor = YELLOW_COLOR;
    submitButtonLow.layer.cornerRadius = 15;
    //[submitButtonLow addTarget:self action:@selector(newTodoitem:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:submitButtonLow];
    
    [MOVE animateView:submitButtonLow properties:@{@"alpha":@1,@"duration":@0.2,@"delay":@0.3}];
    [MOVE animateView:submitButtonMed properties:@{@"alpha":@1,@"duration":@0.2,@"delay":@0.2}];
    [MOVE animateView:submitButtonHigh properties:@{@"alpha":@1,@"duration":@0.2,@"delay":@0.1}];
    
    
}

-(void)hideCircleButtons
{
    
    [MOVE animateView:submitButtonLow properties:@{@"alpha":@0,@"duration":@0.2,@"delay":@0.0, @"remove":@YES}];
    [MOVE animateView:submitButtonMed properties:@{@"alpha":@0,@"duration":@0.2,@"delay":@0.1,@"remove":@YES}];
    [MOVE animateView:submitButtonHigh properties:@{@"alpha":@0,@"duration":@0.2,@"delay":@0.2,@"remove":@YES}];

}



/*- (void)setProfileInfo:(NSDictionary *)profileInfo; // THIS IS A SETTER
{

    profileName.text = profileInfo[@"name"];
    _profileInfo = profileInfo;
    
}*/


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