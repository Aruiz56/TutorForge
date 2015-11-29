//
//  AdminAddTutorScheduleViewController.m
//  TutorMe
//
//  Created by Marisa Gomez on 11/28/15.
//  Copyright © 2015 soft_dev2_group1. All rights reserved.
//

#import "AdminAddTutorScheduleViewController.h"

@interface AdminAddTutorScheduleViewController ()

@end

@implementation AdminAddTutorScheduleViewController
@synthesize sundayLabel;
@synthesize mondayLabel;
@synthesize tuesdayLabel;
@synthesize wednesdayLabel;
@synthesize thursdayLabel;
@synthesize fridayLabel;
@synthesize saturdayLabel;
@synthesize timeSlotInformationView;
@synthesize selectATutorLabel;
@synthesize dayPicker;
@synthesize timeSlotLabel;
@synthesize timeSlotPicker;
@synthesize days;
@synthesize times;
@synthesize dayChosen;
@synthesize startTime;
@synthesize endTime;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Hide timeslot information view and components
    [timeSlotInformationView setHidden:YES];
    [selectATutorLabel setHidden:YES];
    [dayPicker setHidden:YES];
    [timeSlotLabel setHidden:YES];
    [timeSlotPicker setHidden:YES];
    
    //Declare days array and times array
    days = @[@"sunday", @"monday", @"tuesday", @"wednesday", @"thursday", @"friday", @"saturday"];
    times = @[@"9:00AM", @"10:00AM", @"11:00AM", @"12:00PM", @"1:00PM", @"2:00PM", @"3:00PM", @"4:00PM", @"5:00PM", @"6:00PM", @"7:00PM", @"8:00PM", @"9:00PM", @"10:00PM", @"11:00PM", @"12:00AM"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)addTimeSlotInformation:(id)sender {
    [timeSlotInformationView setHidden:NO];
    [selectATutorLabel setHidden:NO];
    [dayPicker setHidden:NO];
    [timeSlotLabel setHidden:NO];
    [timeSlotPicker setHidden:NO];
}

-(IBAction)addSlotInformation:(id)sender {
    [timeSlotInformationView setHidden:YES];
    [selectATutorLabel setHidden:YES];
    [dayPicker setHidden:YES];
    [timeSlotLabel setHidden:YES];
    [timeSlotPicker setHidden:YES];
}

#pragma mark - UIPickerViewDelegate methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    if ([pickerView isEqual:dayPicker]) {
        return 1;
    } else {
        return 2;
    }
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if ([pickerView isEqual:dayPicker]) {
        return days.count;
    } else {
        return times.count;
    }
}

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if ([pickerView isEqual:dayPicker]) {
        NSString *title = [days objectAtIndex:row];
        NSAttributedString *attString = [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
        
        return attString;
    } else {
        NSString *title = [times objectAtIndex:row];
        NSAttributedString *attString = [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
        
        return attString;
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if ([pickerView isEqual:dayPicker]) {
        dayChosen = days[row];
    } else {
        if (component == 0) {
            startTime = times[row];
        } else {
            endTime = times[row];
        }
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
