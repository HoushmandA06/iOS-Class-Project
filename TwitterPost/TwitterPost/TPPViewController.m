//
//  TPPViewController.m
//  TwitterPost
//
//  Created by Ali Houshmand on 5/20/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "TPPViewController.h"
#import "STTwitter.h"

@interface TPPViewController ()
{
    STTwitterAPI * twitter;
    UITextField * twitterPost;
}

@end

@implementation TPPViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
 
      twitter = [STTwitterAPI twitterAPIOSWithFirstAccount];  // gets first twitter account
        
        //verifies creds
        [twitter verifyCredentialsWithSuccessBlock:^(NSString *username) {
            
            NSLog(@"%@",username);
            
        } errorBlock:^(NSError *error) {
            
            NSLog(@"%@",error.userInfo);
            
        }];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    int w = [UIScreen mainScreen].bounds.size.width;
    int h = [UIScreen mainScreen].bounds.size.height;
    
    twitterPost = [[UITextField alloc] initWithFrame:CGRectMake(20, 40, w-40,h-320)];
    twitterPost.backgroundColor = [UIColor colorWithWhite:.95 alpha:1.0];
    twitterPost.layer.cornerRadius = 10;
    twitterPost.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;

    twitterPost.layer.borderWidth = 2;
    twitterPost.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [self.view addSubview:twitterPost];
    
    UIButton * tweetButton = [[UIButton alloc] initWithFrame:CGRectMake(20, h-240, w-40, 40)];
    tweetButton.backgroundColor = [UIColor colorWithRed:0.208f green:0.710f blue:0.843f alpha:1.0f];
    tweetButton.layer.cornerRadius = 20;
    [tweetButton addTarget:self action:@selector(postTweet) forControlEvents:UIControlEventTouchUpInside];
    [tweetButton setTitle:@"Tweet" forState:UIControlStateNormal];
    [self.view addSubview:tweetButton];
    
    // Do any additional setup after loading the view.
}

-(void)postTweet
{
    [twitter postStatusUpdate:twitterPost.text inReplyToStatusID:nil latitude:nil longitude:nil placeID:nil displayCoordinates:nil trimUser:nil successBlock:^(NSDictionary *status) {
        NSLog(@"%@", status);
    } errorBlock:^(NSError *error) {
        NSLog(@"%@",error.userInfo);
        
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
