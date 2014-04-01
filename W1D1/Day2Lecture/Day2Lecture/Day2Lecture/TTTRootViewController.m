//
//  TTTRootViewController.m
//  Day2Lecture
//
//  Created by Ali Houshmand on 4/1/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "TTTRootViewController.h"

@interface TTTRootViewController ()

@end

@implementation TTTRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *str = @"My name is Ali";
    
    NSLog (@"%@", str);
    
    NSString *myname = str;
    
    NSLog (@"%@",myname);
    
    str = @"The color is yellow";
    
    NSLog(@"%@", str);
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    CGRect rect = CGRectMake(30, 30, 160, 200);
    
    UIView *redView = [[UIView alloc] initWithFrame:rect];
    
    redView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:redView];
    
    
    
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
