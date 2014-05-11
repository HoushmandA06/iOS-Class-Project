//
//  BVRViewController.m
//  BlueVRed
//
//  Created by Ali Houshmand on 5/7/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "BVRViewController.h"
#import "BVRBlueVC.h"
#import "BVRRedVC.h"
#import "BVRScoreManager.h"


@interface BVRViewController ()

@end

@implementation BVRViewController
{
    BVRBlueVC * blueVC;
    BVRRedVC * redVC;
    
    UILabel * blueScoreCard;
    UILabel * redScoreCard;
   
    UILabel * blueWins;
    UILabel * redWins;
    
    UIButton * start;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
 
        self.view.backgroundColor = [UIColor blackColor];

        
        
        /*
        blueVC = [[BVRBlueVC alloc] initWithNibName:nil bundle:nil];
        blueVC.delegate = self;
        [self.view addSubview:blueVC.view];
        
        blueScoreCard = [[UILabel alloc] initWithFrame:CGRectMake(0, 70, SCREEN_WIDTH, 100)];
        blueScoreCard.backgroundColor = [UIColor clearColor];
        blueScoreCard.textColor = [UIColor whiteColor];
        blueScoreCard.font = [UIFont fontWithName:@"Helvetica" size:70];
        blueScoreCard.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:blueScoreCard];

        redVC = [[BVRRedVC alloc] initWithNibName:nil bundle:nil];
        redVC.delegate = self;
        [self.view addSubview:redVC.view];
        
        redScoreCard = [[UILabel alloc] initWithFrame:CGRectMake(0, 310, SCREEN_WIDTH, 100)];
        redScoreCard.backgroundColor = [UIColor clearColor];
        redScoreCard.textColor = [UIColor whiteColor];
        redScoreCard.font = [UIFont fontWithName:@"Helvetica" size:70];
        redScoreCard.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:redScoreCard];
        */
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    start = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH)/2 - 50,(SCREEN_HEIGHT)/2-50,100,100)];
    start.backgroundColor = [UIColor colorWithWhite:0.30 alpha:0.5];
    
    [start setTitle:@"START" forState:UIControlStateNormal];
    start.layer.cornerRadius = 50;
    [start addTarget:self action:@selector(goLevelScreen) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:start];
    
}

-(void)goLevelScreen
{
    
    [start removeFromSuperview];

    blueVC = [[BVRBlueVC alloc] initWithNibName:nil bundle:nil];
    blueVC.delegate = self;
    [self.view addSubview:blueVC.view];
    
    blueScoreCard = [[UILabel alloc] initWithFrame:CGRectMake(0, 70, SCREEN_WIDTH, 100)];
    blueScoreCard.backgroundColor = [UIColor clearColor];
    blueScoreCard.textColor = [UIColor whiteColor];
    blueScoreCard.font = [UIFont fontWithName:@"Helvetica" size:70];
    blueScoreCard.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:blueScoreCard];
    
    redVC = [[BVRRedVC alloc] initWithNibName:nil bundle:nil];
    redVC.delegate = self;
    [self.view addSubview:redVC.view];
    
    redScoreCard = [[UILabel alloc] initWithFrame:CGRectMake(0, 310, SCREEN_WIDTH, 100)];
    redScoreCard.backgroundColor = [UIColor clearColor];
    redScoreCard.textColor = [UIColor whiteColor];
    redScoreCard.font = [UIFont fontWithName:@"Helvetica" size:70];
    redScoreCard.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:redScoreCard];
}

-(void)gameDone
{
 
    // HOW TO DELAY GAME DONE TO GIVE TIME FOR ANIMATION OF blueWins || redWins

        [blueWins removeFromSuperview];
        [redWins removeFromSuperview];
        [redVC.view removeFromSuperview];
        [blueVC.view removeFromSuperview];
        [blueScoreCard removeFromSuperview];
        [redScoreCard removeFromSuperview];
        
        [BVRScoreManager mainData].scoreCountBlue = 0;  // WHY IS THIS OK?
        [BVRScoreManager mainData].scoreCountRed = 0;
        
        [self.view addSubview:start];
}


