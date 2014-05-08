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
    UILabel * livesCard;
    UIButton * reset;
    
    
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
    
    // NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    // topScore = [[userDefaults objectForKey:@"topScore"] intValue];
    //
    
    
    
    [start setTitle:@"START" forState:UIControlStateNormal];
    start.layer.cornerRadius = 50;
    [start addTarget:self action:@selector(goLevelScreen) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:start];
}


-(void)goLevelScreen
{
    level = [[BBALevelController alloc] initWithNibName:nil bundle:nil];
    level.delegate = self;

    level.view.frame = CGRectMake(0,40, SCREEN_WIDTH, SCREEN_HEIGHT-40);  // level frame
    
    [self.view addSubview:level.view];
    
    [start removeFromSuperview];
    [level resetLevel];
    [self scoreCard];
    [self livesCard];
    [self reset];
}


-(void)scoreCard
{
    scoreCard = [[UILabel alloc] initWithFrame:CGRectMake(0,0,100,40)];
    scoreCard.backgroundColor = [UIColor darkGrayColor];
    scoreCard.textColor = [UIColor orangeColor];
    [self.view addSubview:scoreCard];
}

-(void)livesCard
{

    livesCard = [[UILabel alloc] initWithFrame:CGRectMake(380, 0, 100, 40)];
    livesCard.backgroundColor = [UIColor darkGrayColor];
    [self.view addSubview:livesCard];

}

-(void)reset
{
    reset = [[UIButton alloc] initWithFrame:CGRectMake(120,0,40,40)];
    reset.backgroundColor = [UIColor clearColor];
  // [reset setTitle:@"reset" forState:UIControlStateNormal];
    reset.layer.cornerRadius = 20;
    [reset setImage:[UIImage imageNamed:@"home.png"] forState:UIControlStateNormal];
    [reset addTarget:self action:@selector(gameDone) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:reset];
    
}

//-(void)updatePoints:(int)points
//{
//    header.currentScore = points;
//    if (header.currentScore > topScore)
//    {
//        topScore = header.currentSCore;
//        newHighScore = YES;

        // update my default value

//        NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
//        [userDefaults setObject:@(topScore) forKey:@"topScore"];   //@(topscore) turns int into nsobject
//        [userDefaults synchronize];
//        
//    }
//}

//-(int)loseLife
//if(lives > 0) lives --;
//header.livesLeft = lives;
//if(lives == 0) [self gameLost];
//return lives;







//below are delegate methods

-(void)addPoints:(int)points
{
    scoreCard.text = [NSString stringWithFormat:@"  Score %d",points];
}

-(void)addLives:(int)livesLost
{
 // need to fix this
    livesCard.text = [NSString stringWithFormat:@" Lives %d", livesLost];
    
}


-(void)gameDone
{
    
    [level.view removeFromSuperview];
    [self.view addSubview:start];
    [scoreCard removeFromSuperview];
    [livesCard removeFromSuperview];
    [reset removeFromSuperview];
 

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
