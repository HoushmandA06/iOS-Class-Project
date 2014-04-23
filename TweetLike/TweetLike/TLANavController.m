//
//  TLANavController.m
//  TweetLike
//
//  Created by Ali Houshmand on 4/23/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "TLANavController.h"

@interface TLANavController ()

@end

@implementation TLANavController
{
    UIButton * addNewItem;
    
    UIView * blueBox;
    
    
}

-(id)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super initWithRootViewController:rootViewController];
    if (self)
    {

//    self.navigationBar.barTintColor = [UIColor colorWithRed:0.216f green:0.533f blue:0.984f alpha:1.0];
//    self.navigationBar.translucent = NO;
   
    blueBox = [[UIView alloc] initWithFrame:self.navigationBar.frame];
    blueBox.backgroundColor = [UIColor colorWithRed:0.216f green:0.533f blue:0.984f alpha:1.0];
    [self.navigationBar addSubview:blueBox];
        
    addNewItem = [[UIButton alloc] initWithFrame:CGRectMake(80,(self.navigationBar.frame.size.height-30)/2, 160, 30)];
    addNewItem.backgroundColor = [UIColor whiteColor];
    addNewItem.layer.cornerRadius = 15;
    [addNewItem addTarget:self action:@selector(newItem:) forControlEvents:UIControlEventTouchUpInside];
    [addNewItem setTitle:@"Add New" forState:UIControlStateNormal];
    [addNewItem setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.navigationBar addSubview:addNewItem];
    NSLog(@"clicked");
        
       
        
    }
    return self;
}



-(void)newItem:(UIButton *)sender;
{
    [UIView animateWithDuration:0.4 animations: ^{
        blueBox.frame = self.view.frame;
    }];
  
    //  addNewItem.alpha = 0.0;
    
    
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
