//
//  LogInStudentDetailsViewController.h
//  TutorMe
//
//  Created by Marisa Gomez on 11/1/15.
//  Copyright © 2015 soft_dev2_group1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"
#import "LogInStudentViewController.h"

@interface LogInStudentDetailsViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) LogInStudentViewController *logInStudentViewController;
@property (strong, nonatomic) Student *student;
@property (weak, nonatomic) IBOutlet UIPickerView *coursePickerView;
@property (weak, nonatomic) IBOutlet UITextField *topicTextField;
@property (weak, nonatomic) IBOutlet UISwitch *emailProfessor;
@property (strong, nonatomic) NSArray *courses;

- (IBAction)logInStudent:(UIBarButtonItem *)sender;

@end
