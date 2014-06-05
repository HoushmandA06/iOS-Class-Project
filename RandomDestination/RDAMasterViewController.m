//
//  RDAMasterViewController.m
//  RandomDestination
//
//  Created by Ali Houshmand on 6/5/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "RDAMasterViewController.h"
#import "RDAFourSquareRequest.h"
#import "RDATableViewController.h"
#import "RDAAnnotation.h"

#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>


@interface RDAMasterViewController () <CLLocationManagerDelegate>

@end

@implementation RDAMasterViewController
{
    MKMapView * fsMap;  // mapkit class
    
    CLLocationManager * lManager;
    
    CLLocation * currentLocation;
    
    RDATableViewController * venuesTVC;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
 
        lManager = [[CLLocationManager alloc] init];
        lManager.delegate = self;
        
        [lManager startUpdatingLocation];
        
        
    }
    return self;
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    
    currentLocation = [locations firstObject];
    
    NSArray * venues = [RDAFourSquareRequest getVenuesWithLat:currentLocation.coordinate.latitude andLong:currentLocation.coordinate.longitude];
    
//    venuesTVC.venues = venues;
//    [venuesTVC.tableView reloadData];
    
//  [self createMapAnnotationsWithVenues:venues];

    [self createMapAnnotationsWithVenues:venues andLocation:currentLocation.coordinate];
    
    [lManager stopUpdatingLocation];
    
    NSLog(@"%@",locations);
    
}

-(void)createMapAnnotationsWithVenues:(NSArray *)venues andLocation:(CLLocationCoordinate2D)coordinate

{
    
    venuesTVC.venues = venues;
    [venuesTVC.tableView reloadData];

    double minLat = coordinate.latitude,
    minLong = coordinate.longitude,
    maxLat = coordinate.latitude,
    maxLong = coordinate.longitude;
    
    
    
    for (NSDictionary * venue in venues)
    {
        NSDictionary * venueInfo = venue[@"venue"];
        NSDictionary * locationInfo = venueInfo[@"location"];
        
        NSLog (@"%@", locationInfo);
        
        double latitude = [locationInfo [@"lat"] doubleValue];
        double longitude = [locationInfo [@"lng"] doubleValue];
        
        if(latitude < minLat) minLat = latitude;
        if(latitude > maxLat) maxLat = latitude;
        if(longitude < minLong) minLong = longitude;
        if(longitude > maxLong) maxLong = longitude;
        
        RDAAnnotation * annotation = [[RDAAnnotation alloc]init];
        
        [annotation setCoordinate:CLLocationCoordinate2DMake(latitude, longitude)];
        
        [fsMap addAnnotation:annotation];
    }
    
    double centerLat = (maxLat - minLat)/2.0 + minLat;
    double centerLong = (maxLong - minLong)/2.0 + minLong;
    CLLocationCoordinate2D centerCoordinate = CLLocationCoordinate2DMake(centerLat, centerLong);
    
    MKCoordinateRegion region = MKCoordinateRegionMake(centerCoordinate, MKCoordinateSpanMake(maxLat - minLat + 0.001, maxLong - minLong + 0.001));
    
    [fsMap setRegion:region animated:YES];
    
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    fsMap = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];

    [self.view addSubview:fsMap];
    
    venuesTVC = [[RDATableViewController alloc] init];
    
    venuesTVC.view.frame = CGRectMake(0, 320, 320, [UIScreen mainScreen].bounds.size.height - 320);
    
    [self.view addSubview:venuesTVC.tableView];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
  
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
