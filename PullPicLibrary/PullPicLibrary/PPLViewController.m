//
//  PPLViewController.m
//  PullPicLibrary
//
//  Created by Ali Houshmand on 4/30/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "PPLViewController.h"

@interface PPLViewController ()

@end

@implementation PPLViewController
{
    UIButton * pullPic;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        self.view.backgroundColor = [UIColor colorWithWhite:.95 alpha:1.0];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    pullPic = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 220, 40)];
    pullPic.layer.cornerRadius = 20;
    pullPic.backgroundColor = BLUE_COLOR;
    [pullPic setTitle: @"Pull Pic" forState: UIControlStateNormal];
    [pullPic addTarget:self action:@selector(getPhoto:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pullPic];
    
    self.picFrame = [[UIImageView alloc] initWithFrame:CGRectMake(50, 125, 220, 220)];
    self.picFrame.backgroundColor = [UIColor colorWithWhite:.90 alpha:1.0];
    self.picFrame.layer.cornerRadius =  20;
    self.picFrame.contentMode = UIViewContentModeScaleToFill;
    self.picFrame.clipsToBounds = YES;
    
    [self.picFrame.layer setBorderColor:[[UIColor lightGrayColor] CGColor]];
    [self.picFrame.layer setBorderWidth: 2.0];
    [self.view addSubview:self.picFrame];
    
//    UIView * navBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
//    navBar.backgroundColor = BLUE_COLOR;
//    [self.view addSubview:navBar];
    
    
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
 

}


/// method for pulling pick from library

-(IBAction)getPhoto:(id) sender {
   
    UIImagePickerController * picker = [[UIImagePickerController alloc] init];
    
    picker.delegate = self;
    picker.allowsEditing = YES;
    
    
    if((UIButton *) sender == pullPic) {
        picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    } else {
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    
    NSLog(@"%@clicked",pullPic);
    
    [self presentViewController:picker animated:YES completion:NULL];

}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info

{
    
    NSLog(@"%@", info[UIImagePickerControllerOriginalImage]);
    
    //UIImage *chosenImage = info[UIImagePickerControllerOriginalImage];
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.picFrame.image = chosenImage;

    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
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
