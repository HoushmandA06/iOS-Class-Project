//
//  STSScreenThreeVC.m
//  STATUS
//
//  Created by Ali Houshmand on 5/19/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "STSScreenThreeVC.h"
#import "STSScreenOneVC.h"
#import "STSScreenTwoVC.h"
#import "STTwitter.h"
#import "STSSingleton.h"


////
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MAPAnnotation.h"



@interface STSScreenThreeVC () <CLLocationManagerDelegate, MKMapViewDelegate>

@end

@implementation STSScreenThreeVC
{
    UIButton * thirdCheck;
    UIImageView * bigSmile;
    UIButton * facebook;
    UIButton * googleplus;
    UIButton * twitter;
    
    UIButton * back;
    
    
    UITextField * tweetField;
    
    NSArray * bigYellowSmiles;
    STTwitterAPI * twitterAPI;
    
    ///// MAP STUFF
    
    CLLocationManager * lManager; // has an array of locations
    MKMapView * myMapView;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
   
        bigYellowSmiles = @[@"yellow_1",@"yellow_2",@"yellow_3",@"yellow_4",@"yellow_5",@"yellow_6",@"yellow_7",@"yellow_8",@"yellow_9"];
        
        bigSmile = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-(72+176),SCREEN_HEIGHT-(192+176),176,176)];
        bigSmile.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:bigSmile];
        
        twitter = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-(72+176), SCREEN_HEIGHT-(292+176), 48,48)];
        [twitter setImage:[UIImage imageNamed:@"sm_twitter_g"] forState:UIControlStateNormal];
        [twitter setImage:[UIImage imageNamed:@"sm_twitter"] forState:UIControlStateSelected];
        [twitter addTarget:self action:@selector(buttonSelected:) forControlEvents:UIControlEventTouchUpInside];
        [twitter setTag:1];
        [self.view addSubview:twitter];
        
        googleplus = [[UIButton alloc] initWithFrame:CGRectMake(twitter.frame.origin.x +48+16, SCREEN_HEIGHT-(292+176), 48,48)];
        [googleplus setImage:[UIImage imageNamed:@"sm_google_g"] forState:UIControlStateNormal];
        [googleplus setImage:[UIImage imageNamed:@"sm_google"] forState:UIControlStateSelected];
        [googleplus addTarget:self action:@selector(buttonSelected:) forControlEvents:UIControlEventTouchUpInside];
        [googleplus setTag:2];
        [self.view addSubview:googleplus];
        
        facebook = [[UIButton alloc] initWithFrame:CGRectMake(googleplus.frame.origin.x +48+16, SCREEN_HEIGHT-(292+176), 48,48)];
        [facebook setImage:[UIImage imageNamed:@"sm_facebook_g"] forState:UIControlStateNormal];
        [facebook setImage:[UIImage imageNamed:@"sm_facebook"] forState:UIControlStateSelected];
        [facebook addTarget:self action:@selector(buttonSelected:) forControlEvents:UIControlEventTouchUpInside];
        [facebook setTag:3];
        [self.view addSubview:facebook];
        
        //// LOCATION MANAGER
        lManager = [[CLLocationManager alloc] init];
        lManager.delegate = self;
        lManager.distanceFilter = 20;
        lManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
        
        [lManager startUpdatingLocation];

        

    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    thirdCheck = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH/2)+24, SCREEN_HEIGHT-80, 56, 32)];
    [thirdCheck setImage:[UIImage imageNamed:@"check.png"] forState:UIControlStateNormal];
    [thirdCheck addTarget:self action:@selector(buttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:thirdCheck];
    
    tweetField = [[UITextField alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-(72+176),bigSmile.frame.origin.y-30,176,20)];
    tweetField.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
    tweetField.delegate = self;
    [self.view addSubview:tweetField];
    
    back = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH/2)-64, SCREEN_HEIGHT-(80), 32, 40)];
    [back setImage:[UIImage imageNamed:@"arrow.png"] forState:UIControlStateNormal];
    [back addTarget:self action:@selector(goToScreenTwo) forControlEvents:UIControlEventTouchUpInside];
    back.transform = CGAffineTransformMakeScale(-1.0, 1.0);
    [self.view addSubview:back];
    [self.navigationController setNavigationBarHidden:YES];
    

    twitterAPI = [STTwitterAPI twitterAPIOSWithFirstAccount];
    
    [twitterAPI verifyCredentialsWithSuccessBlock:^(NSString *username) {
        
        NSLog(@"%@",username);
        
    } errorBlock:^(NSError *error) {
        
        NSLog(@"%@",error.userInfo);
        
    }];
}


