//
//  PNAWorldTwoViewController.m
//  PixelNoise
//
//  Created by Ali Houshmand on 5/6/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "PNAWorldTwoViewController.h"
#import "PNAPixelSounds.h"

@interface PNAWorldTwoViewController () <UICollisionBehaviorDelegate>

@property (nonatomic) UIDynamicAnimator * animator;
@property (nonatomic) UIGravityBehavior * gravity;
@property (nonatomic) UICollisionBehavior * collision;
@property (nonatomic) UIDynamicItemBehavior * blockBehavior;

//shards
@property (nonatomic) UIDynamicItemBehavior * shardBehavior;
@property (nonatomic) UICollisionBehavior * shardCollision;


@end

@implementation PNAWorldTwoViewController
{
    PNAPixelSounds * sounds;
    
    NSArray * splatterDirections;
    
    int w;
    int h;
    
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
        self.view.backgroundColor = [UIColor darkGrayColor];
        self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
        self.gravity = [[UIGravityBehavior alloc] init];
        [self.animator addBehavior:self.gravity];
        
        self.collision = [[UICollisionBehavior alloc] init];
        self.collision.translatesReferenceBoundsIntoBoundary = YES;
        w = self.view.frame.size.width;
        h = self.view.frame.size.height;
        [self.collision addBoundaryWithIdentifier:@"floor" fromPoint:CGPointMake(0,h-1) toPoint:CGPointMake(w,h-1)];
        [self.animator addBehavior:self.collision];  // all behaviors need to be added to animator
        self.collision.collisionDelegate = self;
    
//        [self.collision addBoundaryWithIdentifier:@"ceiling" fromPoint:CGPointMake(0,0) toPoint:CGPointMake(w, 0)];
//        [self.collision addBoundaryWithIdentifier:@"leftWall" fromPoint:CGPointMake(0,0) toPoint:CGPointMake(0,h)];
//        [self.collision addBoundaryWithIdentifier:@"rightWall" fromPoint:CGPointMake(w,0) toPoint:CGPointMake(w,h)];
        
        self.blockBehavior = [[UIDynamicItemBehavior alloc] init];
        self.blockBehavior.elasticity = 1.0;
        [self.animator addBehavior:self.blockBehavior];
        
        self.shardBehavior = [[UIDynamicItemBehavior alloc] init];
        self.shardBehavior.density = 10;
        [self.animator addBehavior:self.shardBehavior];
        
        self.shardCollision = [[UICollisionBehavior alloc] init];
        self.shardCollision.translatesReferenceBoundsIntoBoundary = YES;
        [self.animator addBehavior:self.shardCollision];  // all behaviors need to be added to animator
        self.shardCollision.collisionDelegate = self;
        
        splatterDirections = @[
                               [NSValue valueWithCGPoint:CGPointMake(-.15, -.15)],
                               [NSValue valueWithCGPoint:CGPointMake(-0.05, -.20)],
                               [NSValue valueWithCGPoint:CGPointMake(0.00, -.25)],
                               [NSValue valueWithCGPoint:CGPointMake(0.05, -.20)],
                               [NSValue valueWithCGPoint:CGPointMake(.15, -.15)]
                               ];
        
        // to use for continuous mode
//        [NSValue valueWithCGPoint:CGPointMake(-1.0, -1.0)],
//        [NSValue valueWithCGPoint:CGPointMake(-0.5, -1.0)],
//        [NSValue valueWithCGPoint:CGPointMake(0.0, -1.0)],
//        [NSValue valueWithCGPoint:CGPointMake(0.5, -1.0)],
//        [NSValue valueWithCGPoint:CGPointMake(1.0, -1.0)]
        
        sounds = [[PNAPixelSounds alloc] init];
    
        
     }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch * touch in touches)
    {
        CGPoint loc = [touch locationInView:self.view];
        [self createBlockWithLocation:loc];
    }
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch * touch in touches)
    {
        CGPoint loc = [touch locationInView:self.view];
        [self createBlockWithLocation:loc];
    }
    
}

-(void)createBlockWithLocation:(CGPoint)location
{
    UIView * block = [[UIView alloc] initWithFrame:CGRectMake(location.x,location.y, 10, 10)];
    block.backgroundColor = [UIColor blueColor];
    block.layer.cornerRadius = 2;
    [self.view addSubview:block];
    [self.gravity addItem:block];
    [self.blockBehavior addItem:block];
    
    [self.collision addItem:block];
}

-(void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p
{
    if([behavior isEqual:self.collision])
    {
        NSLog(@"%@", identifier);
        
        [sounds playSoundWithName:@"drip"];
        [self createShardsWithLocation:p];
        
        UIView * collidedblock = (UIView *)item; // now item can work with UIView which we will need to remove item from superview
        
        [self.gravity removeItem:collidedblock];
        [self.collision removeItem:collidedblock];
        [collidedblock removeFromSuperview];
        
        static int x = 10;
        x++;
    
        UIView * sparkPuddle = [[UIView alloc] initWithFrame:CGRectMake(0,479,320,5-x)];
        sparkPuddle.backgroundColor = [UIColor orangeColor];
        [self.view addSubview:sparkPuddle];

        [self.collision addBoundaryWithIdentifier:@"floor" fromPoint:CGPointMake(0,h-1-x) toPoint:CGPointMake(w,h-1-x)];

        
        
    }
    
if([behavior isEqual:self.shardCollision])
{
    UIView * collidedShard = (UIView *)item;
    [self.gravity removeItem:collidedShard];
    [self.shardBehavior removeItem:collidedShard];
    [self.shardCollision removeItem:collidedShard];
    
    [collidedShard removeFromSuperview];
}
}


-(void)createShardsWithLocation:(CGPoint)location
{
    for(NSValue * pointValue in splatterDirections) {
        CGPoint direction = [pointValue CGPointValue];
       
        UIView * shard = [[UIView alloc] initWithFrame:CGRectMake(location.x + (direction.x * 10),location.y-20, 8, 8)];
        shard.backgroundColor = [UIColor orangeColor];
        shard.layer.cornerRadius = 6;
        [self.view addSubview:shard];
        [self.gravity addItem:shard];
        [self.shardCollision addItem:shard];
        [self.shardBehavior addItem:shard];
        
        UIPushBehavior * pusher = [[UIPushBehavior alloc] initWithItems:@[shard] mode:UIPushBehaviorModeInstantaneous];
        //UIPushBehaviorModeContinuous

//        [pusher addItem:shard]; dont need this now since initWithitems
  
        [self.animator addBehavior:pusher];
        pusher.pushDirection = CGVectorMake(direction.x, direction.y);
        
    }
    
}






@end
