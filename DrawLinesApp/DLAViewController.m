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

}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

        // self.view = [[DLAStageLines alloc] initWithFrame:self.view.frame];
        
        self.view = [[DLAStageScribble alloc] initWithFrame:self.view.frame];
    
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];


    
    
    // going to try to make a segmented control panel for color change (red, white, blue)
//    UISegmentedControl *gameSizeChoices = [[UISegmentedControl alloc] initWithItems:gameSizes];
//    gameSizeChoices.frame = CGRectMake(60, SCREEN_HEIGHT - 50, 200, 30);
//    [gameSizeChoices addTarget:self
//                        action:@selector(resetGameBoard:)
//              forControlEvents:UIControlEventValueChanged];
//    [self.view addSubview:gameSizeChoices];
    
    // Do any additional setup after loading the view.
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
