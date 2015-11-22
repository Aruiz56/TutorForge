//
//  LogInStudentViewController.m
//  TutorMe
//
//  Created by Marisa Gomez on 10/29/15.
//  Copyright © 2015 soft_dev2_group1. All rights reserved.
//

#import "LogInStudentViewController.h"
#import "LogInStudentDetailsViewController.h"

@interface LogInStudentViewController ()

@end

@implementation LogInStudentViewController
@synthesize searchBar;
@synthesize searchResults;
@synthesize searchResultsTableView;
@synthesize student;
@synthesize studentInformation;
@synthesize loggedInStudents;
@synthesize loggedInStudentsTableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [searchResultsTableView setHidden:YES];
    [searchResultsTableView setScrollEnabled:YES];
    
    studentInformation = [[NSMutableDictionary alloc] init];
    loggedInStudents = [[NSMutableArray alloc] init];
    
    searchResults = [[NSMutableArray alloc] init];
    [searchResults addObject:@"Marisa Gomez 800104806"];
    [searchResults addObject:@"Marisa Gomez 800104806"];
    [searchResults addObject:@"Marisa Gomez 800104806"];
    [searchResults addObject:@"800104846"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    if ([[studentInformation objectForKey:@"student"] length] > 0) {
        [loggedInStudents addObject:studentInformation];
        [loggedInStudentsTableView beginUpdates];
        [loggedInStudentsTableView reloadData];
        
//        for (int i = 0; i < [loggedInStudentsTableView numberOfRowsInSection:1]; i++) {
//            [loggedInStudentsTableView reloa];
//        }
    }
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
    if ([tableView isEqual:searchResultsTableView]) {
        return [searchResults count];
    } else {
        return [loggedInStudents count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *searchResultsIdentifier = @"SearchResultsIdentifier";
    NSString *loggedInStudentsIdentifer = @"LoggedStudentsIdentifier";
    
    UITableViewCell *cell;
    
    if ([tableView isEqual:searchResultsTableView]) {
    
        cell = [tableView dequeueReusableCellWithIdentifier:searchResultsIdentifier];
    
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:  searchResultsIdentifier];
            cell.textLabel.text = [searchResults objectAtIndex:indexPath.row];
        }
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:loggedInStudentsIdentifer];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:  loggedInStudentsIdentifer];
            cell.textLabel.text = [loggedInStudents objectAtIndex:indexPath.row];
        }
    }

    CGFloat red = 115.0;
    CGFloat green = 255.0;
    CGFloat blue = 248.0;
    CGFloat alpha = 255.0;
    cell.textLabel.textColor = [UIColor colorWithRed:(red/255.0) green:(green/255.0) blue:(blue/255.0) alpha:(alpha/255.0)];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableView isEqual:searchResultsTableView]) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        student = cell.textLabel.text;
    } else {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    }
}

#pragma mark - Navigation

- (IBAction)unwindForSegue:(UIStoryboardSegue *)unwindSegue {
    LogInStudentDetailsViewController *detailsViewController = [unwindSegue sourceViewController];
    self.studentInformation = detailsViewController.studentInformation;
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"logInStudent"])
    {
        // Get reference to the destination view controller
        LogInStudentDetailsViewController *vc = [segue destinationViewController];
        
        // Pass any objects to the view controller here, like...
        vc.student = self.student;
    }
}
@end
