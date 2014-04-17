//
//  BBALevelController.m
//  BrickBreaker
//
//  Created by Ali Houshmand on 4/17/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "BBALevelController.h"
#import "MOVE.h"

@interface BBALevelController () <UICollisionBehaviorDelegate>

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
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}




-(void)resetLevel
{
    self.animator  = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    [self createPaddle];
    [self createBall];
    [self createBricks];

    self.collider = [[UICollisionBehavior alloc] initWithItems:[self allItems]];
    self.collider.collisionDelegate = self;
    
    //includes boundaries and items for collisions by using everything
    self.collider.collisionMode = UICollisionBehaviorModeEverything;

    //sets the walls as the boundaries
    self.collider.translatesReferenceBoundsIntoBoundary = YES;
    
    [self.animator addBehavior:self.collider];
    
    /////////////////////////// initiating ball properties below
    
    self.ballsDynamicsProp = [self createPropertiesForItems:self.balls];
    self.bricksDynamicsProp = [self createPropertiesForItems:self.bricks];
    self.paddleDynamicsProp = [self createPropertiesForItems:@[self.paddle]];

    self.ballsDynamicsProp.allowsRotation = YES;
    self.paddleDynamicsProp.density = 100000;
    self.bricksDynamicsProp.density = 100000;
    
    self.ballsDynamicsProp.elasticity = 1.0;
    self.ballsDynamicsProp.resistance = 0.0;
}

-(void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item1 withItem:(id<UIDynamicItem>)item2 atPoint:(CGPoint)p
{
    UIView * tempBrick; // lets hold on to what the brick was, now that we found it, so we can do something with it
    
    for (UIView * brick in self.bricks)
    {
        if([item1 isEqual:brick] || [item2 isEqual:brick]) //isEqual more specific than ==
        {
            if (brick.alpha == 0.5)
            {
            tempBrick = brick;
            [self.collider removeItem:brick]; //removing brick collision behavior dynamics
            
            UILabel * pointLabel = [[UILabel alloc] initWithFrame:CGRectMake(tempBrick.frame.origin.x, 5, 50, 50)];
            pointLabel.text = @"+100";
            [pointLabel setTextColor:[UIColor orangeColor]];
            [self.view addSubview:pointLabel];
                
            [MOVE animateView:pointLabel properties:@{@"alpha":@0,@"duration":@0.6,@"delay":@0.0, @"remove":@YES}];
                
            points += 100;
            NSLog(@"Total Points = %f", points);
            
            [brick removeFromSuperview];
            }
            brick.alpha = 0.5;
       }
    }
        if(tempBrick != nil) [self.bricks removeObjectIdenticalTo:tempBrick]; //removes brick from array
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
    
    for (UIView*item in self.balls) [items addObject:item];
    for (UIView*item in self.bricks) [items addObject:item];
    return items;
}


-(void)createPaddle
{
    self.paddle = [[UIView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - paddleWidth)/2, SCREEN_HEIGHT - 20, paddleWidth, 6)];
    self.paddle.backgroundColor = [UIColor colorWithWhite:0.5 alpha:1.0];
    self.paddle.layer.cornerRadius = 3;
    [self.view addSubview:self.paddle];
   

    
}

-(void)createBricks
{
 
    int brickCols = 8; // setting number of bricks
    
    float brickWidth = (SCREEN_WIDTH - (10 * (brickCols +1))) / brickCols;
    
    for (int i = 0; i < brickCols; i++)
    {
        float brickX = ((brickWidth + 10) * i) + 10;
        UIImageView * brick = [[UIImageView alloc] initWithFrame:CGRectMake(brickX, 10, brickWidth, 30)];
        brick.layer.cornerRadius = 6;
        brick.backgroundColor = [UIColor colorWithWhite:0.7 alpha:1.0];
        brick.image = [UIImage imageNamed:@"beast"];

        [self.view addSubview:brick];
        [self.bricks addObject:brick];
        
    }
}

-(void)createBall
{
    CGRect frame = self.paddle.frame;  //creating a frame based on the position of the paddle
    
    UIImageView * ball = [[UIImageView alloc] initWithFrame:CGRectMake(frame.origin.x,frame.origin.y - 12,10,10)];
    ball.backgroundColor = [UIColor whiteColor];
    ball.image = [UIImage imageNamed:@"grenade"];
    ball.layer.cornerRadius = 5;
    [self.view addSubview:ball];
    
    // add ball to balls array
    [self.balls addObject:ball];
    
    // start ball off with a push
    self.pusher = [[UIPushBehavior alloc] initWithItems:self.balls mode:UIPushBehaviorModeInstantaneous];
    
    self.pusher.pushDirection = CGVectorMake(0.02, 0.02);  // two speeds x,y; altering speeds give different direc
    
    self.pusher.active = YES; // because push is instantaneous, it will only happ once
    
    [self.animator addBehavior:self.pusher]; // since animator controls it, have to add pusher to it
    

    
    
}




@end
