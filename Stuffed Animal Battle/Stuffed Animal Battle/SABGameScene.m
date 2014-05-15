//
//  SABGameScene.m
//  Stuffed Animal Battle
//
//  Created by Ali Houshmand on 5/15/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "SABGameScene.h"

////////
// HP for players
// HP bars represent HP pool
// Make fireball remove HP points
// Sound Effects (w/in spritekit) on explosion, landing after jumping
// Research Sprite Characters, how designed
// Find random pics online for your sprite characters (PNG)
////////

@interface SABGameScene () <SKPhysicsContactDelegate>

@end

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
    
    SKSpriteNode * dpadJumpBack;
    
    SKSpriteNode * player1;
    SKSpriteNode * player2;
}



-(instancetype)initWithSize:(CGSize)size
{
    self = [super initWithSize:size];
    if(self)
        
    {
       
        SKPhysicsBody * scenePhysics = [SKPhysicsBody bodyWithEdgeLoopFromRect:CGRectMake(0, 0, size.width, size.height)];
        
        self.physicsBody = scenePhysics;
    
        self.physicsWorld.contactDelegate = self;
        
        SKEffectNode *container = [SKEffectNode node];
        [self addChild:container];
        
//        SKShapeNode *shape = [SKShapeNode node];
//        shape.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(20, 20, 50, 50) cornerRadius:12].CGPath;
//        shape.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
//        shape.strokeColor = [SKColor redColor];
//        [container addChild:shape];

        SKSpriteNode * floor = [SKSpriteNode spriteNodeWithColor:[SKColor darkGrayColor] size:CGSizeMake(SCREEN_WIDTH, 30)];
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
        dpadUp.position = CGPointMake(100, 120);
        [self addChild:dpadUp];
        
        dpadLeft = [SKSpriteNode spriteNodeWithColor:[SKColor blueColor] size:CGSizeMake(30, 30)];
        dpadLeft.position = CGPointMake(40, 80);
        [self addChild:dpadLeft];
        
        dpadRight = [SKSpriteNode spriteNodeWithColor:[SKColor blueColor] size:CGSizeMake(30, 30)];
        dpadRight.position = CGPointMake(120, 80);
        [self addChild:dpadRight];
        
        dpadJumpBack = [SKSpriteNode spriteNodeWithColor:[SKColor lightGrayColor] size:CGSizeMake(30, 30)];
        dpadJumpBack.position = CGPointMake(60,120);
        [self addChild:dpadJumpBack];
        
        player1 = [SKSpriteNode spriteNodeWithColor:[SKColor whiteColor] size:CGSizeMake(40, 100)];
        player1.position = CGPointMake(SCREEN_WIDTH/2.0 - 250, 80);
        [self addChild:player1];
        SKPhysicsBody * playerPhysics = [SKPhysicsBody bodyWithRectangleOfSize:player1.size];
        player1.physicsBody = playerPhysics;
        

        player2 = [SKSpriteNode spriteNodeWithColor:[SKColor cyanColor] size:CGSizeMake(40, 100)];
        player2.position = CGPointMake(SCREEN_WIDTH/2.0 + 250,80);
        [self addChild:player2];
        SKPhysicsBody * player2Physics = [SKPhysicsBody bodyWithRectangleOfSize:player2.size];
        player2.physicsBody = player2Physics;
        
        player2.userData = [@{@"type":@"player2"} mutableCopy];
        
        player2.physicsBody.contactTestBitMask = 1; //listening for collisions of the same category
        

    }
    return self;
}


-(void)update:(NSTimeInterval)currentTime
{
    
    
}


-(void)didBeginContact:(SKPhysicsContact *)contact
{
    
    
    NSMutableArray * nodes = [@[] mutableCopy];
    
    if(contact.bodyA.node != nil) [nodes addObject:contact.bodyA.node];
    if(contact.bodyB.node != nil) [nodes addObject:contact.bodyB.node];
     
    
//NSArray * nodes = @[contact.bodyA.node,contact.bodyB.node];

    for(SKNode * node in nodes)
    {
     if([node.userData[@"type"] isEqualToString:@"fireball"])
     {
         
         
         [node removeFromParent];
         
         NSString * myParticlePath = [[NSBundle mainBundle] pathForResource:@"explosion" ofType:@"sks"];
         
         SKEmitterNode * explosion = [NSKeyedUnarchiver unarchiveObjectWithFile:myParticlePath];
         
         explosion.position = contact.contactPoint;
         
         explosion.numParticlesToEmit = 200;
         
         [self addChild:explosion];
         
     }
    }
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
   // UITouch * touch = [touches anyObject];
    
    CGPoint location = [[touches anyObject] locationInNode:self];

    [self testButtonsWithLocation:location];
}

-(void)testButtonsWithLocation:(CGPoint)location
{
    NSArray * buttons = @[buttonA, buttonB, dpadUp,dpadDown,dpadLeft,dpadRight,dpadJumpBack];
    for(SKNode * button in buttons) {
        
        if([button containsPoint:location])
        {
            NSLog(@"button%d", [buttons indexOfObject:button]);
            
            switch ([buttons indexOfObject:button])
            {
                case 0: // buttonA
                {   NSLog(@"Fire");
                    
//                    SKSpriteNode * fireball = [SKSpriteNode spriteNodeWithColor:[SKColor redColor] size:CGSizeMake(10,10)];
                   
                    
                    NSString * myParticlePath = [[NSBundle mainBundle] pathForResource:@"blueflame" ofType:@"sks"];
                    
                    SKEmitterNode * fireball = [NSKeyedUnarchiver unarchiveObjectWithFile:myParticlePath];
                    
                    fireball.position = CGPointMake(player1.position.x + 26, player1.position.y);
                    
                    SKPhysicsBody * fireballPhysics = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(10, 10)];
                    
                    fireball.physicsBody = fireballPhysics;
                    
                    fireball.physicsBody.contactTestBitMask = 1;  //fireball will register on player 2 physicsbody
                    
                    fireballPhysics.affectedByGravity = NO;
                    
                    fireball.userData = [@{@"type":@"fireball"} mutableCopy];
                    
                    [self addChild:fireball];
                    [fireballPhysics applyImpulse:CGVectorMake(6.0, 0.0)];

                }
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
                    
                case 6: // dpadJumpBack
                    NSLog(@"Jumped Back");
                    [player1.physicsBody applyImpulse:CGVectorMake(-5, 100)];
                    
                    
                default:break;
                    
                
                    
             }
        }
    }
}



@end
