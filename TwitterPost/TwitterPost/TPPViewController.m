//
//  TPPViewController.m
//  TwitterPost
//
//  Created by Ali Houshmand on 5/20/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "TPPViewController.h"
#import "STTwitter.h"

//// MAP STUFF
#import "MAPAnnotation.h"
#import <CoreLocation/CoreLocation.h>


@interface TPPViewController () <CLLocationManagerDelegate,UITextFieldDelegate>
{
    STTwitterAPI * twitter;
    UITextField * twitterPost;
    
    float lat;
    float longt;
    
    //// Location
    CLLocationManager * lManager;

    
}

@end

@implementation TPPViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
 
        
        //// LOCATION MANAGER
        lManager = [[CLLocationManager alloc] init];
        lManager.delegate = self;
        lManager.distanceFilter = 20;
        lManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
        
        [lManager startUpdatingLocation];
        
        
        
      twitter = [STTwitterAPI twitterAPIOSWithFirstAccount];  // gets first twitter account
        
        //verifies creds
        [twitter verifyCredentialsWithSuccessBlock:^(NSString *username) {
            
            NSLog(@"%@",username);
            
        } errorBlock:^(NSError *error) {
            
            NSLog(@"%@",error.userInfo);
            
        }];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    int w = [UIScreen mainScreen].bounds.size.width;
    int h = [UIScreen mainScreen].bounds.size.height;
    
    
//    UITextView * textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 200, 100, 100)];
//    textView.contentInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    twitterPost = [[UITextField alloc] initWithFrame:CGRectMake(20, 40, w-40,40)];
    twitterPost.backgroundColor = [UIColor colorWithWhite:.95 alpha:1.0];
    twitterPost.layer.cornerRadius = 10;
    twitterPost.placeholder = @"enter Tweet";
    
    twitterPost.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
     twitterPost.textColor = [UIColor blueColor];
  
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, h-320)];
    twitterPost.leftView = paddingView;
    twitterPost.leftViewMode = UITextFieldViewModeAlways;
    
    twitterPost.delegate = self;
    twitterPost.layer.borderWidth = 1;
    twitterPost.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [self.view addSubview:twitterPost];
    
    UIButton * tweetButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 100, w-40, 40)];
    tweetButton.backgroundColor = [UIColor colorWithRed:0.208f green:0.710f blue:0.843f alpha:1.0f];
    tweetButton.layer.cornerRadius = 20;
    [tweetButton addTarget:self action:@selector(postTweet) forControlEvents:UIControlEventTouchUpInside];
    [tweetButton setTitle:@"Tweet" forState:UIControlStateNormal];
    [self.view addSubview:tweetButton];
    
 }

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    for (CLLocation * location in locations)
    {
        
        NSLog(@"%@", location);
 
        CLGeocoder * geoCoder = [[CLGeocoder alloc] init];
        [geoCoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
            NSLog(@"%@", placemarks);
            
            lat = location.coordinate.latitude;
            longt = location.coordinate.longitude;
            
//            
//            for (CLPlacemark * placemark in placemarks) {
//                NSLog(@"%@", placemark);
//                NSString * cityState = [NSString stringWithFormat:@"%@,%@",placemark.addressDictionary[@"City"],placemark.addressDictionary[@"State"]];
//                
//                
//                
//                [annotation setTitle:cityState];
//                [annotation setSubtitle:placemark.country];
//            }
        }];
        //  [mapView selectAnnotation:annotation animated:YES];  // makes annotation pop up auto
    }
    // [lManager stopUpdatingLocation];
}


-(void)postTweet
{
 
    NSString * latitude = [NSString stringWithFormat:@"%f",lat];
    NSString * longitude = [NSString stringWithFormat:@"%f",longt];
    
    [twitter postStatusUpdate:twitterPost.text inReplyToStatusID:nil latitude:latitude longitude:longitude placeID:nil displayCoordinates:nil trimUser:nil successBlock:^(NSDictionary *status) {
        
        UIAlertView * alertView = [[UIAlertView alloc]
                                   initWithTitle: @"Success" message:@"Tweet Sent Successfully!" delegate: self
                                   cancelButtonTitle: @"Done" otherButtonTitles:nil];
        [alertView show];
        
        NSLog(@"%@", status);
    } errorBlock:^(NSError *error) {
        NSLog(@"%@",error.userInfo);
        
    }];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField   //now any textField will allow resign keyboard
{
    [textField resignFirstResponder];
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
