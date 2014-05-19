//
//  STSScreenOneVC.m
//  STATUS
//
//  Created by Ali Houshmand on 5/19/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//




#import "STSScreenOneVC.h"
#import "STSScreenTwoVC.h"

@interface STSScreenOneVC ()

@end

@implementation STSScreenOneVC
{

    UIButton * firstCheck;

    UIButton * color;
    
    NSMutableArray * colorObjects;
    
    NSArray * colors;
    
    UIImageView * squaresFrame;
    
    UIView * frame;

    
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
      
        
 
        colorObjects = [@[]mutableCopy];  // this is an array of UIButtons with images from colors
        
        colors = @[@"colors_1",@"colors_2",@"colors_3",@"colors_4",@"colors_5",@"colors_6",@"colors_6",@"colors_7",@"colors_8",@"colors_9"];
        
    
        firstCheck = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH/2)-16, SCREEN_HEIGHT-(80), 32, 40)];
        [firstCheck setImage:[UIImage imageNamed:@"arrow.png"] forState:UIControlStateNormal];
        [firstCheck addTarget:self action:@selector(goToScreenTwo) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:firstCheck];
        
        squaresFrame = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"squares.png"]];
        squaresFrame.frame = CGRectMake(-8, -8, 64, 64);
     
        
    }
    return self;
}


-(void)goToScreenTwo
{
    
    STSScreenTwoVC * screenTwoVC = [[STSScreenTwoVC alloc] initWithNibName:nil bundle:nil];
    
    screenTwoVC.colorTag = self.colorTag;
    
    [self.navigationController pushViewController:screenTwoVC animated:NO];

}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    frame = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-(72+176),SCREEN_HEIGHT-(192+176),176,176)];
    frame.backgroundColor = [UIColor clearColor];
    [self.view addSubview:frame];
    
    int colorCols = 3; // setting number of color frames
    int colorRows = 3;
    
    float colorWidth = 48;
    float colorHeight = 48;
    
    for (int c = 0; c < colorCols; c++)
    {
        for (int r = 0; r < colorRows; r++)
        {
        float colorX = ((colorWidth + 10) * c) + 8;
        float colorY = ((colorHeight + 10) * r) + 8;
            
        color = [[UIButton alloc] initWithFrame:CGRectMake(colorX, colorY, colorWidth, colorHeight)];
    
        [color setImage:[UIImage imageNamed:colors[r*3+c]] forState:UIControlStateNormal];
   
        color.tag = r*3+c;
    
         NSLog(@"colorTag: %f",self.colorTag);
            
        [color addTarget:self action:@selector(showSquare:) forControlEvents:UIControlEventTouchUpInside];
         
        [frame insertSubview:color atIndex:0];
        
        [colorObjects addObject:color];
            
        //[frame addSubview:color];
    
        NSLog(@"%ld",(long)color.tag);
         }
    }
 }

-(void)showSquare:(UIButton *)sender
{
 
    self.colorTag = sender.tag;
    
    [sender insertSubview:squaresFrame atIndex:0];
        
    
//    CGPoint location = CGPointMake(sender.frame.origin.x, sender.frame.origin.y);
//    squaresFrame.frame = CGRectMake(location.x-8, location.y-8, 64, 64);
//    [frame insertSubview:squaresFrame atIndex:0];

}


- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
}

-(void)viewDidLayoutSubviews
{
    
//    self.navigationController.navigationBarHidden = YES;
    
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
