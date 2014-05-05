//
//  BBALevelController.m
//  BrickBreaker
//
//  Created by Ali Houshmand on 4/17/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "BBALevelController.h"
#import "MOVE.h"
#import <AVFoundation/AVFoundation.h>


@interface BBALevelController () <UICollisionBehaviorDelegate>

@property (nonatomic) AVAudioPlayer * player;


@property (nonatomic)  UIView * paddle;
@property (nonatomic)  NSMutableArray * balls;
@property (nonatomic)  NSMutableArray * bricks;

// dynamics animator
@property (nonatomic) UIDynamicAnimator * animator;

// pushes the ball
@property (nonatomic) UIPushBehavior * pusher;

// handles properties that handles collisions
@property (nonatomic) UICollisionBehavior * collider;

// item behavior
@property (nonatomic) UIDynamicItemBehavior * paddleDynamicsProp;
@property (nonatomic) UIDynamicItemBehavior * ballsDynamicsProp;
@property (nonatomic) UIDynamicItemBehavior * bricksDynamicsProp;

// manages attachments to objects
@property (nonatomic) UIAttachmentBehavior * attacher;

@end

//////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////


@implementation BBALevelController
{
    float paddleWidth;
    float points;
    UILabel * score;
    int lives;
    int livesLost;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.bricks = [@ []mutableCopy];
        self.balls = [@ []mutableCopy];
        self.view.backgroundColor = [UIColor colorWithWhite:0.1 alpha:1.0];
        
        paddleWidth = 80;
        points = 0;
        
        lives = 3;
        livesLost = 0;
        
        /////////////////
        
        
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapScreen:)];
        [self.view addGestureRecognizer:tap];
        
    
    }
    return self;
}


-(void)tapScreen:(UITapGestureRecognizer *)gr  //gesture recognizer variable
{
    CGPoint location = [gr locationInView:self.view];
    self.attacher.anchorPoint = CGPointMake(location.x, self.attacher.anchorPoint.y);

}


-(void)playSoundWithName:(NSString *)soundName
{
    NSString * file = [[NSBundle mainBundle] pathForResource:soundName ofType:@"wav"];
    
    NSURL * url = [[NSURL alloc] initFileURLWithPath:file];

    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    
    [self.player play];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
  
}


-(void)resetLevel
{
    self.animator  = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    [self createPaddle];
    [self createBricks];

    self.collider = [[UICollisionBehavior alloc] initWithItems:[self allItems]];
    self.collider.collisionDelegate = self;
    
    //includes boundaries and items for collisions by using everything
    self.collider.collisionMode = UICollisionBehaviorModeEverything;

   [self createBall];

    //sets the walls as the boundaries
   // self.collider.translatesReferenceBoundsIntoBoundary = YES;
    
    // sets left,right,top as boundary, floor as out of bounds
    int w = self.view.frame.size.width;
    int h = self.view.frame.size.height;
    
    [self.collider addBoundaryWithIdentifier:@"ceiling" fromPoint:CGPointMake(0,0) toPoint:CGPointMake(w, 0)];
    [self.collider addBoundaryWithIdentifier:@"leftWall" fromPoint:CGPointMake(0,0) toPoint:CGPointMake(0,h)];
    [self.collider addBoundaryWithIdentifier:@"rightWall" fromPoint:CGPointMake(w,0) toPoint:CGPointMake(w,h)];
    [self.collider addBoundaryWithIdentifier:@"floor" fromPoint:CGPointMake(0,h+10) toPoint:CGPointMake(w,h+10)];
    [self.animator addBehavior:self.collider];

    /////////////////////////// initiating ball properties below
    
    self.ballsDynamicsProp = [self createPropertiesForItems:self.balls];
    self.bricksDynamicsProp = [self createPropertiesForItems:self.bricks];
    self.paddleDynamicsProp = [self createPropertiesForItems:@[self.paddle]];

    self.ballsDynamicsProp.allowsRotation = NO;
    self.paddleDynamicsProp.density = 100000;
    self.bricksDynamicsProp.density = 100000;
    
    self.ballsDynamicsProp.elasticity = 1.0;
    self.ballsDynamicsProp.resistance = 0.0;
}


