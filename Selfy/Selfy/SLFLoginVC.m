//
//  SLFLoginVC.m
//  Selfy
//
//  Created by Ali Houshmand on 4/22/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "SLFLoginVC.h"
#import <Parse/Parse.h>


@interface SLFLoginVC ()

@end

@implementation SLFLoginVC
{
    UITextField * nameField;
    UITextField * pwField;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        self.view.backgroundColor = [UIColor orangeColor];
        
        nameField = [[UITextField alloc] initWithFrame:CGRectMake(40,100,240,40)];
        nameField.backgroundColor = [UIColor lightGrayColor];
        nameField.layer.cornerRadius = 10;
        nameField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0,0,10,30)]; // puts the cursor a set amt right of the textfield
        nameField.leftViewMode = UITextFieldViewModeAlways;
        nameField.placeholder = @"Enter username";
        [self.view addSubview:nameField];
        [nameField resignFirstResponder]; //this is what makes keyboard go away
        nameField.delegate = self;
        
        pwField = [[UITextField alloc] initWithFrame:CGRectMake(40,160,240,40)];
        pwField.backgroundColor = [UIColor lightGrayColor];
        pwField.layer.cornerRadius = 10;
        pwField.secureTextEntry = YES;
        pwField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0,0,10,30)]; // puts the cursor a set amt right of the textfield
        pwField.leftViewMode = UITextFieldViewModeAlways;
        pwField.placeholder = @"Enter password";
        [self.view addSubview:pwField];
        [pwField resignFirstResponder];
        pwField.delegate = self;
        
        //will need to resign first reponder for keyboard to go away, DO THIS LATER
        
        UIButton * submit = [[UIButton alloc] initWithFrame:CGRectMake(40, 210, 40, 40)];
        [submit setImage:[UIImage imageNamed:@"newuser.png"] forState:UIControlStateNormal];
        submit.backgroundColor = [UIColor clearColor];
        submit.layer.cornerRadius = 20;
        [submit addTarget:self action:@selector(newUser) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:submit];
  

//        PFUser * user = [PFUser currentUser];
//        user.username = @"ali houshmand";
//        user.password = @"password";
//        [user saveInBackground];
        
    }
    return self;
}

- (void)newUser // this will collect info from button
{
    
    PFUser * user = [PFUser currentUser];
    user.username = nameField.text;
    user.password = pwField.text;
    [user saveInBackground];
    
    NSLog(@"clicking");
    NSLog(@"%@ : %@",nameField.text,pwField.text);
    
    [nameField resignFirstResponder];
    [pwField resignFirstResponder];
    

}



- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
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
