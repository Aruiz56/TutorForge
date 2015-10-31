//
//  LogInStudentViewController.m
//  TutorMe
//
//  Created by Marisa Gomez on 10/29/15.
//  Copyright © 2015 soft_dev2_group1. All rights reserved.
//

#import "LogInStudentViewController.h"

@interface LogInStudentViewController ()

@end

@implementation LogInStudentViewController
@synthesize searchBar;

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    NSLog(@"Search bar was pressed.");
    return true;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    NSLog(@"Search Text: %@", searchText);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
