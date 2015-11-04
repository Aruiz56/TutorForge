//
//  TutorRequestsViewController.m
//  TutorMe
//
//  Created by Christian Valderrama on 11/4/15.
//  Copyright © 2015 soft_dev2_group1. All rights reserved.
//

#import "TutorRequestsViewController.h"

@interface TutorRequestsViewController ()

@end

@implementation TutorRequestsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Populate dummy data
    _tableData = [[NSMutableArray alloc]initWithObjects:@"Ashley @ 2:00pm", @"Jacob @ 3:00pm", @"John @ 4:00pm", nil];
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
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIAlertController *myAlert = [UIAlertController alertControllerWithTitle:@"Request" message:[NSString stringWithFormat:@"%@", [_tableData objectAtIndex:indexPath.row]] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *resendRequest = [UIAlertAction actionWithTitle:@"Resend Request" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
                                    {
                                        UIAlertController *sentAlert = [UIAlertController alertControllerWithTitle:nil message:@"Request Resent!" preferredStyle:UIAlertControllerStyleAlert];
                                        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){}];
                                        [sentAlert addAction:okAction];
                                        [self presentViewController:sentAlert animated:YES completion:nil];
                                    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action){}];
    
    [myAlert addAction:resendRequest];
    [myAlert addAction:cancel];
    [self presentViewController:myAlert animated:YES completion:nil];
    
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
