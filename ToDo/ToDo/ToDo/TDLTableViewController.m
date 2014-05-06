//
//  TDLTableViewController.m
//  ToDo
//
//  Created by Ali Houshmand on 4/2/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "TDLTableViewController.h"
#import "TDLTableViewCell.h"
#import "TDLGitHubRequest.h"
#import "TDLSingleton.h"


@implementation TDLTableViewController

{
  //  NSMutableArray *listItems;
    
    
    NSArray *listImages;
    UITextField *nameField;
    // declaring it up here makes it global to this file
}


//-(void)toggleEdit;   // this instance method was to support UIBarButtonItem below to make edit button, dont need anymore
//{
//    [self.tableView setEditing:!self.tableView.editing animated:YES];
//    
//    // self.tableView.editing = !self.tableView.editing;
//    // [self.tableView reloadData];
//}


- (id)initWithStyle:(UITableViewStyle)style
{
    if (self)
    {
    
        
        self.tableView.backgroundColor = [UIColor lightGrayColor];
        
        self.tableView.contentInset = UIEdgeInsetsMake(50,0,0,0);
        self.tableView.rowHeight = 100;
        self.tableView.separatorInset = UIEdgeInsetsMake(0,20,0,20);
        
        self.tableView.editing = YES;
        
        UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0,0,320,50)];
        header.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
        
        UILabel *titleHeader = [[UILabel alloc] initWithFrame:CGRectMake(0,0,270,50)];
        titleHeader.text = @"GitHub Users";
        titleHeader.textColor = [UIColor darkGrayColor];
        titleHeader.font =[UIFont systemFontOfSize:(26)];
        [header addSubview:titleHeader];
    
        UIView *footer = [[UIView alloc] initWithFrame:CGRectMake(0,0,320,50)];
        footer.backgroundColor = [UIColor blueColor];
        
        UILabel *titleFooter = [[UILabel alloc] initWithFrame:CGRectMake(10,10,300,30)];
        titleFooter.text = @"The End!";
        titleFooter.TextColor = [UIColor whiteColor];
        [footer addSubview:titleFooter];
        
        self.tableView.tableHeaderView = header;
        self.tableView.tableFooterView = footer;
        
//        nameField = [[UITextField alloc] initWithFrame:CGRectMake(20,20, 160, 30)];
//        nameField.backgroundColor = [UIColor colorWithWhite:0.99 alpha:1.0];
//        nameField.layer.cornerRadius = 6;
//        nameField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0,0,10,30)]; // puts the cursor a set amt right of the textfield
//        nameField.leftViewMode = UITextFieldViewModeAlways;
//        nameField.placeholder = @"Enter name";
//        [header addSubview:nameField];
        
        
//        UIButton *submitButton = [[UIButton alloc] initWithFrame:CGRectMake(200, 20, 100, 30)];
//        [submitButton setTitle:@"New User" forState:UIControlStateNormal];
//        submitButton.backgroundColor = [UIColor darkGrayColor];
//        submitButton.layer.cornerRadius = 6;
//        [submitButton addTarget:self action:@selector(newUser) forControlEvents:UIControlEventTouchUpInside];
//        [header addSubview:submitButton];
    
    }
    return self;
}



- (void)newUser // this will collect info from button
{
    
    NSString *username = nameField.text;

    nameField.text = @"";
    
//  [listItems addObject:@{
//                           @"name" : username,
//                           @"image" : [UIImage imageNamed:@"new_user"],
//                           @"github" : [NSString stringWithFormat:@"https://github.com/%@",username]}];
//  the lines above do same as NSDictionary in line 161 now that we have added GitHubRequest file
    
    
    NSLog(@"clicking");
    
    NSDictionary * userInfo = [TDLGitHubRequest getUserWithUsername:username];
    
    if([[userInfo allKeys] count] == 3)
    {
    
        [[TDLSingleton sharedCollection] addListItem:userInfo];
        //[listItems addObject:userInfo];
        
    }
    else
    {
        NSLog(@"not enough data");
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Bad Information" message:@"Unable to Add User" delegate:self cancelButtonTitle:@"Try Again" otherButtonTitles:nil];
        [alertView show];
    }
    
    [nameField resignFirstResponder]; //this is what makes keyboard go away
    [self.tableView reloadData];
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self newUser];
    return YES;

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    //self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    UIBarButtonItem * newSubmitButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(newUser)];
    self.navigationItem.rightBarButtonItem = newSubmitButton;
    newSubmitButton.tintColor = [UIColor orangeColor];

    nameField=[[UITextField alloc] initWithFrame:CGRectMake(10, 10, 100, 30)];
    [nameField setBorderStyle:UITextBorderStyleRoundedRect];
    [nameField setBackgroundColor:[UIColor blueColor]];
    nameField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0,0,10,30)]; // puts the cursor a set amt right of the textfield
    nameField.leftViewMode = UITextFieldViewModeAlways;
    nameField.placeholder = @"Enter user name";
    self.navigationItem.titleView = nameField;
    nameField.delegate = self;
    
    
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
    return [[[TDLSingleton sharedCollection] allListItems]count];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TDLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"]; //this is a memory mgmt tool
    
    if (cell == nil) {cell = [[TDLTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];}
    
    cell.index = indexPath.row;

    //cell.profileInfo = [self getListItem:indexPath.row];
    return cell;    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{    
    NSDictionary *listItem = [[TDLSingleton sharedCollection] allListItems][indexPath.row];
    
    NSLog(@"%@",listItem);
    
    UIViewController *webController = [[UIViewController alloc] init];
    
    UIWebView *webView = [[UIWebView alloc] init];
    
    webController.view = webView;
    
    [self.navigationController pushViewController:webController animated:YES];
    
   // UIWindow *window = [[UIApplication sharedApplication].windows firstObject];
    
   //  UINavigationController *navController = (UINavigationController *)window.rootViewController;
    
    //NSURL * url = [NSURL URLWithString:listItem[@"github"]];
    //NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //[webView loadRequest:request];
    // above does same as line with [webview...
    
    [webView loadRequest:[NSURLRequest requestWithURL: [NSURL URLWithString:listItem[@"github"]]]];
    
}


-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    [[TDLSingleton sharedCollection] removeListItemAtIndex:indexPath.row];
    
   // [listItems removeObjectIdenticalTo:listItem];
    
    TDLTableViewCell *cell = (TDLTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    cell.alpha = 0;
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
}

-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return YES;
}

//-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
//{
//    if(sourceIndexPath == destinationIndexPath) return;
//    
//    NSDictionary * sourceItem = [self getListItem:sourceIndexPath.row];
//    NSDictionary * toItem = [self getListItem:destinationIndexPath.row];
//    
//    [listItems removeObjectIdenticalTo:sourceItem];
//    [listItems insertObject:sourceItem atIndex:[listItems indexOfObject:toItem]];
//    
//    [self saveData];
//    
//}


//- (NSDictionary *)getListItem:(NSInteger)row
//{
//    NSArray * reverseArray = [[listItems reverseObjectEnumerator] allObjects];
//    return reverseArray[row];
//}

@end
