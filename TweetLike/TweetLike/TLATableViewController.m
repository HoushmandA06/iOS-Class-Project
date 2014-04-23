//
//  TLATableViewController.m
//  TweetLike
//
//  Created by Ali Houshmand on 4/23/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "TLATableViewController.h"
#import "TLATableViewCell.h"

@interface TLATableViewController ()

@end

@implementation TLATableViewController
{
    NSMutableArray * tweetItems;
    UITextField * tweetField;

}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {

    tweetItems = [@[
                       // starts array
                       @{
                       //starts dictionary at index 0
                           @"text":@"No more shall I go on, without first looking ahead.",
                           @"likes":@35},
                       // starts dictionary at index 1
                       @{
                           @"text":@"I like chocolate.",
                           @"likes":@72}
    
                       ] mutableCopy];
        
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0,0,320,60)];
    header.backgroundColor = [UIColor blackColor];
    self.tableView.tableHeaderView = header;
        
    UILabel * titleHeader = [[UILabel alloc] initWithFrame:CGRectMake(120,0,100,95)];
//      titleHeader.text = @"TweetLike";
//   titleHeader.textColor = [UIColor whiteColor];
//    titleHeader.font =[UIFont fontWithName:@"Helvetica" size:(20)];
    [header addSubview:titleHeader];
        
    tweetField = [[UITextField alloc] initWithFrame:CGRectMake(110,20,100,30)];
    tweetField.backgroundColor = [UIColor colorWithWhite:0.90 alpha:1.0];
    tweetField.layer.cornerRadius = 10;
    tweetField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0,0,10,30)]; // puts the cursor a set amt right of the textfield
    tweetField.leftViewMode = UITextFieldViewModeAlways;
    tweetField.placeholder = @"Add New!";
    [header addSubview:tweetField];
    tweetField.delegate = self;
        
    self.tableView.rowHeight = 80;  //self.tableView.frame.size.width;
    self.tableView.separatorInset = UIEdgeInsetsZero;
    
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [tweetItems count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    TLATableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"]; //mem mgmt tool
    
    if (cell == nil)
    {
        cell = [[TLATableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.tweet = tweetItems[indexPath.row];
    
    // Configure the cell...
    
    return cell;
}


-(BOOL)prefersStatusBarHidden
{
    return YES;
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
