//
//  STSScreenTwoVC.m
//  STATUS
//
//  Created by Ali Houshmand on 5/19/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "STSScreenTwoVC.h"
#import "STSScreenThreeVC.h"
#import "STSScreenOneVC.h"
#import "STSSingleton.h"


@interface STSScreenTwoVC ()

@end

@implementation STSScreenTwoVC
{
    UIButton * secondCheck;
    UIButton * secondCheckBack;

    
    
    UIButton * color;
    
    NSMutableArray * smilyObjects;
   
    NSArray * redSmiles;
    NSArray * yellowSmiles;
    
    UIImageView * squaresFrame;
    
    UIView * frame;

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
     
        smilyObjects = [@[]mutableCopy];  // this is an array of UIButtons with images from colors
      
        redSmiles = @[@"angry_1",@"angry_2",@"angry_3",@"angry_4",@"angry_5",@"angry_6",@"angry_7",@"angry_8",@"angry_9"];
        
        yellowSmiles = @[@"smilies_1",@"smilies_2",@"smilies_3",@"smilies_4",@"smilies_5",@"smilies_6",@"smilies_7",@"smilies_8",@"smilies_9"];
        
        
        squaresFrame = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"squares.png"]];
        squaresFrame.frame = CGRectMake(-8, -8, 64, 64);
 
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    secondCheck = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH/2)+40, SCREEN_HEIGHT-(80), 32, 40)];
    [secondCheck setImage:[UIImage imageNamed:@"arrow.png"] forState:UIControlStateNormal];
    [secondCheck addTarget:self action:@selector(goToScreenThree) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:secondCheck];
    
    secondCheckBack = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH/2)-64, SCREEN_HEIGHT-(80), 32, 40)];
    [secondCheckBack setImage:[UIImage imageNamed:@"arrow.png"] forState:UIControlStateNormal];
    [secondCheckBack addTarget:self action:@selector(goToScreenOne) forControlEvents:UIControlEventTouchUpInside];
    secondCheckBack.transform = CGAffineTransformMakeScale(-1.0, 1.0);
    [self.view addSubview:secondCheckBack];
    [self.navigationController setNavigationBarHidden:YES];
    
    
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
            
            //// if wanted to use singleton, would replace IF conditions with:
            //// ([STSSingleton data].color == 0], etc.
            
            if(self.colorTagScreenOne == 0)
            {
            [color setImage:[UIImage imageNamed:yellowSmiles[r*3+c]] forState:UIControlStateNormal];
            }
            
            if(self.colorTagScreenOne == 1)
            {
            [color setImage:[UIImage imageNamed:redSmiles[r*3+c]] forState:UIControlStateNormal];
            }
                
            color.tag = r*3+c;
            
            [color addTarget:self action:@selector(showSquare:) forControlEvents:UIControlEventTouchUpInside];
            
            [frame insertSubview:color atIndex:0];
            
            [smilyObjects addObject:color];
            
             
    //        NSLog(@"%ld",(long)color.tag);
    
        }
  
}
    
}


-(void)goToScreenOne
{
    
    [self.navigationController popViewControllerAnimated:NO];

    
}

-(void)showSquare:(UIButton *)sender
{
    
     
    [sender insertSubview:squaresFrame atIndex:0];
    
    self.colorTagScreenTwo = sender.tag;
    
    //// if wanted to use singleton, would replace above with:
    [STSSingleton data].smiley = sender.tag;
    
    
    
}




-(void)goToScreenThree
{
    
    STSScreenThreeVC * screenThreeVC = [[STSScreenThreeVC alloc] initWithNibName:nil bundle:nil];
    
    screenThreeVC.colorTagScreenOne = self.colorTagScreenOne;
    screenThreeVC.colorTagScreenTwo = self.colorTagScreenTwo;
    
    //// if wanted to use singleton, i would not need above
    
    [self.navigationController pushViewController:screenThreeVC animated:NO];
        
    
}


        


- (void)viewWillAppear:(BOOL)animated
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
    
