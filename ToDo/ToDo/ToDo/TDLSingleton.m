//
//  DNASingleton.m
//  DataNowApp
//
//  Created by Ali Houshmand on 5/6/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "TDLSingleton.h"


@interface TDLSingleton ()

@property (nonatomic) NSMutableArray * listItems;

@end

@implementation TDLSingleton

+(TDLSingleton *)sharedCollection;

{
    
    static dispatch_once_t create;
    static TDLSingleton * singleton = nil;
    
    dispatch_once(&create, ^ {
        singleton = [[TDLSingleton alloc] init];
    });
    
    return singleton;
}

-(id) init
{
    self = [super init];
    if(self)
    {
        [self loadListItems];
    }
    return self;
}


-(NSMutableArray *)listItems
{
    if(_listItems == nil)
    {
        _listItems = [@[] mutableCopy];
        
    }
    return _listItems;
}




-(void)addListItem:(NSDictionary *)listItem
{
    [self.listItems addObject:listItem];
    [self saveData];
}

-(void)removeListItem:(NSDictionary *)listItem
{
    [self.listItems removeObjectIdenticalTo:listItem];
    [self saveData];
}

-(void)removeListItemAtIndex:(NSInteger)index
{
    [self.listItems removeObjectAtIndex:index];
    [self saveData];
}


-(NSArray *)allListItems
{
    return [self.listItems copy];
}

-(void)saveData  //saves the data
{
    NSString *path = [self listArchivePath];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.listItems]; //what we are archiving to, should be same as unarchive
    [data writeToFile:path options:NSDataWritingAtomic error:nil];
    
}

-(NSString *)listArchivePath  //finds the path to the data to save
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = documentDirectories[0];
    return [documentDirectory stringByAppendingPathComponent:@"listdata.data"];
    
}

-(void)loadListItems //to load data from saved
{
    NSString *path = [self listArchivePath];
    if([[NSFileManager defaultManager] fileExistsAtPath:path])
    {
        self.listItems = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    }
}





@end
