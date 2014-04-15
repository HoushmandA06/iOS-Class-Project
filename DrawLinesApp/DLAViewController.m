//
//  DLAViewController.m
//  DrawLinesApp
//
//  Created by Ali Houshmand on 4/15/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "DLAViewController.h"
#import "DLAStageLines.h"
#import "DLAStageScribble.h"

@interface DLAViewController ()

@end

@implementation DLAViewController
{
    DLAStageScribble * scribbleView;
    
    UIView * colorsDrawer;

}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

        // self.view = [[DLAStageLines alloc] initWithFrame:self.view.frame];
        // self.view = [[DLAStageScribble alloc] initWithFrame:self.view.frame];
    
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    scribbleView = [[DLAStageScribble alloc] initWithFrame:self.view.frame];
    // scribbleView.lineColor = [UIColor blueColor];
    [self.view addSubview:scribbleView];
    
    
    //widthSlider button
    UISlider * widthSlider = [[UISlider alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT - 43,280,23)];
    widthSlider.backgroundColor = [UIColor colorWithRed:0.561f green:0.627f blue:0.733f alpha:1.0f];
    widthSlider.layer.cornerRadius = 6;
    widthSlider.minimumValue = 2.0;
    widthSlider.maximumValue = 20.0;
    [widthSlider addTarget:self action:@selector(changeSize:) forControlEvents:UIControlEventAllEvents];
    //CGAffineTransform trans = CGAffineTransformMakeRotation(M_PI_2);
    //widthSlider.transform = trans;
    [self.view addSubview:widthSlider];
    
    //color frame
    colorsDrawer = [[UIView alloc] initWithFrame:CGRectMake(0,0,SCREEN_WIDTH, 40)];
    
    //colors defined
    NSArray * colors = @[
                         [UIColor colorWithRed:0.251f green:0.251f blue:0.251f alpha:1.0f],
                         [UIColor colorWithRed:0.008f green:0.353f blue:0.431f alpha:1.0f],
                         [UIColor colorWithRed:0.016f green:0.604f blue:0.671f alpha:1.0f],
                         [UIColor colorWithRed:1.000f green:0.988f blue:0.910f alpha:1.0f],
                         [UIColor colorWithRed:1.000f green:0.298f blue:0.153f alpha:1.0f]
     ];
    
    
    float buttonWidth = SCREEN_WIDTH/[colors count]; //use to set colorButton width
    
    //colorButton creator
    for (UIColor * color in colors)
    {
        int index = [colors indexOfObject:color];
        UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(buttonWidth * index, 0, buttonWidth, 40)];
        button.backgroundColor = color;
        [button addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventTouchUpInside];
        [colorsDrawer addSubview:button];
    }
    [self.view addSubview:colorsDrawer];

    

    // going to try to make a segmented control panel for color change (red, white, blue)
//    UISegmentedControl *gameSizeChoices = [[UISegmentedControl alloc] initWithItems:gameSizes];
//    gameSizeChoices.frame = CGRectMake(60, SCREEN_HEIGHT - 50, 200, 30);
//    [gameSizeChoices addTarget:self action:@selector(resetGameBoard:)
//              forControlEvents:UIControlEventValueChanged];
//    [self.view addSubview:gameSizeChoices];
    
}

-(void)changeSize:(UISlider *)sender
{
    scribbleView.lineWidth = sender.value;
}

-(void)changeColor:(UIButton *)sender
{
    scribbleView.lineColor = sender.backgroundColor;
}


-(BOOL)prefersStatusBarHidden { return YES; }


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
