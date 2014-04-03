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
    // declaring it up here makes it global to this file
    
    NSArray *listImages;
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
        
        listItems = @[@"Ali",@"Ashby",@"Austen",@"Derek",@"Heidi",@"Jeff",@"Jeffery",@"Jisha",@"John",@"Jon",@"Savitha",@"Teddy",@"TJ"];
        
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
                       [UIImage imageNamed:@"TJMercer"]];
    
        //the above is a literal @[ starts a literal
        
        self.tableView.contentInset = UIEdgeInsetsMake(50,0,0,0);
        self.tableView.rowHeight = 100;
        
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
    
    int index = [indexPath row];
    
    NSString *name = listItems[index];
    
    cell.textLabel.text = name;
    
    // faster way to write the above cell.textLabel.text = listItems[index]; dont need placeholder variable
    
    UIImage *image = listImages[index];
    
    cell.imageView.image = image;
    
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
