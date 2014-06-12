//
//  NPATableViewController.m
//  NavPracticeApp
//
//  Created by Ali Houshmand on 5/17/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "NPATableVC.h"
#import "NPANavVC.h"


@interface NPATableVC () <UITabBarControllerDelegate>

@end

@implementation NPATableVC
{
    UIBarButtonItem * colorButton;
    UIBarButtonItem * numberButton;
    
    NSArray * colors;
    NSArray * numbers;
    
    BOOL colorsIsSelected;
    NSString * listType;
 
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
 
        colors = @[@"red",@"blue",@"black"];
    
        numbers = @[@"1",@"2", @"3",@"4"];
        
        colorsIsSelected = YES;
        listType = @"colors";
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    colorButton = [[UIBarButtonItem alloc] initWithTitle:@"Colors" style:UIBarButtonItemStylePlain target:self action:@selector(tabSelected:)];
    
    numberButton = [[UIBarButtonItem alloc] initWithTitle:@"Numbers" style:UIBarButtonItemStylePlain target:self action:@selector(tabSelected:)];
    
    UIBarButtonItem * flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        
    [self setToolbarItems:@[flexible, colorButton, flexible, numberButton, flexible]];

    [self.navigationController setNavigationBarHidden:NO];
    self.navigationController.toolbarHidden = NO;
    
    UIBarButtonItem * backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(backToStartingVC)];
    
    self.navigationItem.rightBarButtonItem = backButton;
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}




-(void)tabSelected:(UIBarButtonItem *)sender
{
    colorsIsSelected = [sender.title isEqualToString:@"Colors"];
    [self.tableView reloadData];
}



-(void)backToStartingVC
{
    
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
    }];  //dismisses TableVC

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
// 
//    // Return the number of sections.
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(colorsIsSelected) return [colors count];
    else return [numbers count];
    
        
    // return [numbers count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    if(colorsIsSelected) cell.textLabel.text = colors[indexPath.row];
    else cell.textLabel.text = numbers[indexPath.row];
    
    // Configure the cell...
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    if(colorsIsSelected)
    {
    
    UIViewController * colorsVC = [[UIViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:colorsVC animated:NO];
        
        UILabel * sample = [[UILabel alloc] initWithFrame:CGRectMake(100,100,200,50)];
        sample.text = @"you are in Colors VC";
        [colorsVC.view addSubview:sample];
        
    } else
        
    {
        UIViewController * numbersVC = [[UIViewController alloc] initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:numbersVC animated:NO];
        
        UILabel * sample = [[UILabel alloc] initWithFrame:CGRectMake(100,100,200,50)];
        sample.text = @"you are in Numbers VC";
        [numbersVC.view addSubview:sample];
    }
    
}
 

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
