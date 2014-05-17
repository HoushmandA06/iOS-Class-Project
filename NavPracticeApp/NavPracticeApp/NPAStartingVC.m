//
//  NPAStartingViewController.m
//  NavPracticeApp
//
//  Created by Ali Houshmand on 5/17/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "NPAStartingVC.h"
#import "NPATableVC.h"
#import "NPANavVC.h"

@interface NPAStartingVC ()

@end

@implementation NPAStartingVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

 
    UIButton * goToTVC = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-210, SCREEN_HEIGHT-290, 100, 100)];
    goToTVC.backgroundColor = BLUE_COLOR;
    [goToTVC setTitle:@"To TVC" forState:UIControlStateNormal];
    [goToTVC addTarget:self action:@selector(goTVC) forControlEvents:UIControlEventTouchUpInside];
    goToTVC.layer.cornerRadius = 50;
    goToTVC.layer.borderColor = [UIColor blueColor].CGColor;
    goToTVC.layer.borderWidth = 3;
    [self.view addSubview:goToTVC];
    
    }
    return self;
}


-(void)goTVC
{
    NSLog(@"selected");
    
    NPATableVC * tableVC = [[NPATableVC alloc] initWithStyle:UITableViewStylePlain];
    
    NPANavVC * newNavVC = [[NPANavVC alloc] initWithRootViewController:tableVC];
    
    
    [self.navigationController presentViewController:newNavVC animated:YES completion:^{
    }];
    
    
    //self.navigationController.viewControllers = newNavVC;
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
 
}

-(void)viewDidLayoutSubviews
{
     self.navigationController.navigationBarHidden = YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
