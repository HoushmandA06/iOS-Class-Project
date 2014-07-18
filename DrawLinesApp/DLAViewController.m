//
//  DLAViewController.m
//  DrawLinesApp
//
//  Created by Ali Houshmand on 6/18/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "DLAViewController.h"
#import "DLAStageLines.h"


@interface DLAViewController ()

@end

@implementation DLAViewController

{
    DLAStageScribble * scribbleView;
    DLAStageLines * linesView;
    
    UIView * colorsDrawer;
    
    float lineWidth;
    UIColor * lineColor;
    
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
    
    //  scribbleView = [[DLAStageLines alloc] initWithFrame:self.view.frame];
    
    lineColor = [UIColor blueColor];
    lineWidth = 5.0;
    
    [self toggleStage];
    
    [self.view addSubview:scribbleView];
    
    //widthSlider button
    UISlider * widthSlider = [[UISlider alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT - 43,280,23)];
    widthSlider.backgroundColor = [UIColor colorWithRed:0.561f green:0.627f blue:0.733f alpha:1.0f];
    widthSlider.layer.cornerRadius = 6;
    
    widthSlider.minimumValue = 2.0;
    widthSlider.maximumValue = 80.0;
    widthSlider.value = lineWidth;
    
    [widthSlider addTarget:self action:@selector(changeSize:) forControlEvents:UIControlEventAllEvents];
    //CGAffineTransform trans = CGAffineTransformMakeRotation(M_PI_2);
    //widthSlider.transform = trans;
    
    [self.view addSubview:widthSlider];
    
    //color frame
    colorsDrawer = [[UIView alloc] initWithFrame:CGRectMake(0,0,SCREEN_WIDTH, 50)];
    [self.view addSubview:colorsDrawer];

    //colors defined
    NSArray * colors = @[[UIColor colorWithRed:0.251f green:0.251f blue:0.251f alpha:1.0f],
                         [UIColor colorWithRed:0.008f green:0.353f blue:0.431f alpha:1.0f],
                         [UIColor colorWithRed:0.016f green:0.604f blue:0.671f alpha:1.0f],
                         [UIColor colorWithRed:1.000f green:0.988f blue:0.910f alpha:1.0f],
                         [UIColor colorWithRed:1.000f green:0.298f blue:0.153f alpha:1.0f]];
    
    
    float buttonWidth = SCREEN_WIDTH/[colors count]; //use to set colorButton width
    
    //colorButton creator
    for (UIColor * color in colors)
    {
        int index = [colors indexOfObject:color];
        UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(buttonWidth * index, 0, buttonWidth, 50)];
        button.backgroundColor = color;
        [button addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventTouchUpInside];
        [colorsDrawer addSubview:button];
    }
    
    /////////////////////////////////////////////////////////////////
    
//    UIButton * toggleButton = [[UIButton alloc] initWithFrame:CGRectMake(10,110,50,50)];
//    toggleButton.backgroundColor = [UIColor orangeColor];
//    [toggleButton setImage:[UIImage imageNamed:@"Toggle"] forState:UIControlStateNormal];
//    toggleButton.layer.cornerRadius = 25;
//    [toggleButton addTarget:self action:@selector(toggleStage) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:toggleButton];
    
    
    
    
    /////////////////////////////////////////////////////////////////
    
    
    UIButton * takeScreenShot = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 180,55,50,50)];
    takeScreenShot.backgroundColor = [UIColor greenColor];
    takeScreenShot.layer.cornerRadius = 25;
    [takeScreenShot addTarget:self action:@selector(takeScreenShot) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:takeScreenShot];
    
    
    /////////////////////////////////////////////////////////////////
    
    UIButton * undoButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 120,55,50,50)];
    undoButton.backgroundColor = [UIColor lightGrayColor];
    [undoButton setImage:[UIImage imageNamed:@"arrow_undo"] forState:UIControlStateNormal];
    undoButton.layer.cornerRadius = 25;
    [undoButton addTarget:self action:@selector(undoStage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:undoButton];
    
    /////////////////////////////////////////////////////////////////
    
    UIButton * clearButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 60,55,50,50)];
    clearButton.backgroundColor = [UIColor redColor];
    [clearButton setImage:[UIImage imageNamed:@"Delete"] forState:UIControlStateNormal];
    clearButton.layer.cornerRadius = 25;
    [clearButton addTarget:self action:@selector(clearStage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:clearButton];
    
    /////////// sample toggle switch
    UISwitch * sampleSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(10, 55, 50, 50)];
    [sampleSwitch  addTarget:self action:@selector(toggleStage) forControlEvents:UIControlEventTouchUpInside];
    sampleSwitch.tintColor = [UIColor orangeColor];
    [self.view addSubview:sampleSwitch];
    
}

-(void)toggleStage
{
    
    NSMutableArray * lines = scribbleView.lines;
    
    [scribbleView removeFromSuperview];
    
    if([scribbleView isMemberOfClass:[DLAStageScribble class]])
    {
       // scribbleView = [[DLAStageLines alloc] initWithFrame:self.view.frame];
        
        scribbleView = [[DLAStageLines alloc] initWithFrame:CGRectMake(0, 120, SCREEN_WIDTH, SCREEN_HEIGHT-200)];
        scribbleView.backgroundColor = [UIColor colorWithWhite:.90 alpha:1.0];

        
    } else
    {
        // scribbleView = [[DLAStageScribble alloc] initWithFrame:self.view.frame];
        
        //// TEST CODE: want to limit drawing stage to defined box
        
        scribbleView = [[DLAStageScribble alloc] initWithFrame:CGRectMake(0, 120, SCREEN_WIDTH, SCREEN_HEIGHT-200)];
        scribbleView.backgroundColor = [UIColor colorWithWhite:.90 alpha:1.0];


        
    }
    
    scribbleView.lineWidth = lineWidth;
    scribbleView.lineColor = lineColor;
    
    if(lines != nil) scribbleView.lines = lines;
    
    [self.view insertSubview:scribbleView atIndex:0];
}

-(void)takeScreenShot
{
    NSLog(@"selected");
    
//    CGRect origFrame = scribbleView.frame;
//    CGRect frame = scribbleView.frame;
//    scribbleView.frame = frame;
//    scribbleView.bounds = frame;
    
    if([[UIScreen mainScreen] respondsToSelector:@selector(scale)])
        UIGraphicsBeginImageContextWithOptions(scribbleView.bounds.size, NO, [UIScreen mainScreen].scale);
    else
        UIGraphicsBeginImageContext(scribbleView.bounds.size);
    
    [scribbleView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    
    NSMutableDictionary * checkListScreenshot = [[NSMutableDictionary alloc] init];
    [checkListScreenshot setObject:image forKey:@"checkListScreenshot"];
//    [[MIOSingleton mainData] currentResident][@"screenShot2"] = checkListScreenshot;
    
//    scribbleView.frame = origFrame;
    
}




-(void)undoStage
{
    [scribbleView undo];
    // Do any additional setup after loading the view.
}

-(void)clearStage
{
    [scribbleView clearStage];
}


-(void)changeSize:(UISlider *)sender
{
    lineWidth = sender.value;
    scribbleView.lineWidth = sender.value;
    
    //linesView.lineWidth = sender.value;
}

-(void)changeColor:(UIButton *)sender
{
    lineColor = sender.backgroundColor;
    scribbleView.lineColor = sender.backgroundColor;
    NSLog(@"selected");
    
    //linesView.lineColor = sender.backgroundColor;
}

-(BOOL)prefersStatusBarHidden { return YES; }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
