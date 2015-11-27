//
//  LogInStudentViewController.h
//  TutorMe
//
//  Created by Marisa Gomez on 10/29/15.
//  Copyright © 2015 soft_dev2_group1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"

@interface LogInStudentViewController : UIViewController <UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) Student *studentObject;
@property (strong, nonatomic) NSMutableDictionary *studentInformation;
@property (strong, nonatomic) NSMutableArray *loggedInStudents;
@property (weak, nonatomic) IBOutlet UITableView *loggedInStudentsTableView;
@property (weak, nonatomic) NSString *studentToLogIn;

- (IBAction)addStudent:(id)sender;
- (void) setUpStudent:(NSDictionary *)student;

@end
