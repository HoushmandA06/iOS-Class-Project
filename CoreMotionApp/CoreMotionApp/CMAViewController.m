//
//  CMAViewController.m
//  CoreMotionApp
//
//  Created by Ali Houshmand on 5/22/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "CMAViewController.h"
#import <CoreMotion/CoreMotion.h>


@interface CMAViewController ()

@end

@implementation CMAViewController
{
    CMMotionManager * mManager;
    
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        mManager = [[CMMotionManager alloc] init];
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    float wh = (SCREEN_WIDTH - 30) / 2.0;
    
    UIView * topView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, wh, wh)];
    topView.backgroundColor = [UIColor colorWithWhite: 0.90 alpha: 1.0];
    [self.view addSubview:topView];
    
    UIView * sideView = [[UIView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH+10)/2.0, 10, wh, wh)];
    sideView.backgroundColor = [UIColor colorWithWhite: 0.90 alpha: 1.0];
    [self.view addSubview:sideView];
    
    
    UIView * topDot = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMidX(topView.frame)-10, CGRectGetMidY(topView.frame)-10, 20, 20)];
    topDot.layer.cornerRadius = 10;
    topDot.backgroundColor = [UIColor redColor];
    [self.view addSubview:topDot];
    
    
    UIView * sideDot = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMidX(sideView.frame)-10, CGRectGetMidY(sideView.frame)-10, 20, 20)];
    sideDot.layer.cornerRadius = 10;
    sideDot.backgroundColor = [UIColor redColor];
    [self.view addSubview:sideDot];
    
    
    [mManager startAccelerometerUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMAccelerometerData *acceleratorData, NSError *error) {
        
////////// topDot
        float tx = acceleratorData.acceleration.x;
        float ty = -acceleratorData.acceleration.y;
        
        float mintx = CGRectGetMinX(topView.frame);
        float maxtx = CGRectGetMaxX(topView.frame);
        
        float minty = CGRectGetMinY(topView.frame);
        float maxty = CGRectGetMaxY(topView.frame);
        
        //boundaries LEFT / RIGHT
        if(tx + topDot.frame.origin.x < mintx) tx = 0;
        if(tx + topDot.frame.origin.x > maxtx - 20) tx = 0;
        
        //boundaries UP / DOWN
        if(ty + topDot.frame.origin.y < minty) ty = 0;
        if(ty + topDot.frame.origin.y > maxty - 20) ty = 0;
        
        //motion
        topDot.frame = CGRectOffset(topDot.frame, tx,ty);
        
        
////////// sideDot
        float sx = acceleratorData.acceleration.x;
        float sz = -acceleratorData.acceleration.z-1;
    
        float minsx = CGRectGetMinX(sideView.frame);
        float maxsx = CGRectGetMaxX(sideView.frame);
        
        float minsz = CGRectGetMinY(sideView.frame);
        float maxsz = CGRectGetMaxY(sideView.frame);
        
        //boundaries LEFT / RIGHT
        if(sx + sideDot.frame.origin.x < minsx) sx = 0;
        if(sx + sideDot.frame.origin.x > maxsx - 20) sx = 0;
        
        //boundaries UP / DOWN
        if(sz + sideDot.frame.origin.y < minsz) sz = 0;
        if(sz + sideDot.frame.origin.y > maxsz - 20) sz = 0;
        
        //motion
        sideDot.frame = CGRectOffset(sideDot.frame, sx, sz);
        
        
    }];
    



}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
