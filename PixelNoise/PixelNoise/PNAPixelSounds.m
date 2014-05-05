//
//  PNAPixelSounds.m
//  PixelNoise
//
//  Created by Ali Houshmand on 5/5/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "PNAPixelSounds.h"

@implementation PNAPixelSounds


//worldviewcontroller - will have UIKitDynamics collision behavior(sound when hits the bottom), an animator, gravity behavior, on touches began create block (UIViews) where u touch


-(id)init
{
    self = [super init];
    return self;
//    if(self)
//    {
//        //self.players = mut
//        
//    }
}


-(void)playSoundWithName:(NSString *)soundName;
{
    NSString * file = [[NSBundle mainBundle] pathForResource:soundName ofType:@"wav"];
    
    NSData * fileData = [NSData dataWithContentsOfFile:file];
    
    self.player = [[AVAudioPlayer alloc] initWithData:fileData error:nil];
    
    //instant avplayer player
//    self.player.numberOfLoops = 0;  will play only once
    
    //self.players addobject:player
    
    
    
    [self.player play];
    
}


//-void audioplyaer didfinish playing


@end
