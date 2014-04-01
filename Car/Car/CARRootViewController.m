//
//  CARRootViewController.m
//  Car
//
//  Created by Ali Houshmand on 4/1/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "CARRootViewController.h"
#import "CARWheel.h"
#import "CARBumper.h"
#import "CARBrake.h"
#import "CARWindow.h"
#import "CARIgnition.h"
#import "CARGas.h"

@interface CARRootViewController ()

@end

@implementation CARRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CARWheel *wheel1 = [[CARWheel alloc] init];
    CARWheel *wheel2 = [[CARWheel alloc] init];
    CARWheel *wheel3 = [[CARWheel alloc] init];
    CARWheel *wheel4 = [[CARWheel alloc] init];
  
    CARWindow *window1 = [[CARWindow alloc] init];
    CARWindow *window2 = [[CARWindow alloc] init];
    CARWindow *window3 = [[CARWindow alloc] init];
    CARWindow *window4 = [[CARWindow alloc] init];

    CARGas *gasPedal = [[CARGas alloc] init];
    
    
    
    // Do any additional setup after loading the view.
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
