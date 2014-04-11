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
    
    NSMutableDictionary * tappedDots;
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        playerColors = @[BLUE_COLOR, ORANGE_COLOR];
        
        playerTurn = 0;
        
        tappedDots = [@{} mutableCopy];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    gameSize = 4;
    
    //width of each square, 4 on a screen
    
    float circleWidth = SCREEN_WIDTH / gameSize;
    float squareWidth = circleWidth / 2;
    
    // create square
    for (int sRow = 0; sRow < gameSize - 1; sRow++)
    {
        for(int sCol = 0; sCol < gameSize - 1; sCol++)
    {
        float squareX = ((circleWidth - squareWidth) * 1.5) + (circleWidth * sCol);
        float squareY = ((circleWidth - squareWidth) * 1.5) + (circleWidth * sRow) + ((SCREEN_HEIGHT - SCREEN_WIDTH ) / 2);
        
        SCGSquare * square = [[SCGSquare alloc] initWithFrame:CGRectMake(squareX, squareY, squareWidth, squareWidth)];
        square.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:square];
        
    }
     
    }
    
    // create dots
    for (int row = 0; row < gameSize; row++)
    {
        for (int col = 0; col < gameSize; col++)
        {
            float circleX = circleWidth * col;
            float circleY = (circleWidth * row) + ((SCREEN_HEIGHT - SCREEN_WIDTH)/2);
            
            SCGCircle * circle = [[SCGCircle alloc] initWithFrame:CGRectMake(circleX, circleY, circleWidth, circleWidth)];
            
            circle.position = (CGPoint){col,row};
            
            circle.delegate = self; //now object can talk to parent class (i.e. child SCGCircle to parent SCGStageVC)
            
            NSString * key = [NSString stringWithFormat:@"c%dr%d", col, row]; // 0,1 = c0r1
            
            tappedDots[key] = @2;
            
            [self.view addSubview:circle];
        }
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
//    tappedDots = @{
//                   @"r0c0":@0,
//                   @"r0c1":@1,
//                   @"r0c2":@2
//                   };
    
    
    // x = column, y = row
    
    int pX = position.x;
    int pY = position.y;
    
    BOOL above = (pY > 0);
    BOOL below = (pY < gameSize - 1);
    BOOL left = (pX > 0);
    BOOL right = (pX < gameSize -1);
    
    if(above && left)
    {
        //check top left quadrant
        // position 1,1
        // 0,0 1,0 0,1 1,1
        
        for (UIColor * color in playerColors)
        {
            int player = [playerColors indexOfObject:color];
            
            // -1,-1 0,-1 -1,0 0,0
            
            NSString * topLeftDot = [NSString stringWithFormat:@"c@dr@d" , pX-1,pY-1];
            NSString * topRightDot = [NSString stringWithFormat:@"c@dr@d" , pX,pY-1];
            NSString * bottomLeftDot = [NSString stringWithFormat:@"c@dr@d" , pX-1,pY];
            NSString * bottomRightDot = [NSString stringWithFormat:@"c@dr@d" , pX,pY];
            
            // checks if top left and top right are the same
            BOOL topDotsSame = ([tappedDots[topLeftDot] isEqualToValue:tappedDots[topRightDot]]);
            // checks if bottom left and bottom right are the same
            BOOL bottomDotsSame = ([tappedDots[bottomLeftDot] isEqualToValue:tappedDots[bottomRightDot]]);
            // checks if top left and bottom left are the same
            BOOL leftDotsSame = ([tappedDots[topLeftDot] isEqualToValue:tappedDots[bottomLeftDot]]);
            
            //if top, left, & bottom dots the same as player... then they own square
            if(topDotsSame && bottomDotsSame && leftDotsSame && [topLeftDot isEqual:@(player)])
            {
                /// player owns square
                
            }
            
        }
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
