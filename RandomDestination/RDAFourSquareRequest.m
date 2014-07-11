//
//  RDAFourSquareRequest.m
//  RandomDestination
//
//  Created by Ali Houshmand on 6/5/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "RDAFourSquareRequest.h"

@implementation RDAFourSquareRequest

+(NSArray *)getVenuesWithLat:(double)lat andLong:(double)lng
{
    NSArray * venues = @[];
    
    NSString * locationURL = [NSString stringWithFormat:@"https://api.foursquare.com/v2/venues/explore?ll=%f,%f&oauth_token=V0XXLMTNMGLOG4YTJCD3UWZPDCN1DALTUA1KGI1G5JJDPSWL&v=20140605",lat,lng];
    
    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:locationURL]];
    
    NSData * responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];

    NSDictionary * fsInfo = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
    
    venues = fsInfo[@"response"][@"groups"][0][@"items"];

    NSLog(@"%lu",[[fsInfo allKeys] count]);
    
    
    
   // venues = fsInfo[@"response"][@"categories"][3][@"name"];
    
    
    return venues;
    
}


@end
