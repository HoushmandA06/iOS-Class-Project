//
//  LPAViewController.m
//  LilPlayA
//
//  Created by Ali Houshmand on 5/13/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "LPAViewController.h"


@interface LPAViewController ()
{

    AVAudioPlayer * player;
    
    UIButton * seekButton;
    UIButton * playButton;
    UIButton * stopButton;
    
    int x;
    
}

@end

@implementation LPAViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
       
        self.view.backgroundColor = [UIColor lightGrayColor];
        
        x=0;
        
        
        stopButton = [[UIButton alloc] initWithFrame:CGRectMake(250,220,50,50)];
       // [stopButton setTitle:@"Stop" forState:UIControlStateNormal];
        [stopButton setImage:[UIImage imageNamed:@"stop"] forState:UIControlStateNormal];
        stopButton.backgroundColor = [UIColor clearColor];
      
        [self.view addSubview:stopButton];
        
        playButton = [[UIButton alloc] initWithFrame:CGRectMake(25,220,50,50)];
        [playButton setImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
        [playButton setImage:[UIImage imageNamed:@"pause"] forState:UIControlStateSelected];
        playButton.backgroundColor = [UIColor clearColor];
       
        [self.view addSubview:playButton];
        
        UIView * progressBar = [[UIView alloc] initWithFrame:CGRectMake(85, 250, 150, 4)];
        progressBar.layer.cornerRadius = 2;
        progressBar.backgroundColor = [UIColor darkGrayColor];
        [self.view addSubview:progressBar];
        
        seekButton = [[UIButton alloc] initWithFrame:CGRectMake(80+x, 247, 10, 10)];
        seekButton.backgroundColor = [UIColor orangeColor];
        seekButton.layer.cornerRadius = 5;
        [self.view addSubview:seekButton];

        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, (unsigned long)NULL), ^{
            
        NSURL * url = [NSURL URLWithString:@"https://api.soundcloud.com/tracks/147445565/download?client_id=2d87025c8392069f828c446b965862e3"];
            
        NSData * data = [NSData dataWithContentsOfURL:url];
        
        dispatch_async(dispatch_get_main_queue(), ^{
                
                player = [[AVAudioPlayer alloc] initWithData:data error:nil];
               
                [stopButton addTarget:self action:@selector(stop) forControlEvents:UIControlEventTouchUpInside];
                
                [playButton addTarget:self action:@selector(play:) forControlEvents:UIControlEventTouchUpInside];
            
                [playButton addTarget:self action:@selector(pause:) forControlEvents:UIControlEventTouchUpInside];
            
                NSLog(@"player ready");
                
            });
            
        });
        
    
        
        // prepare to play with AVAudioPlayer
        // create two buttons play / stop
        // connect to URL
        // UIView "progress bar" with circle for "time remaining"
        
    }
    return self;
}

-(void)play:(UIButton *)sender
{
    if(sender.selected == NO)
    {
        sender.selected = YES;
    } else
        
    sender.selected = NO;
    
    [player play];
}

-(void)pause:(UIButton *)sender
{
    if(sender.selected == NO)
    {
        [player pause];
    }
    
}

-(void)stop
{
    [player stop];
    player.currentTime = 0;
    playButton.selected = NO;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIProgressView * pv = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleBar];
    pv.tintColor = [UIColor orangeColor];
    [self.view addSubview:pv];
    

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
