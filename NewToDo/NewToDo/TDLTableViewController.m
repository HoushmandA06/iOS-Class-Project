//
//  TDLTableViewController.m
//  NewToDo
//
//  Created by Ali Houshmand on 4/8/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "TDLTableViewController.h"
#import "TDLTableViewCell.h"

@interface TDLTableViewController ()

@end

@implementation TDLTableViewController
{
    NSMutableArray *listItems;
    UITextField *nameField;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {

        listItems = [@[] mutableCopy];
        
//      [self loadListItems];
        
        
        self.tableView.backgroundColor = [UIColor clearColor];
        
        self.tableView.contentInset = UIEdgeInsetsMake(50,0,0,0);
        self.tableView.rowHeight = 50;
        self.tableView.separatorInset = UIEdgeInsetsMake(0,20,0,20);
        self.tableView.editing = YES;
        
        UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0,0,320,70)];
        header.backgroundColor = [UIColor clearColor];
        self.tableView.tableHeaderView = header;
        
        nameField = [[UITextField alloc] initWithFrame:CGRectMake(20,20, 160, 30)];
        nameField.backgroundColor = [UIColor colorWithWhite:0.99 alpha:1.0];
        nameField.layer.cornerRadius = 6;
        nameField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0,0,10,30)]; // puts the cursor a set amt right of the textfield
        nameField.leftViewMode = UITextFieldViewModeAlways;
        nameField.placeholder = @"Enter ToDo Here";
        
        [header addSubview:nameField];
        
        nameField.delegate = self;
        
        NSLog(@"listItems : %@ .... ", listItems);
        
        UIButton *submitButtonHigh = [[UIButton alloc] initWithFrame:CGRectMake(200, 20, 30, 30)];
        [submitButtonHigh setTitle:@"H" forState:UIControlStateNormal];
        submitButtonHigh.backgroundColor = [UIColor redColor];
        submitButtonHigh.layer.cornerRadius = 15;
        [submitButtonHigh addTarget:self action:@selector(newTodoitem) forControlEvents:UIControlEventTouchUpInside];
        
        [header addSubview:submitButtonHigh];

        
        UIButton *submitButtonMed = [[UIButton alloc] initWithFrame:CGRectMake(235, 20, 30, 30)];
        [submitButtonMed setTitle:@"M" forState:UIControlStateNormal];
        submitButtonMed.backgroundColor = [UIColor orangeColor];
        submitButtonMed.layer.cornerRadius = 15;
        [submitButtonMed addTarget:self action:@selector(newTodoitem) forControlEvents:UIControlEventTouchUpInside];
        
        [header addSubview:submitButtonMed];
        
        UIButton *submitButtonLow = [[UIButton alloc] initWithFrame:CGRectMake(270, 20, 30, 30)];
        [submitButtonLow setTitle:@"L" forState:UIControlStateNormal];
        submitButtonLow.backgroundColor = [UIColor greenColor];
        submitButtonLow.layer.cornerRadius = 15;
        [submitButtonLow addTarget:self action:@selector(newTodoitem) forControlEvents:UIControlEventTouchUpInside];
        
        [header addSubview:submitButtonLow];
    }
    return self;
}


- (void)newTodoitem // this will collect info from button
{
    
    NSString *todoitem = nameField.text;
    
    nameField.text = @"";
    
    NSLog(@"clicking");
    NSLog(@"todoitem : %@",todoitem);
    
    // missing some code here to make newTodoitem work
    
    NSDictionary * todoInfo = @{@"name":todoitem};

    if([todoitem  isEqual: @""])
    {
        NSLog(@"nothing entered");
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Nothing Entered" message:@"Unable to Add ToDo" delegate:self cancelButtonTitle:@"Try Again" otherButtonTitles:nil];
        [alertView show];
    }
    else
    {
        [listItems addObject:todoInfo];
    }

  //  [listItems addObject:todoInfo];
    [nameField resignFirstResponder]; //this is what makes keyboard go away
    [self.tableView reloadData];
//  [self saveData];
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self newTodoitem];
    return YES;
    
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
    TDLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"]; //this is a memory mgmt tool
    
    if (cell == nil)
    {
        cell = [[TDLTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.profileInfo = [self getListItem:indexPath.row];
    return cell;
    
}

- (NSDictionary *)getListItem:(NSInteger)row
{
    
    NSArray * reverseArray = [[listItems reverseObjectEnumerator] allObjects];
    return reverseArray[row];
    
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
