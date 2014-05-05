//
//  PNAViewController.m
//  PixelNoise
//
//  Created by Ali Houshmand on 5/5/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "PNAViewController.h"
#import "PNAPixelSounds.h"


@interface PNAViewController ()
{
    PNAPixelSounds * sounds;
    
    
}

@end

@implementation PNAViewController


//init, for when u are only running once and arent worried about frame being loaded

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        sounds = [[PNAPixelSounds alloc] init];
        
        
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


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"playsound");
    [sounds playSoundWithName:@"melodic5_affirm"];
    
}


@end
