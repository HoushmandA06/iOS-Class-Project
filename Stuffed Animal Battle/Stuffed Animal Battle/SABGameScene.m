//
//  SABGameScene.m
//  Stuffed Animal Battle
//
//  Created by Ali Houshmand on 5/15/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "SABGameScene.h"

@implementation SABGameScene
{
    SKLabelNode * timerLabel;
    SKSpriteNode * player1HPBar;
    SKSpriteNode * player2HPBar;

    SKSpriteNode * buttonA;
    SKSpriteNode * buttonB;
    
    SKSpriteNode * dpadUp;
    SKSpriteNode * dpadDown;
    SKSpriteNode * dpadLeft;
    SKSpriteNode * dpadRight;
    SKSpriteNode * player1;
}



-(instancetype)initWithSize:(CGSize)size
{
    self = [super initWithSize:size];
    if(self)
        
    {
        SKSpriteNode * floor = [SKSpriteNode spriteNodeWithColor:[SKColor yellowColor] size:CGSizeMake(SCREEN_WIDTH, 30)];
        floor.position = CGPointMake(SCREEN_WIDTH/2.0,15);
        [self addChild:floor];
        
        SKPhysicsBody * floorPhysics =  [SKPhysicsBody bodyWithRectangleOfSize:floor.size];
        floorPhysics.affectedByGravity = NO;
        floorPhysics.dynamic = NO;
        floor.physicsBody = floorPhysics;
        
        
        timerLabel = [SKLabelNode node];
        timerLabel.position = CGPointMake(SCREEN_WIDTH / 2.0, SCREEN_HEIGHT - 20);
        timerLabel.text = @"00:00";
        timerLabel.fontColor = [SKColor greenColor]; //will want to change to red at certain time
        timerLabel.fontSize = 16.0;
        [self addChild:timerLabel];
        
        float barArea = (SCREEN_WIDTH - 60)/2.0 - 20;  //  length of health bar
        player1HPBar = [SKSpriteNode spriteNodeWithColor:[SKColor lightGrayColor] size:CGSizeMake(barArea,12)];
        player1HPBar.position = CGPointMake((barArea + 20)/2, SCREEN_HEIGHT-14);
        [self addChild:player1HPBar];
        
        player2HPBar = [SKSpriteNode spriteNodeWithColor:[SKColor lightGrayColor] size:CGSizeMake(barArea,12)];
        player2HPBar.position = CGPointMake(SCREEN_WIDTH - (barArea + 20)/2, SCREEN_HEIGHT-14);
        [self addChild:player2HPBar];
        
        buttonA = [SKSpriteNode spriteNodeWithColor:[SKColor redColor] size:CGSizeMake(40, 40)];
        buttonA.position = CGPointMake(SCREEN_WIDTH - 40, 80);
        [self addChild:buttonA];
        
        buttonB = [SKSpriteNode spriteNodeWithColor:[SKColor redColor] size:CGSizeMake(40, 40)];
        buttonB.position = CGPointMake(SCREEN_WIDTH - 80, 40);
        [self addChild:buttonB];
        
        dpadDown = [SKSpriteNode spriteNodeWithColor:[SKColor blueColor] size:CGSizeMake(30, 30)];
        dpadDown.position = CGPointMake(80, 40);
        [self addChild:dpadDown];
        
        dpadUp = [SKSpriteNode spriteNodeWithColor:[SKColor blueColor] size:CGSizeMake(30, 30)];
        dpadUp.position = CGPointMake(80, 120);
        [self addChild:dpadUp];
        
        dpadLeft = [SKSpriteNode spriteNodeWithColor:[SKColor blueColor] size:CGSizeMake(30, 30)];
        dpadLeft.position = CGPointMake(40, 80);
        [self addChild:dpadLeft];
        
        dpadRight = [SKSpriteNode spriteNodeWithColor:[SKColor blueColor] size:CGSizeMake(30, 30)];
        dpadRight.position = CGPointMake(120, 80);
        [self addChild:dpadRight];
        
        player1 = [SKSpriteNode spriteNodeWithColor:[SKColor whiteColor] size:CGSizeMake(40, 100)];
        player1.position = CGPointMake(SCREEN_WIDTH/2.0, 80);
        [self addChild:player1];
        
        SKPhysicsBody * playerPhysics = [SKPhysicsBody bodyWithRectangleOfSize:player1.size];
        
        player1.physicsBody = playerPhysics;
        
      
        


    }
    return self;
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = [touches anyObject];
    
    CGPoint location = [[touches anyObject] locationInNode:self];

    [self testButtonsWithLocation:location];
}

-(void)testButtonsWithLocation:(CGPoint)location
{
    NSArray * buttons = @[buttonA, buttonB, dpadUp,dpadDown,dpadLeft,dpadRight];
    for(SKNode * button in buttons) {
        
        if([button containsPoint:location])
        {
            NSLog(@"button%d", [buttons indexOfObject:button]);
            
            switch ([buttons indexOfObject:button])
            {
                case 0: // buttonA
                    NSLog(@"Punch");
                    break;
                    
                case 1: // buttonB
                    NSLog(@"Kick");
                    break;
                    
                case 2: // dpadUp
                     NSLog(@"Jump");

                    [player1.physicsBody applyImpulse:CGVectorMake(5.0,100.0)];
                 
                    break;
                    
                case 3: // dpadDown
                {   NSLog(@"Duck");
                  
                    SKAction * moveDown = [SKAction moveToY:(player1.position.y-50) duration:0.1];
                    [player1 runAction:moveDown];
                }
                    break;
                    
                case 4: // dpadLeft
                   NSLog(@"Left");
            
                    [player1.physicsBody applyImpulse:CGVectorMake(-20, 0.0)];
//                    SKAction * moveLeft = [SKAction moveToX:(player1.position.x-5) duration:0.1];
//                    [player1 runAction:moveLeft];
            
                    break;
                    
                case 5: // dpadRight
                   NSLog(@"Right");
                    [player1.physicsBody applyImpulse:CGVectorMake(20.0, 0.0)];
                    break;
                    
                default:break;
                    
                
                    
             }
        }
    }
}



@end
