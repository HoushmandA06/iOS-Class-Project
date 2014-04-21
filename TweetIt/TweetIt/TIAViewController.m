//
//  TIAViewController.m
//  TweetIt
//
//  Created by Ali Houshmand on 4/21/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "TIAViewController.h"

@interface TIAViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel; //IBOutlet signifies connection with storyboard

@property (weak, nonatomic) IBOutlet UILabel *tweetLabel;


@end

@implementation TIAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.nameLabel.text = self.tweet[@"name"];
    self.tweetLabel.text = self.tweet[@"text"];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
