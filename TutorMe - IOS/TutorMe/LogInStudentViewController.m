//
//  LogInStudentViewController.m
//  TutorMe
//
//  Created by Marisa Gomez on 10/29/15.
//  Copyright © 2015 soft_dev2_group1. All rights reserved.
//

#import "LogInStudentViewController.h"
#import "LogInStudentDetailsViewController.h"
#import "Student.h"

@interface LogInStudentViewController ()

@end

@implementation LogInStudentViewController
@synthesize searchBar;
@synthesize studentObject;
@synthesize studentInformation;
@synthesize loggedInStudents;
@synthesize loggedInStudentsTableView;
@synthesize studentToLogIn;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    studentInformation = [[NSMutableDictionary alloc] init];
    loggedInStudents = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    if ([[studentInformation objectForKey:@"student"] length] > 0) {
        [loggedInStudents addObject:studentInformation];
//        [loggedInStudentsTableView beginUpdates];
//        [loggedInStudentsTableView reloadData];
    }
}

- (IBAction)addStudent:(id)sender {
    studentToLogIn = searchBar.text;
    
    //Check if input is 800 number or name
    if ([studentToLogIn isEqualToString:@""]) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                       message:@"You must enter in a students name or 800 number."
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    } else if ([[studentToLogIn substringToIndex:3] isEqualToString:@"800"]) {
        
        //Make a HTTP request to see if student if in the database
        //Connect to server and database
        NSMutableURLRequest *request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://tutorme.stetson.edu/api/students/get?field=ID&value=%@", studentToLogIn]]];
        
        //Setting up for response
        NSURLResponse *response;
        NSError *err;
        NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];
        
        //Get response
        id json = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error: nil];
        NSArray *responseJSON = [json objectForKey:@"result"];
        
        //Set up Student Object
        [self setUpStudent:[responseJSON objectAtIndex:0]];
        NSLog(@"JSON: %@", responseJSON);
        
        //Double check that it is the correct student
        UIAlertController *check=   [UIAlertController
                                     alertControllerWithTitle:@"Confirmation"
                                     message:[NSString stringWithFormat:@"%@ %@", studentObject.studentID, studentObject.fullname]
                                     preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *yesConfirmation = [UIAlertAction
                                          actionWithTitle:@"YES"
                                          style:UIAlertActionStyleDefault
                                          handler:^(UIAlertAction * action)
                                          {
                                              //Perform segue
                                              [self performSegueWithIdentifier:@"showStudentDetail" sender:self];
                                              
                                          }];
        UIAlertAction *noConfirmation = [UIAlertAction
                                         actionWithTitle:@"NO"
                                         style:UIAlertActionStyleDefault
                                         handler:^(UIAlertAction * action)
                                         {
                                             [check dismissViewControllerAnimated:YES completion:nil];
                                             
                                         }];
        
        [check addAction:yesConfirmation];
        [check addAction:noConfirmation];
        [self presentViewController:check animated:YES completion:nil];
    } else {
        NSArray *fullname = [studentToLogIn componentsSeparatedByString:@" "];
        NSString *firstName = [fullname objectAtIndex:0];
        NSString *lastName = [fullname objectAtIndex:1];
        
        //Make a HTTP request to see if student if in the database
        //Connect to server and database
        NSMutableURLRequest *request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://tutorme.stetson.edu/api/students/get?field=FullName&value=%@%@%@", firstName, @"%20", lastName]]];
        
        //Setting up for response
        NSURLResponse *response;
        NSError *err;
        NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];
        
        //Get response
        id json = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error: nil];
        NSArray *responseJSON = [json objectForKey:@"result"];
        
        //Set up Student Object
        [self setUpStudent:[responseJSON objectAtIndex:0]];
        NSLog(@"JSON: %@", responseJSON);
        
        //Double check that it is the correct student
        UIAlertController *check=   [UIAlertController
                                     alertControllerWithTitle:@"Confirmation"
                                     message:[NSString stringWithFormat:@"%@ %@", studentObject.studentID, studentObject.fullname]
                                     preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *yesConfirmation = [UIAlertAction
                             actionWithTitle:@"YES"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 //Perform segue
                                 [self performSegueWithIdentifier:@"showStudentDetail" sender:self];
                                 
                             }];
        UIAlertAction *noConfirmation = [UIAlertAction
                                 actionWithTitle:@"NO"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action)
                                 {
                                     [self dismissViewControllerAnimated:YES completion:nil];
                                     
                                 }];
        
        [check addAction:yesConfirmation];
        [check addAction:noConfirmation];
        [self presentViewController:check animated:YES completion:nil];
        
        //Perform segue
        [self performSegueWithIdentifier:@"showStudentDetail" sender:self];
    }
}

- (void) setUpStudent:(NSDictionary *)studentResponse {
    
    studentObject = [[Student alloc] init];
    
    studentObject.courses = [studentResponse objectForKey:@"Courses"];
    studentObject.email = [studentResponse objectForKey:@"Email"];
    studentObject.firstName = [studentResponse objectForKey:@"FirstName"];
    studentObject.fullname = [studentResponse objectForKey:@"FullName"];
    studentObject.gender = [studentResponse objectForKey:@"Gender"];
    studentObject.studentID = [studentResponse objectForKey:@"ID"];
    studentObject.lastName = [studentResponse objectForKey:@"LastName"];
    studentObject.major = [studentResponse objectForKey:@"Major"];
    studentObject.username = [studentResponse objectForKey:@"Username"];
}

#pragma mark - Search Bar Delegate

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    NSLog(@"Search bar was pressed.");
    return true;
}

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar {
    return true;
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        return [loggedInStudents count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *searchResultsIdentifier = @"SearchResultsIdentifier";
    NSString *loggedInStudentsIdentifer = @"LoggedStudentsIdentifier";
    
    UITableViewCell *cell;
        cell = [tableView dequeueReusableCellWithIdentifier:loggedInStudentsIdentifer];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:  loggedInStudentsIdentifer];
            cell.textLabel.text = [loggedInStudents objectAtIndex:indexPath.row];
        }

    CGFloat red = 115.0;
    CGFloat green = 255.0;
    CGFloat blue = 248.0;
    CGFloat alpha = 255.0;
    cell.textLabel.textColor = [UIColor colorWithRed:(red/255.0) green:(green/255.0) blue:(blue/255.0) alpha:(alpha/255.0)];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
}

#pragma mark - Navigation

- (IBAction)unwindForSegue:(UIStoryboardSegue *)unwindSegue {
    LogInStudentDetailsViewController *detailsViewController = [unwindSegue sourceViewController];
    self.studentInformation = detailsViewController.studentInformation;
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showStudentDetail"])
    {
        // Get reference to the destination view controller
        LogInStudentDetailsViewController *vc = [segue destinationViewController];
        
        // Pass any objects to the view controller here, like...
        vc.student = self.studentObject;
    }
}
@end
