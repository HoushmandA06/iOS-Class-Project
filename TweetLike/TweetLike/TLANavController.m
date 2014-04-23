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
    
}

-(id)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super initWithRootViewController:rootViewController];
    if (self)
    {

        
//   ((TLATableViewController *)rootViewController).tweetItems addObject:@
        
//   self.navigationBar.barTintColor = [UIColor colorWithRed:0.216f green:0.533f blue:0.984f alpha:1.0];
//   self.navigationBar.translucent = NO;
   
        
    blueBox = [[UIView alloc] initWithFrame:self.navigationBar.frame];
    blueBox.backgroundColor = [UIColor colorWithRed:0.216f green:0.533f blue:0.984f alpha:1.0];
    [self.view addSubview:blueBox];
        
    newForm = [[UIView alloc] initWithFrame:self.navigationBar.frame];
    newForm.backgroundColor = [UIColor clearColor];
    [blueBox addSubview:newForm];
        
    addNewItem = [[UIButton alloc] initWithFrame:CGRectMake(80,(self.navigationBar.frame.size.height-30)/2, 160, 30)];
    addNewItem.backgroundColor = [UIColor whiteColor];
    addNewItem.layer.cornerRadius = 15;
    [addNewItem addTarget:self action:@selector(newItem:) forControlEvents:UIControlEventTouchUpInside];
    [addNewItem setTitle:@"Add New" forState:UIControlStateNormal];
    [addNewItem setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [blueBox addSubview:addNewItem];   //self.navigationBar
    NSLog(@"clicked");
    
    logo = [[UIImageView alloc] initWithFrame:CGRectMake(100,120,110,40)];
    logo.image = [UIImage imageNamed:@"logo"];
       
    newCaption = [[UITextView alloc] initWithFrame:CGRectMake(40,170,240,100)];
    newCaption.backgroundColor = [UIColor colorWithWhite:0.90 alpha:1.0];
    newCaption.layer.cornerRadius = 6;
    newCaption.keyboardType = UIKeyboardTypeTwitter;
    [newCaption.layer setBorderColor: [[UIColor lightGrayColor] CGColor]];
    [newCaption.layer setBorderWidth: 2.0];
    newCaption.delegate = self;
   
    submit = [[UIButton alloc] initWithFrame:CGRectMake(40, 280, 100, 30)];
    submit.backgroundColor = [UIColor greenColor];
    [submit setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [submit setTitle:@"Submit" forState:UIControlStateNormal];
    submit.layer.cornerRadius = 15;
    //[submit addTarget:self action:@selector(newSelfy) forControlEvents:UIControlEventTouchUpInside];
        
    cancel = [[UIButton alloc] initWithFrame:CGRectMake(180, 280, 100, 30)];
    cancel.backgroundColor = [UIColor redColor];
    [cancel setTitle:@"Cancel" forState:UIControlStateNormal];
    [cancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    cancel.layer.cornerRadius = 15;
    cancel.tag = 0;
    [cancel addTarget:self action:@selector(removeBlueBox:) forControlEvents:UIControlEventTouchUpInside];
        
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapScreen)]; //added this to get rid of keyboard with a touch on frame outside of the above items
    
    [self.view addGestureRecognizer:tap];
        
    }
    return self;
}


-(void)removeBlueBox:(UIButton *)sender;
{
  
    [UIView animateWithDuration:0.4 animations: ^{
        [newForm removeFromSuperview];
        blueBox.frame = self.navigationBar.frame;
    } completion:^(BOOL finished) {
        [super viewDidLoad];
            addNewItem.alpha = 1.0;
        
     }];
    

    
}



-(void)newItem:(UIButton *)sender;
{
    [UIView animateWithDuration:0.4 animations: ^{
        blueBox.frame = self.view.frame;
    } completion:^(BOOL finished) {
      
    [newForm addSubview:logo]; // move these back to init
    [newForm addSubview:newCaption];
    [newForm addSubview:submit];
    [newForm addSubview:cancel];
    NSLog(@"button %i clicked", sender.tag);
        
        // replace with adding bluebox addsubview new form
        
    }];
  
    addNewItem.alpha = 0.0;
}


- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    [UIView animateWithDuration:0.2 animations:^{
        newForm.frame = CGRectMake(0,-100, 320, self.view.frame.size.height);
     }];
    return YES;
}

-(void)tapScreen // moves frame back down, removes keyboard
{
    [newCaption resignFirstResponder];
    [UIView animateWithDuration:0.2 animations:^{
         newForm.frame = CGRectMake(0,0,320, self.view.frame.size.height);
    }];
}

-(void)textViewDidBeginEditing:(UITextView *)textView  //moves new frame up as keyboard appears.
{
    [UIView animateWithDuration:0.2 animations:^{
         newForm.frame = CGRectMake(0, -100, 320, self.view.frame.size.height);
    }];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
