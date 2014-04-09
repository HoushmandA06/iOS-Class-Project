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
    NSArray * priorityColors;
    UIButton *submitButtonHigh;
    UIButton *submitButtonMed;
    UIButton *submitButtonLow;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {

        listItems = [@[] mutableCopy];
        
//      [self loadListItems];
        
        priorityColors = @[TAN_COLOR,YELLOW_COLOR,ORANGE_COLOR,RED_COLOR];
        
        listItems = [@[
                    @{@"name": @"Workshop App", @"priority":@3},
                    @{@"name": @"Something Else", @"priority":@2},
                    @{@"name": @"One more thing", @"priority":@1},
                    @{@"name": @"A done item",@"priority":@0}
                      ] mutableCopy];
        
        self.tableView.backgroundColor = [UIColor clearColor];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        self.tableView.contentInset = UIEdgeInsetsMake(10,0,0,0);
        self.tableView.rowHeight = 50;
        self.tableView.separatorInset = UIEdgeInsetsMake(0,20,0,20);
        //self.tableView.editing = YES; //this is what puts the "edit" circle in the cell
        
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
        
        submitButtonHigh = [[UIButton alloc] initWithFrame:CGRectMake(270, 20, 30, 30)];
        submitButtonHigh.tag = 3;
        [submitButtonHigh setTitle:@"H" forState:UIControlStateNormal];
        submitButtonHigh.backgroundColor = RED_COLOR;
        submitButtonHigh.layer.cornerRadius = 15;
        [submitButtonHigh addTarget:self action:@selector(newTodoitem:) forControlEvents:UIControlEventTouchUpInside];
        [header addSubview:submitButtonHigh];
        
        //[self.tableView.tableHeaderView addSubview:submitButtonHigh];

        
        submitButtonMed = [[UIButton alloc] initWithFrame:CGRectMake(235, 20, 30, 30)];
        submitButtonMed.tag = 2;
        [submitButtonMed setTitle:@"M" forState:UIControlStateNormal];
        submitButtonMed.backgroundColor = ORANGE_COLOR;
        submitButtonMed.layer.cornerRadius = 15;
        [submitButtonMed addTarget:self action:@selector(newTodoitem:) forControlEvents:UIControlEventTouchUpInside];
        [header addSubview:submitButtonMed];
        

        submitButtonLow = [[UIButton alloc] initWithFrame:CGRectMake(200, 20, 30, 30)];
        submitButtonLow.tag = 1;
        [submitButtonLow setTitle:@"L" forState:UIControlStateNormal];
        submitButtonLow.backgroundColor = YELLOW_COLOR;
        submitButtonLow.layer.cornerRadius = 15;
        [submitButtonLow addTarget:self action:@selector(newTodoitem:) forControlEvents:UIControlEventTouchUpInside];
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

    [nameField resignFirstResponder]; //this is what makes keyboard go away in this method
    [self.tableView reloadData];
//  [self saveData];
    
    
}





- (BOOL)textFieldShouldReturn:(UITextField *)textField //for when u hit enter
{

    //  [self newTodoitem:nil];
    
    if([nameField.text  isEqual: @""])
    {
        NSLog(@"nothing entered");
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Nothing Entered" message:@"Unable to Add ToDo" delegate:self cancelButtonTitle:@"Try Again" otherButtonTitles:nil];
        [alertView show];
    }
    
    [nameField resignFirstResponder];
    nameField.text = @"";
    nameField.placeholder = @"Enter ToDo";
    [self.tableView reloadData];
    return YES;
    
}


-(void)newTodoitem:(id)sender
{

    UIButton *button = (UIButton *)sender;
    NSString *name = nameField.text;
    nameField.text = @"";

    
    if(![name isEqualToString:@""])
    {
        [listItems insertObject:@{@"name" : name, @"priority" : @(button.tag)} atIndex:0];
    } else {
        
    }
    
    [self.tableView reloadData];
    
    NSLog(@"%@", sender);
    
    
    
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
    
    NSDictionary *listItem = listItems[indexPath.row];
        
    cell.bgView.backgroundColor = priorityColors[[listItem[@"priority"] intValue]];
    cell.nameLabel.text = listItem[@"name"];
    cell.nameLabel.textColor = [UIColor whiteColor];
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeCell:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [cell addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeCell:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [cell addGestureRecognizer:swipeRight];
    
    return cell;
}

- (NSDictionary *)getListItem:(NSInteger)row
{
 
    NSArray * reverseArray = [[listItems reverseObjectEnumerator] allObjects];
    return reverseArray[row];
}


#pragma mark - next two methods allow you to move rows up/down by selecting the triple line


-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    if(sourceIndexPath == destinationIndexPath) return;
    
    NSDictionary * sourceItem = [self getListItem:sourceIndexPath.row];
    NSDictionary * toItem = [self getListItem:destinationIndexPath.row];
    
    [listItems removeObjectIdenticalTo:sourceItem];
    [listItems insertObject:sourceItem atIndex:[listItems indexOfObject:toItem]];
    
    // [self saveData];
    
}
 
#pragma mark - next two methods for row deletion, works with "editing yes" up top

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


/*-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath   // allows for deletion of todo cell items with swipe left revealing delete
{
    
    NSDictionary * listItem = [self getListItem:indexPath.row];
    
    [listItems removeObjectIdenticalTo:listItem];
    
    TDLTableViewCell *cell = (TDLTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    cell.alpha = 0;
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
    
}*/

-(void)swipeCell:(UISwipeGestureRecognizer *)gesture
{
    switch (gesture.direction)
    {
        case 1: // right
            NSLog(@"swiping right");
            
            break;
        case 2: // left
            NSLog(@"swiping left");
            
            break;
        default:
            break;
    }
}


-(BOOL)prefersStatusBarHidden {return YES;}

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
