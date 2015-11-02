//
//  LogInStudentDetailsViewController.m
//  TutorMe
//
//  Created by Marisa Gomez on 11/1/15.
//  Copyright © 2015 soft_dev2_group1. All rights reserved.
//

#import "LogInStudentDetailsViewController.h"
#import "LogInStudentViewController.h"

@interface LogInStudentDetailsViewController ()

@end

@implementation LogInStudentDetailsViewController
@synthesize student;
@synthesize courses;
@synthesize course;
@synthesize studentInformation;
@synthesize topicTextField;
@synthesize emailProfessor;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [studentInformation setObject:student forKey:@"student"];
    
    courses = [[NSMutableArray alloc] init];
    [courses addObject:@"Software Development II"];
    [courses addObject:@"Data and Informatino Technology"];
    [courses addObject:@"Education with Children's Books"];
    [courses addObject:@"Senior Research I"];
    [courses addObject:@"Information Technology II"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIPickerViewDelegate methods
//- (CGFloat)pickerView:(UIPickerView *)picker rowHeightForComponent:(NSInteger)rowHeight {
//    CGFloat height;
//    
//    return height;
//}
//
//- (CGFloat)pickerView:(UIPickerView *)picker widthForComponent:(NSInteger)rowWidth {
//    CGFloat width;
//    
//    return width;
//}

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
    course = courses[row];
    [studentInformation setObject:course forKey:@"course"];
}

#pragma mark - Log in student details

- (IBAction)logInStudent:(UIBarButtonItem *)sender {
    [studentInformation setObject:topicTextField.text forKey:@"topic"];
    
    if ([emailProfessor isOn]) {
        [studentInformation setObject:@"YES" forKey:@"emailProfessor"];
    } else {
        [studentInformation setObject:@"NO" forKey:@"emailProfessor"];
    }
    
    [self performSegueWithIdentifier:@"unwindWithInfo" sender:self];
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"unwindWithInfo"]) {
        LogInStudentViewController *vc = [[LogInStudentViewController alloc] init];
        vc.studentInformation = self.studentInformation;
    }
}

@end
