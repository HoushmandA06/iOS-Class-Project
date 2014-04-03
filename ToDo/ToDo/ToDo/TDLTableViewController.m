//
//  TDLTableViewController.m
//  ToDo
//
//  Created by Ali Houshmand on 4/2/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "TDLTableViewController.h"

@implementation TDLTableViewController

{
    NSArray *listItems;
    NSArray *listImages;
    // declaring it up here makes it global to this file
}



- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {

        //listItems = [[NSArray alloc] initWithObjects:@"Monday",@"Tuesday",@"Wednesday",nil];
        // for (NSString *day in listItems) {
        // NSLog (@"listItems : %@", day);
        //}
        
        
        
        // NSDictionary *list = [[NSDictionary alloc]  initWithObjects:()]
        
        // NSDictionary *list = @{
        //                       @"name" : @"Ali Houshmand",
        //                       @"image" : [UIImage imageNamed:@"Ali Houshmand"]
        //
        //                       };
        
        
        
        listItems = @[
                      @{@"name" : @"AliHoushmand",@"image" : [UIImage imageNamed:@"AliHoushmand"]},
                      @{@"name" : @"Ashby",@"image" : [UIImage imageNamed:@"Ashby"]},
                      @{@"name" : @"AustenJohnson",@"image" : [UIImage imageNamed:@"AustenJohnson"]},
                      @{@"name" : @"DerekWeber",@"image" : [UIImage imageNamed:@"DerekWeber"]},
                      @{@"name" : @"HeidiProske",@"image" : [UIImage imageNamed:@"HeidiProske"]},
                      @{@"name" : @"JeffKing",@"image" : [UIImage imageNamed:@"JeffKing"]},
                      @{@"name" : @"JeffMoulds",@"image" : [UIImage imageNamed:@"JeffMoulds"]},
                      @{@"name" : @"JishaObukwelu",@"image" : [UIImage imageNamed:@"JishaObukwelu"]},
                      @{@"name" : @"JohnYam",@"image" : [UIImage imageNamed:@"JohnYam"]},
                      @{@"name" : @"JonFox",@"image" : [UIImage imageNamed:@"JonFox"]},
                      @{@"name" : @"SavithaReddy",@"image" : [UIImage imageNamed:@"SavithaReddy"]},
                      @{@"name" : @"TeddyConyers",@"image" : [UIImage imageNamed:@"TeddyConyers"]},
                      @{@"name" : @"TJMercer",@"image" : [UIImage imageNamed:@"TJMercer"]}];
    
    // the above creates a dictionary, allowing array with multiple pieces for each item using keys to reference index]
        
    /* listItems = @[@"AliHoushmand",@"Ashby"];
       listImages = @[[UIImage imageNamed:@"AliHoushmand"],
                       [UIImage imageNamed:@"Ashby"],
                       [UIImage imageNamed:@"AustenJohnson"],
                       [UIImage imageNamed:@"DerekWeber"],
                       [UIImage imageNamed:@"HeidiProske"],
                       [UIImage imageNamed:@"JeffKing"],
                       [UIImage imageNamed:@"JeffMoulds"],
                       [UIImage imageNamed:@"JishaObukwelu"],
                       [UIImage imageNamed:@"JohnYam"],
                       [UIImage imageNamed:@"JonFox"],
                       [UIImage imageNamed:@"SavithaReddy"],
                       [UIImage imageNamed:@"TeddyConyers"],
                       [UIImage imageNamed:@"TJMercer"]]; */
    
        //the above is a literal @[ starts a literal where we inputted the images and names separately, in ordered arrays
        
        self.tableView.contentInset = UIEdgeInsetsMake(50,0,0,0);
        self.tableView.rowHeight = 75;
        
        UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0,0,320,50)];
        header.backgroundColor = [UIColor greenColor];
        
        UILabel *titleHeader = [[UILabel alloc] initWithFrame:CGRectMake(10,10,300,30)];
        titleHeader.text = @"Contacts";
        titleHeader.textColor = [UIColor whiteColor];
        [header addSubview:titleHeader];
    

        UIView *footer = [[UIView alloc] initWithFrame:CGRectMake(0,0,320,50)];
        footer.backgroundColor = [UIColor blueColor];
        
        UILabel *titleFooter = [[UILabel alloc] initWithFrame:CGRectMake(10,10,300,30)];
        titleFooter.text = @"The End!";
        titleFooter.TextColor = [UIColor whiteColor];
        [footer addSubview:titleFooter];
        
        
        self.tableView.tableHeaderView = header;
        self.tableView.tableFooterView = footer;
        
        NSLog(@"listItems : %@ .... %@", listItems, listItems[0]);
        
        
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

    // Return the number of rows in the section.
    return [listItems count];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"]; //this is a memory mgmt tool
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] init];
        
    }
    
    // int index = [indexPath row]
    int index = indexPath.row;
    
    // NSString *name = listItems[index];
    // cell.textLabel.text = name;
    
    // UIImage *image = listImages[index];
    // cell.imageView.image = image;
    // faster way to write the above cell.textLabel.text = listItems[index]; dont need placeholder variable
    
    // NSDictionary *listItem = [listItems objectAtIndex:index]; //instance method
    
    NSDictionary *listItem = listItems[index]; //literal
    
    cell.textLabel.text = listItem[@"name"];
    cell.imageView.image = listItem[@"image"];
    
    cell.textLabel.textColor = [UIColor blueColor];
    cell.backgroundColor = [UIColor redColor];
    cell.textLabel.font = [UIFont fontWithName:@"Courier" size:(12)];
    
    // Configure the cell...
    
    return cell;
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