-(void)setBlueScore:(NSInteger)scoreCountBlue
{
    blueScoreCard.text = [NSString stringWithFormat:@"%d",scoreCountBlue];
    
    blueVC.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT/2+[BVRScoreManager mainData].scoreCountBlue-[BVRScoreManager mainData].scoreCountRed);
    
    redVC.view.frame = CGRectMake(0, SCREEN_HEIGHT/2-[BVRScoreManager mainData].scoreCountRed+[BVRScoreManager mainData].scoreCountBlue, SCREEN_WIDTH, SCREEN_HEIGHT/2+([BVRScoreManager mainData].scoreCountRed-[BVRScoreManager mainData].scoreCountBlue));

    [self declareWinner];
    
}

-(void)setRedScore:(NSInteger)scoreCountRed
{
    redScoreCard.text = [NSString stringWithFormat:@"%d",scoreCountRed];
    
    redVC.view.frame = CGRectMake(0, SCREEN_HEIGHT/2-[BVRScoreManager mainData].scoreCountRed+[BVRScoreManager mainData].scoreCountBlue, SCREEN_WIDTH, SCREEN_HEIGHT/2+([BVRScoreManager mainData].scoreCountRed-[BVRScoreManager mainData].scoreCountBlue));
 
    [self declareWinner];
}

-(void)declareWinner
{
    if(([BVRScoreManager mainData].scoreCountBlue - [BVRScoreManager mainData].scoreCountRed) > 5)
    {
        NSLog(@"Blue wins");

        blueWins = [[UILabel alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT/2-25, SCREEN_WIDTH, 50)];
        blueWins.backgroundColor = [UIColor lightGrayColor];
        blueWins.textColor = [UIColor blueColor];
        blueWins.font = [UIFont fontWithName:@"Helvetica" size:35];
        blueWins.textAlignment = NSTextAlignmentCenter;
        blueWins.text = @"Blue Wins";  // how can i add score to this and have it read from BVR

        // FADE IN ANIMATION
        [UIView animateWithDuration:0.75 delay:0 options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             blueWins.alpha = 0;
                             [UIView animateWithDuration:0.75 delay:0 options:UIViewAnimationOptionCurveEaseIn
                                              animations:^{ blueWins.alpha = 1;}
                                              completion:nil];
                         } completion:nil];
        
        // SHAKE ANIMATION
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
        animation.keyPath = @"position.x";
        animation.values = @[ @0, @10, @-10, @10, @0 ];
        animation.keyTimes = @[ @0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1 ];
        animation.duration = 0.4;
        animation.additive = YES;
        [blueWins.layer addAnimation:animation forKey:@"shake"];
        
        [self.view addSubview:blueWins];

      //  [self gameDone];
    }
    
    if(([BVRScoreManager mainData].scoreCountRed - [BVRScoreManager mainData].scoreCountBlue) > 5)
    {
        NSLog(@"Red wins");
        
        redWins = [[UILabel alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT/2-25, SCREEN_WIDTH, 50)];
        redWins.backgroundColor = [UIColor lightGrayColor];
        redWins.textColor = [UIColor redColor];
        redWins.font = [UIFont fontWithName:@"Helvetica" size:35];
        redWins.textAlignment = NSTextAlignmentCenter;
        redWins.text = @"Red Wins";  // how can i add score to this and have it read from BVR
        
        // FADE IN ANIMATION
        [UIView animateWithDuration:0.75 delay:0 options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             redWins.alpha = 0;
                             [UIView animateWithDuration:0.75 delay:0 options:UIViewAnimationOptionCurveEaseIn
                                              animations:^{ redWins.alpha = 1;}
                                              completion:nil];
                         } completion:nil];
        
        // SHAKE ANIMATION
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
        animation.keyPath = @"position.x";
        animation.values = @[ @0, @10, @-10, @10, @0 ];
        animation.keyTimes = @[ @0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1 ];
        animation.duration = 0.4;
        animation.additive = YES;
        [redWins.layer addAnimation:animation forKey:@"shake"];
        
        [self.view addSubview:redWins];
        
      //  [self gameDone];
    }
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(BOOL)prefersStatusBarHidden { return YES;}



@end
