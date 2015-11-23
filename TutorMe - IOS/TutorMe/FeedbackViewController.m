//
//  RequestTableViewController.m
//  TutorMe
//
//  Created by Christian Valderrama on 11/22/15.
//  Copyright © 2015 soft_dev2_group1. All rights reserved.
//

#import "FeedbackViewController.h"

@implementation FeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Used to determine if user is editing list with bar button item
    _Editing = 0;
    
    //Populate dummy data
    _tableData = [[NSMutableArray alloc]initWithObjects:@"Complaint - Josh", @"Great Work... - Ashley", @"Another well done.. - Nik", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView Delegate Methods
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_tableData count];
}
/*
 * Method is used to populate the table veiw for each cell using the tabledata NSMutuableArray.
 */
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *myTableIdentifier = @"TableItem";
    
    UITableViewCell *myCell = [tableView dequeueReusableCellWithIdentifier:myTableIdentifier];
    
    if(myCell == nil)
    {
        myCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:myTableIdentifier];
    }
    
    myCell.textLabel.text = [_tableData objectAtIndex:indexPath.row];
    
    //    myCell.imageView.image = [UIImage imageNamed:@""]; if we want to use a image with each cell
    return myCell;
}
/*
 * Method tableview delegate is used when user selects a row in the table view.
 * Displays an alert with request sent & with option to resend the request.
 */
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIAlertController *myAlert = [UIAlertController alertControllerWithTitle:@"Message" message:[NSString stringWithFormat:@"%@", [_tableData objectAtIndex:indexPath.row]] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Reply" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
                                    {
                                        //Reply to user and send to database to send to user app or email?
                                    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action){}];
    
    [myAlert addAction:okAction];
    [myAlert addAction:cancel];
    [self presentViewController:myAlert animated:YES completion:nil];
    
}
/*
 * Method used to enable editing on table view.
 */
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
/*
 * Method used when deleting row in table to delete in database as well.
 */
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        //DELETE IN DATABASE AND ARRAY
        //Remove item from array but need to remove from database!
        [_tableData removeObjectAtIndex:indexPath.row];
        [tableView reloadData];
    }
}
- (IBAction)trashButton:(UIBarButtonItem *)sender {
    if(_Editing == 0)
    {
        _Editing = 1;
        
        [self.myTableView setEditing:YES animated:YES];
    } else {
        _Editing = 0;
        [self.myTableView setEditing:NO animated:NO];
    }
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end

