//
//  AdminScheduleViewController.h
//  TutorMe
//
//  Created by Christian Valderrama on 10/27/15.
//  Copyright © 2015 soft_dev2_group1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SACalendar.h"

@interface AdminScheduleViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>
{
    //Global Variable
    UIDatePicker *datePicker;
    UIToolbar *toolBar;
    //Tutor Picker
    UIPickerView *tutorPicker;
    UIToolbar *tutorPickerToolbar;
    //Time Picker
    UIPickerView *timePicker;
    UIToolbar *timePickerToolbar;
}

@property (strong, nonatomic) IBOutlet UIView *myView;
@property (strong, nonatomic) IBOutlet UITextField *TutorTextField;
@property (strong, nonatomic) IBOutlet UITextField *TimeTextField;
@property (strong, nonatomic) IBOutlet UITextField *DOBTextField;


@end
