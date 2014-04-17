//
//  BBALevelController.m
//  BrickBreaker
//
//  Created by Ali Houshmand on 4/17/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "BBALevelController.h"

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
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.bricks = [@ []mutableCopy];
        self.balls = [@ []mutableCopy];
        self.view.backgroundColor = [UIColor colorWithWhite:0.1 alpha:1.0];
        
        paddleWidth = 80;
        
        
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
    
    
    
}

-(void)createPaddle
{
    self.paddle = [[UIView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - paddleWidth)/2, SCREEN_HEIGHT - 20, paddleWidth, 6)];
    self.paddle.backgroundColor = [UIColor colorWithWhite:0.5 alpha:1.0];
    self.paddle.layer.cornerRadius = 3;
    //[paddle setImage:[UIImage imageNamed:@"Delete"] forState:];
    [self.view addSubview:self.paddle];
   
    
    

    
                
    
}

-(void)createBricks
{
    
    
}

-(void)createBall
{
    CGRect frame = self.paddle.frame;  //creating a frame based on the position of the paddle
    
    UIView * ball = [[UIView alloc] initWithFrame:CGRectMake(0,frame.origin.y - 12,10,10)];
    
    
    
    
}




@end
