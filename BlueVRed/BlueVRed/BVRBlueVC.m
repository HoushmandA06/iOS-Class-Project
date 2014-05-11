//
//  BVRSecondVC.m
//  BlueVRed
//
//  Created by Ali Houshmand on 5/7/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "BVRBlueVC.h"
#import "BVRScoreManager.h"


@interface BVRBlueVC ()

@end

@implementation BVRBlueVC
{
//    UILabel * blueScoreCard;


}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        self.view.frame = CGRectMake(0, 0,SCREEN_WIDTH, SCREEN_HEIGHT/2);
        self.view.backgroundColor = [UIColor blueColor];
        
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapScreen:)];
        [self.view addGestureRecognizer:tap];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

-(void)tapScreen:(UITapGestureRecognizer *)blueScored
{
    NSLog(@"Tapped Blue");
    [BVRScoreManager mainData].scoreCountBlue += 1;
 
    [self.delegate setBlueScore:[BVRScoreManager mainData].scoreCountBlue];
    NSLog(@"Blue Score : %d",[BVRScoreManager mainData].scoreCountBlue);

    NSInteger scoreTotal = [BVRScoreManager mainData].scoreCountBlue + [BVRScoreManager mainData].scoreCountRed;
    [BVRScoreManager mainData].scoreTotal = scoreTotal;
    
    
    NSLog(@"totalscore : %d",scoreTotal);
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
