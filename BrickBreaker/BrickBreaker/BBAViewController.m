//
//  BBAViewController.m
//  BrickBreaker
//
//  Created by Ali Houshmand on 4/17/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "BBAViewController.h"
#import "BBALevelController.h"
#import "MOVE.h"


@interface BBAViewController () <BBALevelDelegate>

@end

@implementation BBAViewController
{
    BBALevelController * level;
    UIButton * start;
    UILabel * scoreCard;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
      
        self.view.backgroundColor = [UIColor blackColor];
        
        
    
    
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    start = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH)/2 - 50,(SCREEN_HEIGHT)/2-50,100,100)];
    start.backgroundColor = [UIColor colorWithWhite:0.30 alpha:0.5];
    
    // UNDERSTAND HOW TO CHANGE BUTTON TEXT FONT, SIZE, STYLE
    
    [start setTitle:@"START" forState:UIControlStateNormal];
    start.layer.cornerRadius = 50;
    [start addTarget:self action:@selector(goLevelScreen) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:start];
    
}


-(void)goLevelScreen
{
    level = [[BBALevelController alloc] initWithNibName:nil bundle:nil];
    [self.view addSubview:level.view];
    level.delegate = self;

    level.view.frame = CGRectMake(0,40, SCREEN_WIDTH, SCREEN_HEIGHT-40);  // level frame
    [self.view addSubview:level.view];
    
    [level resetLevel];
    [start removeFromSuperview];
    [self scoreCard];
}


-(void)scoreCard
{
    scoreCard = [[UILabel alloc] initWithFrame:CGRectMake(10,10,300,40)];
    scoreCard.backgroundColor = [UIColor lightGrayColor];
    scoreCard.textColor = [UIColor orangeColor];
    [self.view addSubview:scoreCard];
    
}

//below 2 are delegate methods
-(void)addPoints:(int)points
{
    scoreCard.text = [NSString stringWithFormat:@"%d!",points];
}

-(void)gameDone
{
    [level.view removeFromSuperview];
    [self.view addSubview:start];
    [scoreCard removeFromSuperview];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}


- (BOOL)prefersStatusBarHidden {
    return YES;
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
