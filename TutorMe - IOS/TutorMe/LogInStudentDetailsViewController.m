//
//  LogInStudentDetailsViewController.m
//  TutorMe
//
//  Created by Marisa Gomez on 11/1/15.
//  Copyright © 2015 soft_dev2_group1. All rights reserved.
//

#import "LogInStudentDetailsViewController.h"
#import "LogInStudentViewController.h"
#import "Student.h"

@interface LogInStudentDetailsViewController ()

@end

@implementation LogInStudentDetailsViewController
@synthesize logInStudentViewController;
@synthesize student;
@synthesize courses;
@synthesize topicTextField;
@synthesize emailProfessor;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *encodedStudent = [defaults objectForKey:@"student"];
    student = [NSKeyedUnarchiver unarchiveObjectWithData:encodedStudent];
    
    courses = student.courses;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UIPickerViewDelegate methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return courses.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return courses[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    //Set the selected course for tutoring
    student.courseRequested = courses[row];
    
    NSData *encodedStudent = [NSKeyedArchiver archivedDataWithRootObject:student];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:encodedStudent forKey:@"student"];
    [defaults synchronize];
}

#pragma mark - Log in student details

- (IBAction)logInStudent:(UIBarButtonItem *)sender {
    //Set fields for logging in a student, including topic and whether to email the professor
    student.topic = topicTextField.text;
    
    if ([emailProfessor isOn]) {
        student.emailProfessor = @"YES";
    } else {
        student.emailProfessor = @"NO";
    }
    
    NSData *encodedStudent = [NSKeyedArchiver archivedDataWithRootObject:student];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:encodedStudent forKey:@"student"];
    [defaults synchronize];
    
    [logInStudentViewController.loggedInStudents addObject:student];
    
    [self performSegueWithIdentifier:@"unwindWithInfo" sender:self];
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}

@end
