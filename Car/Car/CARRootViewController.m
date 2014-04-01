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
    wheel1.frame = CGRectMake(20, 40, 40, 40);
    wheel1.tirePressure = 20;
    [self.view addSubview:wheel1];
    
    CARWheel *wheel2 = [[CARWheel alloc] init];
    wheel2.frame = CGRectMake(80, 40, 40, 40);
    wheel2.tirePressure = 24;
    [self.view addSubview:wheel2];
    
    CARWheel *wheel3 = [[CARWheel alloc] init];
    wheel3.frame = CGRectMake(140, 40, 40, 40);
    [self.view addSubview:wheel3];
    
    CARWheel *wheel4 = [[CARWheel alloc] init];
    wheel4.frame = CGRectMake(200, 40, 40, 40);
    [self.view addSubview:wheel4];
    
    
    CARWindow *window1 = [[CARWindow alloc] init];
    CARWindow *window2 = [[CARWindow alloc] init];
    CARWindow *window3 = [[CARWindow alloc] init];
    CARWindow *window4 = [[CARWindow alloc] init];

    CARGas *gasPedal = [[CARGas alloc] init];
    gasPedal.frame = CGRectMake(220, 360, 80, 100);
    [gasPedal setTitle:@"Go" forState:(UIControlStateNormal)];
    [gasPedal addTarget:self action:@selector(pressGasPedal) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:gasPedal];
    
    CARIgnition *startButton = [[CARIgnition alloc] init];
    startButton.frame = CGRectMake(20, 400, 50, 50);
    [startButton setTitle:@"Start" forState:(UIControlStateNormal)];
    [startButton addTarget:self action:@selector(pressstartButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startButton];
    
    CARBrake *brakePedal = [[CARBrake alloc] init];
    brakePedal.frame = CGRectMake(110, 360, 80, 100);
    [brakePedal setTitle:@"Stop" forState:(UIControlStateNormal)];
    [brakePedal addTarget:self action:@selector(pressbrakePedal) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:brakePedal];
    
    CARWindow *windshield = [[CARWindow alloc] init];
    windshield.frame = CGRectMake(20, 160, 280, 200);
    windshield.backgroundColor = [UIColor blackColor];
    windshield.alpha = 0.2;
    [self.view addSubview:windshield];
    
    
    
    // Do any additional setup after loading the view.
}
- (void)pressGasPedal
{
    NSLog(@"pressed gas");
    
}

- (void)pressstartButton
{
    NSLog(@"pressed start");
}

-(void)pressbrakePedal
{
    NSLog(@"pressed brake");
    
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
