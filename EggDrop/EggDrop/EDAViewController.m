//
//  EDAViewController.m
//  EggDrop
//
//  Created by Ali Houshmand on 5/22/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "EDAViewController.h"
#import <CoreMotion/CoreMotion.h>
#import "PNAPixelSounds.h"

////////// HOMEWORK
// make spoon move on touch // DONE
// Make your egg more sensitive // DONE
// egg to roll off of the edge (fall outside ofspoon) // DONE
// add splatter sound // DONE
// change egg image to cracked egg


@interface EDAViewController ()

@end

@implementation EDAViewController
{
    CMMotionManager * mManager;
    BOOL eggIsFalling;
    
    PNAPixelSounds * sounds;
    
    CGRect originalSpoon;
    CGRect originalEgg;
    
    UIImageView * chicky;
    
    UILabel * timer;
    
    UILabel * bestTime;

    NSTimer * gameClock;
    

}

- (void)viewDidLoad
{
    
 
    gameClock = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
    
    
    [self.resetButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    timer = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-50, 13, 100, 50)];
    timer.backgroundColor = [UIColor colorWithWhite:0.95 alpha:.25];
    timer.textColor = [UIColor whiteColor];
    [timer setFont:[UIFont fontWithName:@"AmericanTypewriter-Bold" size:30]];
    timer.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:timer];
    

    originalSpoon = self.spoon.frame;
    originalEgg = self.egg.frame;
    
    
    [super viewDidLoad];
  
    sounds = [[PNAPixelSounds alloc] init];
    
    mManager = [[CMMotionManager alloc] init];
    
    [mManager startDeviceMotionUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMDeviceMotion *motion, NSError *error) {
        
    float roll = motion.attitude.roll * 12;  //CMAcceleration
    if(!eggIsFalling) self.egg.frame = CGRectOffset(self.egg.frame, roll, 0);
        
    float eggMidX = CGRectGetMidX(self.egg.frame);
    float spoonMidX = CGRectGetMidX(self.spoon.frame);
    
    if(fabs(spoonMidX - eggMidX)> self.egg.frame.size.width/2.0 && !eggIsFalling && eggMidX>spoonMidX)
        {
        eggIsFalling = YES;
        
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            
        [sounds playSoundWithName:@"fallandsplat"];
    
        float x = self.egg.frame.origin.x + self.egg.frame.size.width/4.0;
        float y = self.egg.frame.origin.y + self.egg.frame.size.height/4.0;
        float w = self.egg.frame.size.width / 2.0;
        float h = self.egg.frame.size.height / 2.0;
            
        self.egg.frame  = CGRectMake(1.1*x, y, w, h);
        
        [gameClock invalidate];

        } completion:^(BOOL finished) {
            
        [self.egg setImage:[UIImage imageNamed:@"babychick3"]];
            
        }];
        }
        
    if(fabs(spoonMidX - eggMidX)> self.egg.frame.size.width/2.0 && !eggIsFalling && eggMidX<spoonMidX)
        {
        eggIsFalling = YES;
       
        [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        [sounds playSoundWithName:@"fallandsplat"];
        
        float x = self.egg.frame.origin.x - self.egg.frame.size.width/4.0;
        float y = self.egg.frame.origin.y + self.egg.frame.size.height/4.0;
        float w = self.egg.frame.size.width / 2.0;
        float h = self.egg.frame.size.height / 2.0;
        
        self.egg.frame  = CGRectMake(x, y, w, h);
        
        [gameClock invalidate];
        
            
        } completion:^(BOOL finished) {
            
        [self.egg setImage:[UIImage imageNamed:@"babychick3"]];
        
        }];
        
        }
    }];
    
}


- (IBAction)restart:(id)sender {
    
    [gameClock invalidate];
    
    gameClock = nil;
    
    [self updateTimer];
   
    [chicky removeFromSuperview];
    [self.egg setImage:[UIImage imageNamed:@"egg.png"]];
    
    eggIsFalling = NO;

    self.egg.frame = originalEgg;
    self.spoon.frame = originalSpoon;
    
    NSLog(@"selected");
}



-(void)updateTimer
{
  
    static int i = 1;
    
    timer.text = [NSString stringWithFormat:@"%.01d",i];
    
    i++;

    
}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *aTouch = [touches anyObject];
    CGPoint location = [aTouch locationInView:self.spoon];   //
    CGPoint previousLocation = [aTouch previousLocationInView:self.spoon];
    
  //  BOOL isInsideSpoon = CGRectContainsPoint(self.spoon.frame, [aTouch locationInView:self.view]);
    
    BOOL isInsideSpoon = CGRectContainsPoint(CGRectMake(self.spoon.frame.origin.x, self.spoon.frame.origin.y+230, self.spoon.frame.size.width, self.spoon.frame.size.height), [aTouch locationInView:self.view]);
    
    NSLog(@"Is Inside Seek %u",isInsideSpoon);
    
    if(!isInsideSpoon) return;

    self.spoon.frame = CGRectOffset(self.spoon.frame, (location.x - previousLocation.x), 0);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
