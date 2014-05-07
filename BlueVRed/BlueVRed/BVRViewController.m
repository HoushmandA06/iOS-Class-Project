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
    UIViewController * blueVC;
    UIViewController * redVC;

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
 
        blueVC = [[BVRBlueVC alloc] initWithNibName:nil bundle:nil];
        [self.view addSubview:blueVC.view];
        
        redVC = [[BVRRedVC alloc] initWithNibName:nil bundle:nil];
        [self.view addSubview:redVC.view];
    
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//-(void)totalScore
//{
//    NSInteger scoreTotal = [BVRScoreManager mainData].scoreCountBlue + [BVRScoreManager mainData].scoreCountRed;
//    [BVRScoreManager mainData].scoreTotal = scoreTotal;
//    NSLog(@"%d",scoreTotal);
//    
//}



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
