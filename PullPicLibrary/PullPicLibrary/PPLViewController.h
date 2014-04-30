//
//  PPLViewController.h
//  PullPicLibrary
//
//  Created by Ali Houshmand on 4/30/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PPLViewController : UIViewController <UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *picFrame;

- (IBAction)getPhoto:(UIButton *)sender;



@end
