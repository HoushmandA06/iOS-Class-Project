//
//  SLFNewSelfyVC.m
//  Selfy
//
//  Created by Ali Houshmand on 4/22/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "SLFNewSelfyVC.h"

@interface SLFNewSelfyVC ()

@end

@implementation SLFNewSelfyVC
{
    UITextView * newCaption;
    
    UIView *newForm;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    
    newForm = [[UIView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:newForm];
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
        
    newCaption = [[UITextView alloc] initWithFrame:CGRectMake(40,260,240,80)];
    newCaption.backgroundColor = [UIColor lightGrayColor];
    newCaption.layer.cornerRadius = 6;
    newCaption.delegate = self;
    newCaption.keyboardType = UIKeyboardTypeTwitter;
    [newForm addSubview:newCaption];
        
    UIButton * submitNew = [[UIButton alloc] initWithFrame:CGRectMake(40, 360, 100, 40)];
    submitNew.backgroundColor = [UIColor colorWithRed:0.137f green:0.682f blue:1.000f alpha:1.0f];
    [submitNew setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [submitNew setTitle:@"Submit" forState:UIControlStateNormal];
    submitNew.layer.cornerRadius = 6;
    //[newImage addTarget:self action:@selector(newSelfy) forControlEvents:UIControlEventTouchUpInside];
    [newForm addSubview:submitNew];
        
        
    UIButton * cancelNew = [[UIButton alloc] initWithFrame:CGRectMake(180, 360, 100, 40)];
    cancelNew.backgroundColor = [UIColor colorWithRed:1.000f green:0.486f blue:0.486f alpha:1.0f];
    [cancelNew setTitle:@"Cancel" forState:UIControlStateNormal];
    [cancelNew setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    cancelNew.layer.cornerRadius = 6;
    //[newImage addTarget:self action:@selector(newSelfy) forControlEvents:UIControlEventTouchUpInside];
    [newForm addSubview:cancelNew];
        
        
    UIImageView * newImageFrame = [[UIImageView alloc] initWithFrame:CGRectMake(60,40,200,200)];
    newImageFrame.layer.cornerRadius = 6;
    newImageFrame.contentMode = UIViewContentModeCenter;
    newImageFrame.backgroundColor = [UIColor lightGrayColor];
    newImageFrame.image = [UIImage imageNamed:@"image"];
    [newForm addSubview:newImageFrame];

    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapScreen)]; //added this to get rid of keyboard with a touch on frame outside of the above items
    [self.view addGestureRecognizer:tap];
        
    }
    return self;
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    [UIView animateWithDuration:0.2 animations:^{
        newForm.frame = CGRectMake(0,-KB_HEIGHT, 320, self.view.frame.size.height);
        
    }];
    return YES;
}



-(void)tapScreen
{
    [newCaption resignFirstResponder];
    
    [UIView animateWithDuration:0.2 animations:^{
        newForm.frame = CGRectMake(0,0, 320, self.view.frame.size.height);
        
    }];
    
}

-(void)newSelfy
{

}


-(void)textViewDidBeginEditing:(UITextView *)textView
{
    [UIView animateWithDuration:0.2 animations:^{
        newForm.frame = CGRectMake(0,-KB_HEIGHT, 320, self.view.frame.size.height);
        
    }];
    
}


//- (BOOL) textView: (UITextView*) textView shouldChangeTextInRange: (NSRange) range   // had this to remove UITextView, are using dif way
//  replacementText: (NSString*) text
//{
//    if ([text isEqualToString:@"\n"]) {
//        [textView resignFirstResponder];
//        return NO;
//    }
//    return YES;
//}



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