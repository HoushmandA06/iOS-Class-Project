//
//  SCGStageVC.m
//  Squares
//
//  Created by Ali Houshmand on 4/11/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "SCGStageVC.h"

#import "SCGCircle.h"

#import "SCGSquare.h"


@interface SCGStageVC ()

@end

@implementation SCGStageVC
{
    int gameSize;
}



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
    
    gameSize = 4;
    
    float circleWidth =SCREEN_WIDTH/gameSize; //width of each square, 4 on a screen
    
    for (float i = 0.0; i < gameSize * gameSize; i++)
    
    {
        NSLog(@"i = %f",i);
        
        float decimal = floor((i/gameSize)*100)/100.0;
        
        int row = floor(decimal);
        
        int col = ceil((decimal - floorf(decimal)) * gameSize);
        
        NSLog(@"i / gameSize = %f",i /gameSize);
        // NSLog(@"i : %d --- row : %d --- col : %d", (int)i, row, col);
    
        float circleX = circleWidth * col;
        float circleY = (circleWidth * row) + ((SCREEN_HEIGHT - SCREEN_WIDTH)/2);
        
        SCGCircle * circle = [[SCGCircle alloc] initWithFrame:CGRectMake(circleX, circleY, circleWidth, circleWidth)];
        
        [self.view addSubview:circle];
        
    }
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)prefersStatusBarHidden { return YES; }

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
