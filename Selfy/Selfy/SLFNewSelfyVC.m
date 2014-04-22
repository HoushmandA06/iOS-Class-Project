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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    
    self.view.backgroundColor = [UIColor blackColor];
        
    UITextView * newCaption = [[UITextView alloc] initWithFrame:CGRectMake(40,40,240,100)];
    newCaption.backgroundColor = [UIColor lightGrayColor];
    newCaption.layer.cornerRadius = 6;
    [self.view addSubview:newCaption];
    newCaption.delegate = self; 
        
    UIButton * submitNew = [[UIButton alloc] initWithFrame:CGRectMake(40, 150, 100, 40)];
    //[submitNew setImage:[UIImage imageNamed:@"image.png"] forState:UIControlStateNormal];
    submitNew.backgroundColor = [UIColor greenColor];
    [submitNew setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        
    [submitNew setTitle:@"Submit" forState:UIControlStateNormal];
    submitNew.layer.cornerRadius = 6;
        
    //[newImage addTarget:self action:@selector(newSelfy) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:submitNew];
        
    UIButton * cancelNew = [[UIButton alloc] initWithFrame:CGRectMake(180, 150, 100, 40)];
   // [cancelNew setImage:[UIImage imageNamed:@"image.png"] forState:UIControlStateNormal];
    cancelNew.backgroundColor = [UIColor redColor];
    [cancelNew setTitle:@"Cancel" forState:UIControlStateNormal];
    [cancelNew setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];


    cancelNew.layer.cornerRadius = 6;
    //[newImage addTarget:self action:@selector(newSelfy) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancelNew];
    
    UIImageView * newImageFrame = [[UIImageView alloc] initWithFrame:CGRectMake(60,200,200,200)];
    newImageFrame.layer.cornerRadius = 6;
    newImageFrame.contentMode = UIViewContentModeCenter;
    newImageFrame.backgroundColor = [UIColor lightGrayColor];  //[UIColor colorWithWhite:0.7 alpha:1.0];
    newImageFrame.image = [UIImage imageNamed:@"image"];
    [self.view addSubview:newImageFrame];


    }
    return self;
}



- (BOOL) textView: (UITextView*) textView shouldChangeTextInRange: (NSRange) range
  replacementText: (NSString*) text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
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
