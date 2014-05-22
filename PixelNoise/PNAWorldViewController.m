//
//  PNAWorldViewController.m
//  PixelNoise
//
//  Created by Ali Houshmand on 5/5/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "PNAWorldViewController.h"
#import "PNAPixelSounds.h"


@interface PNAWorldViewController () <UICollisionBehaviorDelegate>

@property (nonatomic) NSMutableArray * bricks;

// dynamics animator
@property (nonatomic) UIDynamicAnimator * animator;

// pushes the brick
@property (nonatomic) UIPushBehavior * pusher;

// handles properties that handles collisions
@property (nonatomic) UICollisionBehavior * collider;

// item behavior
@property (nonatomic) UIGravityBehavior * brickGravity;
@property (nonatomic) UIDynamicItemBehavior * bricksDynamicsProp;

@end

@implementation PNAWorldViewController

{
    CGPoint touchPoint;
    UIView * brick;
    
    PNAPixelSounds * sounds;

    
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
 
        self.bricks = [@[] mutableCopy];
        self.view.backgroundColor = [UIColor colorWithWhite:.50 alpha:.95];
        sounds = [[PNAPixelSounds alloc] init];

    
    }
    return self;
}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    touchPoint = [touch locationInView:self.view];
    [self createSquares];
}



-(void)createSquares
{
    
    NSLog(@"Touch x : %f y : %f", touchPoint.x, touchPoint.y);
   
    brick = [[UIView alloc] initWithFrame:CGRectMake(touchPoint.x,touchPoint.y,10,10)];
    brick.layer.cornerRadius = 2;
    brick.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:brick];
    [self.bricks addObject:brick];
    
    self.brickGravity = [[UIGravityBehavior alloc] initWithItems:self.bricks];
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    self.collider = [[UICollisionBehavior alloc] initWithItems:self.bricks];
    
    self.collider.translatesReferenceBoundsIntoBoundary = YES;
    
    [self.animator addBehavior:self.brickGravity];
    
    //self.collider = [[UICollisionBehavior alloc] initWithItems:[self allItems]];
    self.collider.collisionDelegate = self;
    
    //includes boundaries and items for collisions by using everything
    self.collider.collisionMode = UICollisionBehaviorModeEverything;
    
    // sets left,right,top as boundary, floor as out of bounds
    int w = self.view.frame.size.width;
    int h = self.view.frame.size.height;
    
    [self.collider addBoundaryWithIdentifier:@"ceiling" fromPoint:CGPointMake(0,0) toPoint:CGPointMake(w, 0)];
    [self.collider addBoundaryWithIdentifier:@"leftWall" fromPoint:CGPointMake(0,0) toPoint:CGPointMake(0,h)];
    [self.collider addBoundaryWithIdentifier:@"rightWall" fromPoint:CGPointMake(w,0) toPoint:CGPointMake(w,h)];
    [self.collider addBoundaryWithIdentifier:@"floor" fromPoint:CGPointMake(0,h+10) toPoint:CGPointMake(w,h+10)];
    [self.animator addBehavior:self.collider];
    
    self.bricksDynamicsProp = [self createPropertiesForItems:self.bricks];
    self.bricksDynamicsProp.density = 100000;
    //self.bricksDynamicsProp.allowsRotation = YES;
    

}

-(void)collisionBehavior:(UICollisionBehavior *)behavior endedContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier
{

    //[self.collider removeItem:brick];
    //[self.bricks removeObjectIdenticalTo:brick];
    [sounds playSoundWithName:@"melodic4_affirm"];

}


-(UIDynamicItemBehavior *)createPropertiesForItems:(NSArray *)items
{
    UIDynamicItemBehavior * properties = [[UIDynamicItemBehavior alloc] initWithItems:items];
    properties.allowsRotation = NO;
    properties.friction = 1.0;
    properties.elasticity = 0.9;
    [self.animator addBehavior:properties];
    return properties;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)prefersStatusBarHidden {return YES;}



@end

