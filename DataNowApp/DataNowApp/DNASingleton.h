//
//  DNASingleton.h
//  DataNowApp
//
//  Created by Ali Houshmand on 5/6/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DNASingleton : NSObject


// a singleton returns same object (vs a class, which returns new object)

+(DNASingleton *)sharedSingleton;  // public interface

@property(nonatomic) NSDictionary * sectionInfo;


-(NSArray *)allSections;
-(NSArray *)allRowsForSection:(NSString *)sectionName;




@end
