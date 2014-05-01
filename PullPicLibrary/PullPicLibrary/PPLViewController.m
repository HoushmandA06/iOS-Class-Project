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
    UIButton * squares;
    CGFloat gap;
    
    UIScrollView * scrollview;

    
    CIContext *context;
    CIFilter *filterSepia;
    CIImage *beginImage;
    
    NSArray * filterNames;
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
    

    UIView * viewAboveScroll = [[UIView alloc] initWithFrame:CGRectMake(0,SCREEN_HEIGHT-140, SCREEN_WIDTH, 40)];
    viewAboveScroll.backgroundColor = [UIColor clearColor];
    [self.view addSubview:viewAboveScroll];

    scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT-100, SCREEN_WIDTH, 100)];
    scrollview.backgroundColor = [UIColor darkGrayColor];
    
    int squareCount = 20;
    for(int i = 0; i < squareCount; i++) {
        
        gap = 10;
        CGFloat x = (80+gap) * i;
        squares = [[UIButton alloc] initWithFrame:CGRectMake(x,10,80,80)];
        squares.backgroundColor = [UIColor whiteColor];
        NSString * squareNumber = [@(i+1)stringValue];  //to turn number count into string to be used for labeling
        [squares setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [squares setTitle:squareNumber forState: UIControlStateNormal];  
        [scrollview addSubview:squares];
    }
    scrollview.contentSize = CGSizeMake(squares.frame.size.width*squareCount+squareCount*gap, 100);
    [self.view addSubview:scrollview];
    

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
    
    NSLog(@"%@", info[UIImagePickerControllerOriginalImage]);
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];  // requires the allowsEditing prop = yes on picker
    
    beginImage = [CIImage imageWithCGImage:chosenImage.CGImage];
 // CIImage * beginImage = [[CIImage alloc] initWithCGImage:chosenImage.CGImage]; could do it this way if using local var
    
    filterSepia = [CIFilter filterWithName:@"CISepiaTone"
                       keysAndValues: kCIInputImageKey, beginImage,@"inputIntensity", @0.8, nil];
    
    CIImage *outputImage = [filterSepia outputImage];
    UIImage *newImage = [UIImage imageWithCIImage:outputImage];
    self.picFrame.image = newImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}


/*  for today
-(void)createButtons
{
    
    filterNames = @[
//                    @"CIColorCrossPolynomial",
//                    @"CIColorCube",
//                    @"CIColorCubeWithColorSpace",
                    @"CIColorInvert",
//                    @"CIColorMap",
                    @"CIColorMonochrome",
                    @"CIColorPosterize",
                    @"CIFalseColor",
//                    @"CIMaskToAlpha",
                    @"CIMaximumComponent",
                    @"CIMinimumComponent",
                    @"CIPhotoEffectChrome",
                    @"CIPhotoEffectFade",
                    @"CIPhotoEffectInstant",
                    @"CIPhotoEffectMono",
                    @"CIPhotoEffectNoir",
                    @"CIPhotoEffectProcess",
                    @"CIPhotoEffectTonal",
                    @"CIPhotoEffectTransfer",
                    @"CISepiaTone",
                    @"CIVignette",
//                    @"CIVignetteEffect"
                    ];
    
    filters = [@[]mutableCopy];
    
    for (NSString * name in filterNames)
    {
        NSInteger index = [filterNames indexOfObject:name];
        UIButton * filterbuttons = [[UIButton alloc] initWithFrame:CGRectMake(index * 10,10,80,80)];
        filterbuttons.backgroundColor = [UIColor whiteColor];
        
        [filters addObject:filterbuttons];
        
        [scrollview addSubview:filterbuttons];
        
    }
    
}
*/


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
