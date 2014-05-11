//
//  BVRThirdVC.m
//  BlueVRed
//
//  Created by Ali Houshmand on 5/7/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "BVRRedVC.h"
#import "BVRScoreManager.h"


@interface BVRRedVC ()

@end

@implementation BVRRedVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
 
        self.view.frame = CGRectMake(0, SCREEN_HEIGHT/2,SCREEN_WIDTH, SCREEN_HEIGHT/2);
        self.view.backgroundColor = [UIColor redColor];
        
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

-(void)tapScreen:(UITapGestureRecognizer *)redScored
{    NSLog(@"Tapped Red");

    [BVRScoreManager mainData].scoreCountRed += 1;
    [self.delegate setRedScore:[BVRScoreManager mainData].scoreCountRed];
    NSLog(@"Red Score: %d",[BVRScoreManager mainData].scoreCountRed);
    
//    self.view.frame = CGRectMake(0, SCREEN_HEIGHT/2-[BVRScoreManager mainData].scoreCountRed, SCREEN_WIDTH, SCREEN_HEIGHT/2+[BVRScoreManager mainData].scoreCountRed);
    
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