-(void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p
{

    if([(NSString *)identifier isEqualToString:@"floor"])
    {
        UIView * ball = (UIView *)item;
        [ball removeFromSuperview];
        [self.balls removeObject:ball];
        [self.collider removeItem:ball];
       
      if ((self.balls.count == 0) && [self.delegate respondsToSelector:@selector(gameDone)])
      {
          livesLost++;
          [self createBall];
          [self.delegate addLives:livesLost];
        
      }
        
        if (livesLost == lives)
        {
            [self.delegate gameDone]; //need this for optional method in delegate protocol in .h
            
            
            NSLog(@"Start Over");
        }
    }
}


-(void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item1 withItem:(id<UIDynamicItem>)item2 atPoint:(CGPoint)p
{
   
    
    if([item1 isEqual:self.paddle] || [item2 isEqual:self.paddle])
    {
        [self playSoundWithName:@"retro_affirm"];
    }
    
    
    UIView * tempBrick; // lets hold on to what the brick was, now that we found it, so we can do something with it
    
    for (UIView * brick in self.bricks)
    {
        if([item1 isEqual:brick] || [item2 isEqual:brick]) //isEqual more specific than ==
        {
            
            if (brick.alpha == 0.5)
            {
            
            tempBrick = brick;
                
                
                
            [self.collider removeItem:brick]; //removing brick collision behavior dynamics
            
            UILabel * pointLabel = [[UILabel alloc] initWithFrame:CGRectMake(tempBrick.frame.origin.x, tempBrick.frame.origin.y - 10, 50, 50)];
            
            pointLabel.text = [NSString stringWithFormat:@"+%d",(int)brick.tag];
            [pointLabel setTextColor:[UIColor orangeColor]]; //can also say pointLabel.textColor = [UIColor color]
            pointLabel.textAlignment = NSTextAlignmentCenter;
            pointLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12];
            [self.view addSubview:pointLabel];
           
            [MOVE animateView:pointLabel properties:@{@"alpha":@0,@"duration":@0.6,@"delay":@0.0, @"remove":@YES}];
            points += brick.tag; // point counter will be assigned to the brick.tag that is assigned to random #
            
            
            //we get to call a method that belongs to the delegate's class (also to a diff object, not the instance of the current class). Notice that the method is not global. its not in .h file    
           
            [self.delegate addPoints:points];
                
            NSLog(@"Total Points = %f",points);
            [brick removeFromSuperview];
            
            }
            
         brick.alpha = 0.5;
       }
    }
        if(tempBrick != nil)
    {
        [self.bricks removeObjectIdenticalTo:tempBrick];
            [self playSoundWithName:@"melodic5_affirm"];
    }
    
    //removes brick from array
}


-(UIDynamicItemBehavior *)createPropertiesForItems:(NSArray *)items
{
    
    UIDynamicItemBehavior * properties = [[UIDynamicItemBehavior alloc] initWithItems:items];
    properties.allowsRotation = NO;
    properties.friction = 0.0;
    [self.animator addBehavior:properties];
    return properties;
}


-(NSArray *)allItems
{
    NSMutableArray * items = [@[self.paddle] mutableCopy];
    
//    for (UIView*item in self.balls) [items addObject:item];
    for (UIView*item in self.bricks) [items addObject:item];
    return items;
}


-(void)createPaddle
{
    self.paddle = [[UIView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - paddleWidth)/2, SCREEN_HEIGHT - 60, paddleWidth, 6)]; // changed screen height for paddle by 40 because we lowered frame by 40 in level frame
    self.paddle.backgroundColor = [UIColor colorWithWhite:0.5 alpha:1.0];
    self.paddle.layer.cornerRadius = 3;
    [self.view addSubview:self.paddle];
   
    self.attacher = [[UIAttachmentBehavior alloc] initWithItem:self.paddle attachedToAnchor:CGPointMake(CGRectGetMidX(self.paddle.frame), CGRectGetMidY(self.paddle.frame))];
    [self.animator addBehavior:self.attacher];
    
}

-(void)createBricks
{
 
    int brickCols = 8; // setting number of bricks
    int brickRows = 3;
    
    float brickWidth = (SCREEN_WIDTH - (10 * (brickCols +1))) / brickCols;
    float brickHeight = 30;
    
    for (int c = 0; c < brickCols; c++)
    {
        for (int r = 0; r < brickRows; r++)
        {
        float brickX = ((brickWidth + 10) * c) + 10;
        float brickY = ((brickHeight + 10) * r) + 10;
        
        UIImageView * brick = [[UIImageView alloc] initWithFrame:CGRectMake(brickX, brickY, brickWidth, brickHeight)];
        brick.layer.cornerRadius = 6;
        brick.backgroundColor = [UIColor clearColor];  //[UIColor colorWithWhite:0.7 alpha:1.0];
        brick.image = [UIImage imageNamed:@"beast"];

        int random = round(arc4random_uniform(5)) * 50;
        brick.tag = random;
            
        [self.view addSubview:brick];
        [self.bricks addObject:brick];
        }
    }
}

-(void)createBall
{
    int multiBall = 2;

    for(int x = 0; x < multiBall; x++)
    {
    
    CGRect frame = self.paddle.frame;  //creating a frame based on the position of the paddle
    
    UIImageView * ball = [[UIImageView alloc] initWithFrame:CGRectMake(frame.origin.x,frame.origin.y - 52,20,20)];
    ball.backgroundColor = [UIColor lightGrayColor];
    ball.image = [UIImage imageNamed:@"grenade"];
    ball.layer.cornerRadius = 10;
    [self.view addSubview:ball];
        
        [self.collider addItem:ball]; //added these two to make createBall work when losing a life and respawning
        [self.ballsDynamicsProp addItem:ball];
    
    // add ball to balls array
    [self.balls addObject:ball];
    
    // start ball off with a push
    self.pusher = [[UIPushBehavior alloc] initWithItems:self.balls mode:UIPushBehaviorModeInstantaneous];
    
    self.pusher.pushDirection = CGVectorMake(0.05, 0.05);  // two speeds x,y; altering speeds give different direc
    
    self.pusher.active = YES; // because push is instantaneous, it will only happ once
    
    [self.animator addBehavior:self.pusher]; // since animator controls it, have to add pusher to it
    }
    
}




@end
