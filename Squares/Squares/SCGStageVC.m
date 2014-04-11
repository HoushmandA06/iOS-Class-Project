//
//  SCGStageVC.m
//  Squares
//
//  Created by Ali Houshmand on 4/11/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "SCGStageVC.h"

#import "SCGSquare.h"

@implementation SCGStageVC
{
    int gameSize;
    
    NSArray * playerColors;
    
    int playerTurn;
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        playerColors = @[BLUE_COLOR, ORANGE_COLOR];
        
        playerTurn = 0;
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
        NSLog(@"i : %d --- row : %d --- col : %d", (int)i, row, col);
    
        float circleX = circleWidth * col;
        float circleY = (circleWidth * row) + ((SCREEN_HEIGHT - SCREEN_WIDTH)/2);
        
        SCGCircle * circle = [[SCGCircle alloc] initWithFrame:CGRectMake(circleX, circleY, circleWidth, circleWidth)];
        
        circle.position = (CGPoint){row,col};
        
        circle.delegate = self; //now object can talk to parent class (i.e. child SCGCircle to parent SCGStageVC)
        
        [self.view addSubview:circle];
        
    }
    
}




-(UIColor *)circleTappedWithPosition:(CGPoint)position
{
    UIColor * currentColor = playerColors[playerTurn];
    
    playerTurn = (playerTurn) ? 0 : 1;
    
    return currentColor;

}

-(void)checkForSquareAroundPosition:(CGPoint)position
{
    BOOL above = (position.y > 0);
    BOOL below = (position.y < gameSize - 1);
    BOOL left = (position.x > 0);
    BOOL right = (position.x < gameSize -1);
    
    if(above && left)
    {
    //check top left quadrant
    }
    if(above && right)
    {
        //check top right quadrant
    }
    if(below && left)
    {
        //check bottom left quadrant
    }
    if(below && right)
    {
        //check bottom right quadrant
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
