//
//  TLANavController.m
//  TweetLike
//
//  Created by Ali Houshmand on 4/23/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "TLANavController.h"

#import "TLATableViewController.h"

@interface TLANavController ()

@end

@implementation TLANavController
{
    UIButton * addNewItem;
    UIView * newForm;
    UIView * blueBox;
    
    UITextView * newCaption;
    UIButton * submit;
    UIButton * cancel;
    UIImageView * logo;
    
    TLATableViewController * TVC;
    
}

//-(id)initWithRootViewController:(UIViewController *)rootViewController
//{
//    self = [super initWithRootViewController:rootViewController];
//    if (self)
//    {
//        
//        //   ((TLATableViewController *)rootViewController).tweetItems addObject:@
//        
//        //   self.navigationBar.barTintColor = [UIColor colorWithRed:0.216f green:0.533f blue:0.984f alpha:1.0];
//        //   self.navigationBar.translucent = NO;
//        
////       self.navigationBar.backgroundColor = [UIColor greenColor];
//        
//       
//        
//    }
//    return self;
//}

// Make the blue box go away (i.e. slide back up to minimum size)
-(void)cancelTweet;
{
   
    [newForm removeFromSuperview];
    newForm.frame = self.view.frame;
    [UIView animateWithDuration:0.4 animations: ^{
               blueBox.frame = self.navigationBar.frame;
    } completion:^(BOOL finished) {
        [super viewDidLoad];
        addNewItem.alpha = 1.0;
    }];
}


-(void)saveTweet;
{
    if ([newCaption.text isEqualToString:@""]) return;
    
    [TVC createNewTweet:newCaption.text];  // created createnewtweet method in TableViewController
    
    newCaption.text = @"";
    
    [self cancelTweet];
}


// Make the blue box grow (i.e slide down to full screen size)
// and then also show all our 'newForm' elements (newTweet textView + submit + cancel)
-(void)newItem:(UIButton *)sender;
{
    [UIView animateWithDuration:0.4 animations: ^{
        blueBox.frame = self.view.frame;
    } completion:^(BOOL finished) {
        [blueBox addSubview:newForm]; // this is what adds newForm to my screen when i hit addNewItem button
        NSLog(@"button %i clicked", sender.tag);
    }];
    addNewItem.alpha = 0.0;
}

-(void)textViewDidBeginEditing:(UITextView *)textView  //moves new frame up as keyboard appears.
{
    NSLog(@"void one");
    [UIView animateWithDuration:0.4 animations:^{
        newForm.frame = CGRectMake(0, -100, 320, self.view.frame.size.height);
    }];
}

-(void)tapScreen // moves frame back down, removes keyboard
{
    NSLog(@"tapped");
    [newCaption resignFirstResponder];
    [UIView animateWithDuration:0.2 animations:^{
        newForm.frame = CGRectMake(0,0,320, self.view.frame.size.height);
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    blueBox = [[UIView alloc] initWithFrame:self.navigationBar.frame];
    blueBox.backgroundColor = [UIColor colorWithRed:0.216f green:0.533f blue:0.984f alpha:1.0];
    [self.view addSubview:blueBox];
    
    newForm = [[UIView alloc] initWithFrame:self.view.frame];
    newForm.backgroundColor = [UIColor clearColor]; //no need to add to subview here, going to do it with a button  --> addNewItem
    
    addNewItem = [[UIButton alloc] initWithFrame:CGRectMake(80,(self.navigationBar.frame.size.height-30)/2, 160, 30)];
    addNewItem.backgroundColor = [UIColor whiteColor];
    addNewItem.layer.cornerRadius = 15;
    [addNewItem addTarget:self action:@selector(newItem:) forControlEvents:UIControlEventTouchUpInside];
    [addNewItem setTitle:@"Add New" forState:UIControlStateNormal];
    [addNewItem setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [addNewItem.layer setBorderColor: [[UIColor blueColor] CGColor]];
    [addNewItem.layer setBorderWidth: 1.0];
    [blueBox addSubview:addNewItem];
    NSLog(@"clicked");
    
    logo = [[UIImageView alloc] initWithFrame:CGRectMake(100,120,110,40)];
    logo.image = [UIImage imageNamed:@"logo"];
    [newForm addSubview:logo];
    
    newCaption = [[UITextView alloc] initWithFrame:CGRectMake(40,170,240,100)];
    newCaption.backgroundColor = [UIColor colorWithWhite:0.90 alpha:1.0];
    newCaption.layer.cornerRadius = 6;
    newCaption.keyboardType = UIKeyboardTypeTwitter;
    [newCaption.layer setBorderColor: [[UIColor lightGrayColor] CGColor]];
    [newCaption.layer setBorderWidth: 2.0];
    newCaption.delegate = self;
    [newForm addSubview:newCaption];
    
    //float newCaptionBottom = newCaption.frame.size.height + newCaption.frame.origin.y;
    submit = [[UIButton alloc] initWithFrame:CGRectMake(40, 280, 100, 30)];
    submit.backgroundColor = [UIColor greenColor];
    [submit setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [submit setTitle:@"Submit" forState:UIControlStateNormal];
    submit.layer.cornerRadius = 15;
    [submit.layer setBorderColor: [[UIColor blueColor] CGColor]];
    [submit.layer setBorderWidth: 1.0];
    [submit addTarget:self action:@selector(saveTweet) forControlEvents:UIControlEventTouchUpInside];
    [newForm addSubview:submit];
    
    
    cancel = [[UIButton alloc] initWithFrame:CGRectMake(180, 280, 100, 30)];
    cancel.backgroundColor = [UIColor redColor];
    [cancel setTitle:@"Cancel" forState:UIControlStateNormal];
    [cancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    cancel.layer.cornerRadius = 15;
    [cancel.layer setBorderColor: [[UIColor blueColor] CGColor]];
    [cancel.layer setBorderWidth: 1.0];
    cancel.tag = 0;
    [cancel addTarget:self action:@selector(cancelTweet) forControlEvents:UIControlEventTouchUpInside];
    [newForm addSubview:cancel];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapScreen)]; //added this to get rid of keyboard with a touch on frame outside of the above items
    [self.view addGestureRecognizer:tap];
    
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//will allow us to remember the tableviewcontroller, even when pushing new view controllers onto nav
-(void)addTableViewController:(TLATableViewController *)viewController
{
    TVC = viewController;
    [self pushViewController:viewController animated:NO];
    
}

//- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
//{
//    NSLog(@"BOOL one");
//    [UIView animateWithDuration:0.4 animations:^{
//        newForm.frame = CGRectMake(0,-216, self.view.frame.size.width, self.view.frame.size.height);
//    }];
//    return YES;
//}


@end
