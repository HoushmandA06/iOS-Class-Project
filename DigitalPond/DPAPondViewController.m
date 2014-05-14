//
//  DPAPondViewController.m
//  DigitalPond
//
//  Created by Ali Houshmand on 5/14/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "DPAPondViewController.h"
#import "DPARipple.h"

@interface DPAPondViewController ()

@end

@implementation DPAPondViewController

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
    
    NSLog(@"Hello");

//    
//    DPARipple * ripple = [[DPARipple alloc] initWithFrame:CGRectMake(100, 100, 0, 0)];
//    
//    ripple.rippleCount = 3;
//    ripple.rippleLifeTime = 2;
//    
//    [self.view addSubview:ripple];
    
    
    
    // Do any additional setup after loading the view from its nib.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch * touch in touches) {
        
        CGPoint location = [touch locationInView:self.view];
        
        
        DPARipple * ripple = [[DPARipple alloc] initWithFrame:CGRectMake(location.x, location.y, 0, 0)];
        
        ripple.rippleCount = 3;
        ripple.rippleLifeTime = 2;
        
        [self.view addSubview:ripple];
        
    }
    
}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    [self touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event];
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
