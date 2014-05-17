//
//  SABViewController.m
//  Stuffed Animal Battle
//
//  Created by Ali Houshmand on 5/15/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "SABViewController.h"
#import "SABGameScene.h"
#import <SpriteKit/SpriteKit.h>


@interface SABViewController ()

@end

@implementation SABViewController

- (id)init
{
    self = [super init];
    if (self) {
 
        SKView  * skView = [[SKView alloc] initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        
        [self.view addSubview:skView];
        
        SABGameScene * skScene = [[SABGameScene alloc] initWithSize:CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT)];
        
        [skView presentScene:skScene];
        
        skView.showsFPS = YES;
        skView.showsNodeCount = YES;
        
        UIButton * buttonA = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 120, SCREEN_HEIGHT - 120, 40, 40)];
        
        [buttonA addTarget:skScene action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [buttonA setTitle:@"A" forState:UIControlStateNormal];
        buttonA.backgroundColor = [UIColor lightGrayColor];
        buttonA.layer.cornerRadius = 20;
        
        [self.view addSubview:buttonA];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)prefersStatusBarHidden
{
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
