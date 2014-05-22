//
//  PNAPixelSounds.m
//  PixelNoise
//
//  Created by Ali Houshmand on 5/5/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "PNAPixelSounds.h"

@implementation PNAPixelSounds



-(id)init
{
    self = [super init];
    
    if(self){
        
    }
    
    return self;

    //need a mutabe array of players in order to make sound work for each object added

}


-(void)playSoundWithName:(NSString *)soundName;
{
    NSString * file = [[NSBundle mainBundle] pathForResource:soundName ofType:@"wav"];
    
    NSData * fileData = [NSData dataWithContentsOfFile:file];
    
    self.player = [[AVAudioPlayer alloc] initWithData:fileData error:nil];
    
    // instant avplayer player
    // self.player.numberOfLoops = 0;  will play only once
    // self.players addobject:player
    
    [self.player play];
}


//-void audioplayer didfinish playing


@end