-(void)goToScreenTwo
{
    [self.navigationController popViewControllerAnimated:NO];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField   //now any textField will allow resign keyboard
{
    [textField resignFirstResponder];
    return YES;
}

-(void)viewWillLayoutSubviews
{
    
    NSLog(@"%ld",(long)self.colorTagScreenOne);
    NSLog(@"%ld",(long)self.colorTagScreenTwo);

    ///// using PARENT to CHILD properties
//    if(self.colorTagScreenOne == 0)
//    {
//        //  bigSmile.image = [UIImage imageNamed:bigYellowSmiles[self.colorTagScreenTwo]];
//        [bigSmile setImage:[UIImage imageNamed:bigYellowSmiles[self.colorTagScreenTwo]]];
//    }
    
    ///// if using singleton
    if([STSSingleton data].color == 0)
    {
        [bigSmile setImage:[UIImage imageNamed:bigYellowSmiles[[STSSingleton data].smiley]]];
    }
    
    
}

-(void)buttonSelected:(UIButton *)sender
{

    [sender setSelected:!sender.selected];
    
    if(twitter.selected && thirdCheck.selected)
    {
        
        NSLog(@"twitter submited");

        
        NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString * documentPath = paths[0];
        
        NSData * imageData = UIImagePNGRepresentation(bigSmile.image);
        
        [imageData writeToFile:[documentPath stringByAppendingPathComponent:@"image.png"] atomically:YES];
        
        NSURL * url = [NSURL fileURLWithPath:[documentPath stringByAppendingPathComponent:@"image.png"]];
        
        
        NSString * latitude = [NSString stringWithFormat:@"%f", ([STSSingleton data].latitude)];
        NSString * longitude = [NSString stringWithFormat:@"%f", ([STSSingleton data].longitude)];
        
        [twitterAPI postStatusUpdate:tweetField.text inReplyToStatusID:nil mediaURL:url placeID:nil latitude:latitude longitude:longitude uploadProgressBlock:^(NSInteger bytesWritten, NSInteger totalBytesWritten, NSInteger totalBytesExpectedToWrite) {
                
            } successBlock:^(NSDictionary *status) {
                
                UIAlertView * alertView = [[UIAlertView alloc]
                                           initWithTitle: @"Success" message:@"Tweet Sent Successfully!" delegate: self
                                           cancelButtonTitle: @"Done" otherButtonTitles:nil];
                 [alertView show];
                
                NSLog(@"%@", status);
            } errorBlock:^(NSError *error) {
                NSLog(@"%@",error.userInfo);
        }];
    }
    
//    NSArray* buttons = [NSArray arrayWithObjects:twitter,googleplus,facebook, nil];
//    for (UIButton* button in buttons) {
//        if (button.tag == sender.tag)
//        {
//            if(button.selected == YES)
//            { [button setSelected:NO];
//            } else
//                button.selected = YES;
//        }
//    }


}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    
    [myMapView removeAnnotations:myMapView.annotations];
    
    for (CLLocation * location in locations)
    {
        
        MAPAnnotation * annotation = [[MAPAnnotation alloc] initWithCoordinate:location.coordinate];
        NSLog(@"%@", location);
        [myMapView addAnnotation:annotation];
        
        //   [mapView setCenterCoordinate:location.coordinate animated:YES];
        //coordinate has lat and long
        
        MKCoordinateRegion region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(1.0,1.0));  //sets center AND zooms (MKCoordinateRegion)
        
        [myMapView setRegion:region animated:YES];
        
        annotation.title = @"Marker";
        annotation.subtitle = @"This is a marker";
        
        CLGeocoder * geoCoder = [[CLGeocoder alloc] init];
        [geoCoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
            NSLog(@"%@", placemarks);
            
            
        for (CLPlacemark * placemark in placemarks) {
            NSLog(@"%@", placemark);
            NSString * cityState = [NSString stringWithFormat:@"%@,%@",placemark.addressDictionary[@"City"],placemark.addressDictionary[@"State"]];
            
            [STSSingleton data].latitude = location.coordinate.latitude;
            NSLog(@"this is latitude from singleton : %f",[STSSingleton data].latitude);
            
            [STSSingleton data].longitude = location.coordinate.longitude;
            [STSSingleton data].cityState = cityState;
            NSLog(@"from the singleton : %@",[STSSingleton data].cityState);
                
            [annotation setTitle:cityState];
            [annotation setSubtitle:placemark.country];
                
            }
            
        }];
        //  [mapView selectAnnotation:annotation animated:YES];  // makes annotation pop up auto
        
    }
    // [lManager stopUpdatingLocation];
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
