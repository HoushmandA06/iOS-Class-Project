//
//  AHFViewController.m
//  FunApp
//
//  Created by Ali Houshmand on 3/31/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "AHFViewController.h"

@interface AHFViewController ()

@end

@implementation AHFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(id)sender {
    self.MyLabel.text = @"Ali Houshmand";
    
    NSLog(@"button selected");
    
    
}
@end
