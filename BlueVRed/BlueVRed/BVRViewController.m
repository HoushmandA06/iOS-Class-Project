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
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
 
        blueVC = [[BVRBlueVC alloc] initWithNibName:nil bundle:nil];
        blueVC.delegate = self;
        [self.view addSubview:blueVC.view];
        
        blueScoreCard = [[UILabel alloc] initWithFrame:CGRectMake(110, 70, 100, 100)];
        blueScoreCard.backgroundColor = [UIColor clearColor];
        blueScoreCard.textColor = [UIColor whiteColor];
        blueScoreCard.font = [UIFont fontWithName:@"Helvetica" size:70];
        blueScoreCard.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:blueScoreCard];

        redVC = [[BVRRedVC alloc] initWithNibName:nil bundle:nil];
        redVC.delegate = self;
        [self.view addSubview:redVC.view];
        
        redScoreCard = [[UILabel alloc] initWithFrame:CGRectMake(110, 310, 100, 100)];
        redScoreCard.backgroundColor = [UIColor clearColor];
        redScoreCard.textColor = [UIColor whiteColor];
        redScoreCard.font = [UIFont fontWithName:@"Helvetica" size:70];
        redScoreCard.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:redScoreCard];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

-(void)setBlueScore:(NSInteger)scoreCountBlue
{
    blueScoreCard.text = [NSString stringWithFormat:@"%d",scoreCountBlue];
}

-(void)setRedScore:(NSInteger)scoreCountRed
{
    redScoreCard.text = [NSString stringWithFormat:@"%d",scoreCountRed];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(BOOL)prefersStatusBarHidden { return YES;}


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
