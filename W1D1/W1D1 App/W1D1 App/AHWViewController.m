//
//  AHWViewController.m
//  W1D1 App
//
//  Created by Ali Houshmand on 3/31/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "AHWViewController.h"

@interface AHWViewController ()

@end

@implementation AHWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)StringChanger:(id)sender {
    self.Label1.text = @"New String";
    
}

- (IBAction)ChangeLabelUI:(id)sender {
    self.Label2.text = self.myTextField.text;
}

- (IBAction)ChgTxtColor:(id)sender {
    self.Label3.textColor = [UIColor greenColor];
   
}

- (IBAction)ChangeBackground:(id)sender {
    self.view.backgroundColor = [UIColor yellowColor];
    
}


@end
