//
//  PNAPixelSounds.h
//  PixelNoise
//
//  Created by Ali Houshmand on 5/5/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface PNAPixelSounds : NSObject  //add AVAudioplayer delegate


@property (nonatomic) AVAudioPlayer * player;

@property (nonatomic) NSMutableArray * players; 

-(void)playSoundWithName:(NSString *)soundName;

@end
