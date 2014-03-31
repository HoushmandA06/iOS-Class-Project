//
//  AHWViewController.h
//  W1D1 App
//
//  Created by Ali Houshmand on 3/31/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AHWViewController : UIViewController

- (IBAction)StringChanger:(id)sender;

- (IBAction)ChangeLabelUI:(id)sender;

- (IBAction)ChgTxtColor:(id)sender;

- (IBAction)ChangeBackground:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *Label1;

@property (weak, nonatomic) IBOutlet UILabel *Label2;

@property (weak, nonatomic) IBOutlet UILabel *Label3;

@property (weak, nonatomic) IBOutlet UITextField *myTextField;



@end
