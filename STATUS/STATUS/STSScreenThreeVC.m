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
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
   
        bigSmile = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-(72+176),SCREEN_HEIGHT-(192+176),176,176)];
        bigSmile.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:bigSmile];
        
        twitter = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-(72+176), SCREEN_HEIGHT-(292+176), 48,48)];
        [twitter setImage:[UIImage imageNamed:@"sm_twitter"] forState:UIControlStateNormal];
        [self.view addSubview:twitter];
        
        googleplus = [[UIButton alloc] initWithFrame:CGRectMake(twitter.frame.origin.x +48+16, SCREEN_HEIGHT-(292+176), 48,48)];
        [googleplus setImage:[UIImage imageNamed:@"sm_google"] forState:UIControlStateNormal];
        [self.view addSubview:googleplus];
        
        facebook = [[UIButton alloc] initWithFrame:CGRectMake(googleplus.frame.origin.x +48+16, SCREEN_HEIGHT-(292+176), 48,48)];
        [facebook setImage:[UIImage imageNamed:@"sm_facebook"] forState:UIControlStateNormal];
        [self.view addSubview:facebook];
        
        
    
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    thirdCheck = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH/2)-32, SCREEN_HEIGHT-80, 64, 40)];
    [thirdCheck setImage:[UIImage imageNamed:@"check.png"] forState:UIControlStateNormal];
 //   [thirdCheck addTarget:self action:@selector(goToScreenThree) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:thirdCheck];
    
    
    
    
 
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
