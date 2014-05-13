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
    
    UIView * seekButton;
    UIButton * playButton;
    UIButton * stopButton;
    UIView * progressBar;

    
    float oldX, oldY;
    BOOL dragging;
    
}

@end

@implementation LPAViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
       
        self.view.backgroundColor = [UIColor lightGrayColor];
        
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
        
        progressBar = [[UIView alloc] initWithFrame:CGRectMake(85, 250, 150, 4)];
        progressBar.layer.cornerRadius = 2;
        progressBar.backgroundColor = [UIColor darkGrayColor];
        [self.view addSubview:progressBar];
        
        seekButton = [[UIView alloc] initWithFrame:CGRectMake(80, 247, 10, 10)];
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
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateProgressBar:) userInfo:nil repeats:YES];

}

-(void)pause:(UIButton *)sender
{
    if(sender.selected == NO)
    {
        [player pause];
        [self.timer invalidate];
        playButton.selected = NO;
    }
    
}

-(void)stop
{
    [player stop];
    player.currentTime = 0;
    playButton.selected = NO;
    
    [self updateProgressBar:self.timer];
    
    [self.timer invalidate];
    self.timer = nil;
    
}

-(void)updateProgressBar:(NSTimer *)timer
{
    NSTimeInterval current = [player currentTime];
    NSTimeInterval length = [player duration];
    float progress = current/length;
    NSLog(@"%f",progress);
    
    float xPosition = progressBar.frame.origin.x + progress * progressBar.frame.size.width;
    
//    int min =
//    int sec =
    
    seekButton.frame = CGRectMake(xPosition, 247, 10, 10);
    
    UILabel * currentTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(seekButton.frame.origin.x, 260, 50, 30)];
    currentTimeLabel.backgroundColor = [UIColor lightGrayColor];
    currentTimeLabel.textColor = [UIColor orangeColor];
    currentTimeLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
    //currentTimeLabel.textAlignment = NSTextAlignmentCenter;
    
    static NSDateFormatter *dateFormatter;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"mm:ss";
    }
    
    currentTimeLabel.text = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:current]];
    
    
  //  currentTimeLabel.text = [NSString stringWithFormat:@"%.01f",current];
    
    [self.view addSubview:currentTimeLabel];
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self pause:nil];
    
    UITouch *aTouch = [touches anyObject];
    CGPoint location = [aTouch locationInView:seekButton];
    CGPoint previousLocation = [aTouch previousLocationInView:seekButton];
    seekButton.frame = CGRectOffset(seekButton.frame, (location.x - previousLocation.x), 0);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * aTouch = [touches anyObject];
    
   // CGPoint touchLocation = [aTouch locationInView:seekButton];
    if ([[aTouch.view class] isSubclassOfClass:[UIView class]]) {
        dragging = YES;
        
        [self pause:nil];
    }
}


-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    dragging = NO;
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
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
