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


@end

@implementation PNAWorldTwoViewController

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
        [self.animator addBehavior:self.collision];  // all behaviors need to be added to animator
        self.collision.collisionDelegate = self;
        
    
        
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
    [self.view addSubview:block];
    [self.gravity addItem:block];
    [self.collision addItem:block];
    
}







@end
