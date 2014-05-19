//
//  STSScreenThreeVC.m
//  STATUS
//
//  Created by Ali Houshmand on 5/19/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "STSScreenThreeVC.h"

@interface STSScreenThreeVC ()

@end

@implementation STSScreenThreeVC
{
    
    UIButton * thirdCheck;

    
}

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
    
    thirdCheck = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH/2)-32, SCREEN_HEIGHT-80, 64, 40)];
    [thirdCheck setImage:[UIImage imageNamed:@"check.png"] forState:UIControlStateNormal];
 //   [thirdCheck addTarget:self action:@selector(goToScreenThree) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:thirdCheck];
    [self.navigationController setNavigationBarHidden:NO];



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