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
@synthesize searchResults;
@synthesize searchResultsTableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [searchResultsTableView setHidden:YES];
    [searchResultsTableView setScrollEnabled:YES];
    
    searchResults = [[NSMutableArray alloc] init];
    [searchResults addObject:@"Marisa Gomez 800104806"];
    [searchResults addObject:@"Marisa Gomez 800104806"];
    [searchResults addObject:@"Marisa Gomez 800104806"];
    [searchResults addObject:@"800104846"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Search Bar Delegate
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    NSLog(@"Search bar was pressed.");
    return true;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    NSLog(@"Search Text: %@", searchText);
    
    if (searchText.length > 1) {
        for (int i = 0; i < searchResults.count; i++) {
            NSRange substringRange = [searchResults[i] rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if (substringRange.location == 0) {
                [searchResultsTableView setHidden:NO];
            }
        }
    } else {
        [searchResultsTableView setHidden:YES];
    }
}

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar {
    [searchResultsTableView setHidden:YES];
    return true;
}

#pragma mark - Table View
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [searchResults count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"MyReuseIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [searchResults objectAtIndex:indexPath.row];
    CGFloat red = 115.0;
    CGFloat green = 255.0;
    CGFloat blue = 248.0;
    CGFloat alpha = 255.0;
    cell.textLabel.textColor = [UIColor colorWithRed:(red/255.0) green:(green/255.0) blue:(blue/255.0) alpha:(alpha/255.0)];
    return cell;
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
