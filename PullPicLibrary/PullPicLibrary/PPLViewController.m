//
//  PPLViewController.m
//  PullPicLibrary
//
//  Created by Ali Houshmand on 4/30/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "PPLViewController.h"
#import "PPLFilterController.h"
#import "BlurViewController.h"
#import "HSBColorControlVC.h"
#import "ControlsViewController.h"

@interface PPLViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate,PPLFilterControllerDelegate, HSBColorControlVCDelegate, ControlsViewControllerDelegate, BlurViewControllerDelegate>


@property (nonatomic) UIImage * originalImage;  // here so we can put setter / getter

@end

@implementation PPLViewController
{
    UIButton * pullPic;

    PPLFilterController * filterVC;
    BlurViewController * blurVC;
    HSBColorControlVC * hsbVC;
    ControlsViewController * controlsVC;
    
    UIView * viewAboveScroll;
    
    
    CIContext *context;
    CIFilter *filterSepia;
    CIImage *beginImage;
    
    NSMutableArray * filters;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        self.view.backgroundColor = [UIColor blackColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.picFrame = [[UIImageView alloc] initWithFrame:CGRectMake(0, 55, SCREEN_WIDTH, 280)];
    self.picFrame.backgroundColor = [UIColor colorWithWhite:.88 alpha:1.0];
    self.picFrame.contentMode = UIViewContentModeScaleToFill;   //// **** SCALING *****
    self.picFrame.clipsToBounds = YES;
//  [self.picFrame.layer setBorderColor:[[UIColor blackColor] CGColor]];
//  [self.picFrame.layer setBorderWidth: 1.0];
    [self.view addSubview:self.picFrame];
    
    UIView * navBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
    navBar.backgroundColor = [UIColor blackColor];
    [self.view addSubview:navBar];
    
    filterVC = [[PPLFilterController alloc] initWithNibName:nil bundle:nil];  // *** filterViewController ***
    filterVC.delegate = self;
    filterVC.view.frame = CGRectMake(0, SCREEN_HEIGHT - 100, SCREEN_WIDTH, 100);
    // [self.view addSubview:filterVC.view]; //will need to put in button
    
    hsbVC = [[HSBColorControlVC alloc] initWithNibName:nil bundle:nil];
    hsbVC.delegate = self;
    hsbVC.view.frame = CGRectMake(0,SCREEN_HEIGHT-100, SCREEN_WIDTH, 100);
    
    blurVC = [[BlurViewController alloc] initWithNibName:nil bundle:nil];
    blurVC.delegate = self;
    blurVC.view.frame = CGRectMake(0, SCREEN_HEIGHT-100, SCREEN_WIDTH, 100);

    
    viewAboveScroll = [[UIView alloc] initWithFrame:CGRectMake(0,SCREEN_HEIGHT-140, SCREEN_WIDTH, 40)];
    viewAboveScroll.backgroundColor = [UIColor clearColor];
    [self.view addSubview:viewAboveScroll];
    
    controlsVC = [[ControlsViewController alloc] initWithNibName:nil bundle:nil];
    controlsVC.delegate = self;
    controlsVC.view.backgroundColor = [UIColor whiteColor];
    [viewAboveScroll addSubview:controlsVC.view];
    
    
    pullPic = [[UIButton alloc] initWithFrame:CGRectMake(100, 10, 120, 30)];
    pullPic.layer.cornerRadius = 15;
    pullPic.backgroundColor = BLUE_COLOR;
    [pullPic setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [pullPic setTitle: @"Pull Photo" forState: UIControlStateNormal];
    [pullPic addTarget:self action:@selector(getPhoto:) forControlEvents:UIControlEventTouchUpInside];
    [navBar addSubview:pullPic];
    
    ///////// ***** gradient code for button ***** 102,102,102,51,51,51
    CAGradientLayer *btnGradient = [CAGradientLayer layer];
    btnGradient.frame = pullPic.bounds;
    btnGradient.colors = [NSArray arrayWithObjects:
                          (id)[[UIColor colorWithRed:125.0f / 255.0f green:189.0f / 255.0f blue:255.0f / 255.0f alpha:1.0f] CGColor],
                          (id)[[UIColor colorWithRed:51.0f / 255.0f green:51.0f / 255.0f blue:51.0f / 255.0f alpha:1.0f] CGColor],
                          nil];
    [pullPic.layer insertSublayer:btnGradient atIndex:0];
    CALayer *btnLayer = [pullPic layer];
    [btnLayer setMasksToBounds:YES];
    [btnLayer setCornerRadius:5.0f];
    
    
    
 
    
}



-(void)updateCurrentImageWithFilteredImage:(UIImage *)image
{
    self.picFrame.image = image;
    blurVC.imageToFilter = image;
    hsbVC.currentImage = image;
}


- (void)viewDidAppear:(BOOL)animated
{
    
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
    
//    NSLog(@"%@", info[UIImagePickerControllerOriginalImage]);
//    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];  // requires the allowsEditing prop = yes on picker
//    beginImage = [CIImage imageWithCGImage:chosenImage.CGImage];
// CIImage * beginImage = [[CIImage alloc] initWithCGImage:chosenImage.CGImage]; could do it this way if using local var
//    filterSepia = [CIFilter filterWithName:@"CISepiaTone"
//                       keysAndValues: kCIInputImageKey, beginImage,@"inputIntensity", @0.8, nil];
//    CIImage *outputImage = [filterSepia outputImage];
//    UIImage *newImage = [UIImage imageWithCIImage:outputImage];
//    self.picFrame.image = newImage;
    
    
    self.originalImage = info[UIImagePickerControllerOriginalImage];
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

-(void)setOriginalImage:(UIImage *)originalImage
{
    
    _originalImage = originalImage;
    
    filterVC.imageToFilter = originalImage;
    
    blurVC.imageToFilter = originalImage;
    
    hsbVC.currentImage = originalImage;
    
    self.picFrame.image = originalImage;
    
}

-(void) selectFilter;
{
    
    [blurVC.view removeFromSuperview];
    [hsbVC.view removeFromSuperview];
    [self.view addSubview:filterVC.view];
}

-(void) selectHsb;
{
    [blurVC.view removeFromSuperview];
    [filterVC.view removeFromSuperview];
    [self.view addSubview:hsbVC.view];
    
}

-(void) selectBlur;
{
    [hsbVC.view removeFromSuperview];
    [filterVC.view removeFromSuperview];
    [self.view addSubview:blurVC.view];
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}


- (BOOL)prefersStatusBarHidden
{
    return YES;
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
