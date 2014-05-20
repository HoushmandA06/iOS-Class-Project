//
//  STSScreenThreeVC.m
//  STATUS
//
//  Created by Ali Houshmand on 5/19/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "STSScreenThreeVC.h"
#import "STSScreenOneVC.h"
#import "STSScreenTwoVC.h"

@interface STSScreenThreeVC ()

@end

@implementation STSScreenThreeVC
{
    UIButton * thirdCheck;
    UIImageView * bigSmile;
    UIButton * facebook;
    UIButton * googleplus;
    UIButton * twitter;
    
    NSArray * bigYellowSmiles;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
   
        

        bigYellowSmiles = @[@"yellow_1",@"yellow_2",@"yellow_3",@"yellow_4",@"yellow_5",@"yellow_6",@"yellow_7",@"yellow_8",@"yellow_9"];
        
        bigSmile = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-(72+176),SCREEN_HEIGHT-(192+176),176,176)];
        bigSmile.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:bigSmile];
        
        twitter = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-(72+176), SCREEN_HEIGHT-(292+176), 48,48)];
        [twitter setImage:[UIImage imageNamed:@"sm_twitter_g"] forState:UIControlStateNormal];
        [twitter setImage:[UIImage imageNamed:@"sm_twitter"] forState:UIControlStateSelected];
        [twitter addTarget:self action:@selector(buttonSelected:) forControlEvents:UIControlEventTouchUpInside];
        [twitter setTag:1];
        [self.view addSubview:twitter];
        
        googleplus = [[UIButton alloc] initWithFrame:CGRectMake(twitter.frame.origin.x +48+16, SCREEN_HEIGHT-(292+176), 48,48)];
        [googleplus setImage:[UIImage imageNamed:@"sm_google_g"] forState:UIControlStateNormal];
        [googleplus setImage:[UIImage imageNamed:@"sm_google"] forState:UIControlStateSelected];
        [googleplus addTarget:self action:@selector(buttonSelected:) forControlEvents:UIControlEventTouchUpInside];
        [googleplus setTag:2];
        [self.view addSubview:googleplus];
        
        facebook = [[UIButton alloc] initWithFrame:CGRectMake(googleplus.frame.origin.x +48+16, SCREEN_HEIGHT-(292+176), 48,48)];
        [facebook setImage:[UIImage imageNamed:@"sm_facebook_g"] forState:UIControlStateNormal];
        [facebook setImage:[UIImage imageNamed:@"sm_facebook"] forState:UIControlStateSelected];
        [facebook addTarget:self action:@selector(buttonSelected:) forControlEvents:UIControlEventTouchUpInside];
        [facebook setTag:3];
        [self.view addSubview:facebook];

    }
    return self;
}

-(void)buttonSelected:(UIButton *)sender
{
    
    NSArray* buttons = [NSArray arrayWithObjects:twitter,googleplus,facebook, nil];
    for (UIButton* button in buttons) {
        if (button.tag == sender.tag)
        {
            if(button.selected == YES)
            { [button setSelected:NO];
            } else
                button.selected = YES;
        }
    }

    
//    if(sender.tag == 1)
//    {
//       if(twitter.selected == YES)
//       {
//        [twitter setSelected:NO];
//       } else
//           twitter.selected = YES;
//    }

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    thirdCheck = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH/2)-32, SCREEN_HEIGHT-80, 64, 40)];
    [thirdCheck setImage:[UIImage imageNamed:@"check.png"] forState:UIControlStateNormal];
 //   [thirdCheck addTarget:self action:@selector(goToScreenThree) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:thirdCheck];
    
}

-(void)viewWillLayoutSubviews
{
    
    NSLog(@"%ld",(long)self.colorTagScreenOne);
    NSLog(@"%ld",(long)self.colorTagScreenTwo);
    
    if(self.colorTagScreenOne == 0)
    {
      //  bigSmile.image = [UIImage imageNamed:bigYellowSmiles[self.colorTagScreenTwo]];
        [bigSmile setImage:[UIImage imageNamed:bigYellowSmiles[self.colorTagScreenTwo]]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
