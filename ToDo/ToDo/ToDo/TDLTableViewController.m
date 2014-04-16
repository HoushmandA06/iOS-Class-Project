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

@implementation TDLTableViewController

{
    NSMutableArray *listItems;
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
    self = [super initWithStyle:UITableViewStylePlain];
    if (self)
    {
        listItems = [@[] mutableCopy];
        
        [self loadListItems];
        
        
//        UIBarButtonItem * editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(toggleEdit)];
//        self.navigationItem.rightBarButtonItem = editButton;
        
        
//        listItems = [@[@{
//                           @"name" : @"Jo Albright",
//                           @"image" : @"https://avatars.githubusercontent.com/u/1536630?",
//                           @"github" : @"https://github.com/joalbright"
//                           }] mutableCopy];
       

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
        
        
        
//        NSArray *array = @[
//                      @{@"name" : @"AliHoushmand",@"image" : [UIImage imageNamed:@"AliHoushmand"],@"github" : @"https://github.com/HoushmandA06"},
//                      @{@"name" : @"Ashby",@"image" : [UIImage imageNamed:@"Ashby"],@"github" : @"https://github.com/athornwell"},
//                      @{@"name" : @"AustenJohnson",@"image" : [UIImage imageNamed:@"AustenJohnson"], @"github" : @"https://github.com/ajohnson21"},
//                      @{@"name" : @"DerekWeber",@"image" : [UIImage imageNamed:@"DerekWeber"], @"github" : @"https://github.com/dweber03"},
//                      @{@"name" : @"HeidiProske",@"image" : [UIImage imageNamed:@"HeidiProske"], @"github" : @"https://github.com/justagirlcoding"},
//                      @{@"name" : @"JeffKing",@"image" : [UIImage imageNamed:@"JeffKing"], @"github" : @"https://github.com/rampis"},
//                      @{@"name" : @"JeffMoulds",@"image" : [UIImage imageNamed:@"JeffMoulds"], @"github" : @"https://github.com/jdmgithub"},
//                      @{@"name" : @"JishaObukwelu",@"image" : [UIImage imageNamed:@"JishaObukwelu"], @"github" : @"https://github.com/Jiobu"},
//                      @{@"name" : @"JohnYam",@"image" : [UIImage imageNamed:@"JohnYam"], @"github" : @"https://github.com/yamski"},
//                      @{@"name" : @"JonFox",@"image" : [UIImage imageNamed:@"JonFox"], @"github" : @"https://github.com/FoxJon"},
//                      @{@"name" : @"SavithaReddy",@"image" : [UIImage imageNamed:@"SavithaReddy"], @"github" : @"https://github.com/savithareddy"},
//                      @{@"name" : @"TeddyConyers",@"image" : [UIImage imageNamed:@"TeddyConyers"], @"github" : @"https://github.com/talented76"},
//                      @{@"name" : @"TJMercer",@"image" : [UIImage imageNamed:@"TJMercer"], @"github" : @"https://github.com/gwanunig14"}];


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
        
        self.tableView.backgroundColor = [UIColor lightGrayColor];
        
        self.tableView.contentInset = UIEdgeInsetsMake(50,0,0,0);
        self.tableView.rowHeight = 100;
        self.tableView.separatorInset = UIEdgeInsetsMake(0,20,0,20);
        
        self.tableView.editing = YES;
        
        UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0,0,320,100)];
        header.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
        
        UILabel *titleHeader = [[UILabel alloc] initWithFrame:CGRectMake(20,70,280,30)];
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
        
        nameField = [[UITextField alloc] initWithFrame:CGRectMake(20,20, 160, 30)];
        nameField.backgroundColor = [UIColor colorWithWhite:0.99 alpha:1.0];
        nameField.layer.cornerRadius = 6;
        nameField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0,0,10,30)]; // puts the cursor a set amt right of the textfield
        nameField.leftViewMode = UITextFieldViewModeAlways;
        nameField.placeholder = @"Enter name";
        
        
        [header addSubview:nameField];
        
        nameField.delegate = self;
        
        NSLog(@"listItems : %@ .... ", listItems);
        
        UIButton *submitButton = [[UIButton alloc] initWithFrame:CGRectMake(200, 20, 100, 30)];
        [submitButton setTitle:@"New User" forState:UIControlStateNormal];
        submitButton.backgroundColor = [UIColor darkGrayColor];
        submitButton.layer.cornerRadius = 6;
        [submitButton addTarget:self action:@selector(newUser) forControlEvents:UIControlEventTouchUpInside];

        [header addSubview:submitButton];
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
    NSLog(@"listItems Count : %d",[listItems count]);
    
    NSDictionary * userInfo = [TDLGitHubRequest getUserWithUsername:username];
    
    if([[userInfo allKeys] count] == 3)
    {
        [listItems addObject:userInfo];
    }
    else
    {
        NSLog(@"not enough data");
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Bad Information" message:@"Unable to Add User" delegate:self cancelButtonTitle:@"Try Again" otherButtonTitles:nil];
        [alertView show];
    }
    
    [nameField resignFirstResponder]; //this is what makes keyboard go away
    [self.tableView reloadData];
    [self saveData];
    
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
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    
    
    // if(cell == nil) cell = [[TDLTableViewCell alloc] init];
    // shorthand way of doing an if with one condition
    // int index = [indexPath row]
    
    // NSString *name = listItems[index];
    // cell.textLabel.text = name;
    // faster way to write the above cell.textLabel.text = listItems[index]; dont need placeholder variable
    // UIImage *image = listImages[index];
    // cell.imageView.image = image;
    // NSDictionary *listItem = [listItems objectAtIndex:index]; //instance method
    
    // int index = indexPath.row;
    // NSArray *reverseArray = [[listItems reverseObjectEnumerator] allObjects];
    //    NSDictionary *listItem = ; //literal
    
    // cell.textLabel.text = listItem[@"name"];
    // [[cell imageView] setImage:listItem[@"image"]];  "getter" method
    // cell.imageView.image = listItem[@"image"]; // "setter" method (does what getter does also)
    // cell.textLabel.textColor = [UIColor blueColor];
    // cell.backgroundColor = [UIColor redColor];
    // cell.textLabel.font = [UIFont fontWithName:@"Courier" size:(12)];
    // Configure the cell...
    
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{    
    NSDictionary *listItem = [self getListItem:indexPath.row];
    
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
    // [listItems removeObjectAtIndex:indexPath.row];
    
    NSDictionary * listItem = [self getListItem:indexPath.row];
    
    [listItems removeObjectIdenticalTo:listItem];
    
    //[self.tableView reloadData];
    
    TDLTableViewCell *cell = (TDLTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    cell.alpha = 0;
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
    [self saveData];
    
}

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
    
    [self saveData];
    
}


- (NSDictionary *)getListItem:(NSInteger)row
{
    NSArray * reverseArray = [[listItems reverseObjectEnumerator] allObjects];
    return reverseArray[row];
}


-(void)saveData  //saves the data
{
    NSString *path = [self listArchivePath];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:listItems]; //what we are archiving to, should be same as unarchive
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
        listItems = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
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
