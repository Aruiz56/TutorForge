//
//  AdminScheduleViewController.m
//  TutorMe
//
//  Created by Christian Valderrama on 10/27/15.
//  Copyright © 2015 soft_dev2_group1. All rights reserved.
//

#import "AdminScheduleViewController.h"

@interface AdminScheduleViewController () <SACalendarDelegate>

@property (strong, nonatomic) NSArray *TutorArray;
@property (strong, nonatomic) NSArray *TimeArray;
@property (strong, nonatomic) NSMutableArray *mySavedEvents;
@property (strong, nonatomic) NSMutableArray *myEventDate;
@property (strong, nonatomic) NSMutableArray *myEventTime;

@end

@implementation AdminScheduleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Create the SACalendar
    SACalendar *myCalendar = [[SACalendar alloc]initWithFrame:CGRectMake(0, 20, 320, 400)];
    
    myCalendar.delegate = self;
    
    [_myView addSubview:myCalendar];
    
    _mySavedEvents = [[NSMutableArray alloc]init];
    _myEventDate = [[NSMutableArray alloc]init];
    _myEventTime = [[NSMutableArray alloc]init];
    
    /*
     * Set up Tutor Picker for Tutor selection in UIAlertController
     */
    _TutorArray = [[NSArray alloc]initWithObjects:@"", @"Josh John", @"Ashley Combs", @"Dylan Roberts", nil];
    
    tutorPicker = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 43, 320, 480)];
    tutorPicker.delegate = self;
    tutorPicker.dataSource = self;
    [tutorPicker setShowsSelectionIndicator:YES];
    
    tutorPickerToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 56)];
    [tutorPickerToolbar sizeToFit];
    
    NSMutableArray *barItems = [[NSMutableArray alloc]init];
    
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    [barItems addObject:flexSpace];
    
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(ShowSelectedTutor)];
    
    [barItems addObject:doneBtn];
    
    [tutorPickerToolbar setItems:barItems animated:YES];
    
    
    /*
     * Set up Time Picker for Time selection in UIAlertController
     */
    _TimeArray = [[NSArray alloc]initWithObjects:@"", @"1:00pm", @"1:30pm", @"2:00pm", nil];
    
    timePicker = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 43, 320, 480)];
    timePicker.delegate = self;
    timePicker.dataSource = self;
    [timePicker setShowsSelectionIndicator:YES];
    
    timePickerToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 56)];
    [timePickerToolbar sizeToFit];
    
    NSMutableArray *timeBarItems = [[NSMutableArray alloc]init];
    
    UIBarButtonItem *timeFlexSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    [timeBarItems addObject:timeFlexSpace];
    
    UIBarButtonItem *timeDoneBtn = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(ShowSelectedTime)];
    
    [timeBarItems addObject:timeDoneBtn];
    
    [timePickerToolbar setItems:timeBarItems animated:YES];
    
    
    /*
     * Set up Date Picker for DOB
     */
    datePicker = [[UIDatePicker alloc]init];
    datePicker.datePickerMode=UIDatePickerModeDate;
    
    toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    [toolBar setTintColor:[UIColor grayColor]];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(ShowSelectedDate)];
    UIBarButtonItem *space= [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [toolBar setItems:[NSArray arrayWithObjects:space, doneButton, nil]];
    
}

/*
 * Method to show the selected Tutor
 */
#pragma mark - Picker Show Selected Tutor
-(void)ShowSelectedTutor
{
    [_TutorTextField resignFirstResponder];
}
/*
 * Method to show the selected Time
 */
#pragma mark - Picker Show Selected Time
-(void)ShowSelectedTime
{
    [_TimeTextField resignFirstResponder];
}
/*
 * Methods needed by picker view to control the selection of the picker.
 *
 */
#pragma mark - Picker Data Source Methods
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
/*
 * Method is used to create each cell in the picker view.
 */
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if([pickerView isEqual:tutorPicker]) return [_TutorArray count];
    else return [_TimeArray count];
}
/*
 * Method is used to determinet the array at the certain index.
 */
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if([pickerView isEqual:tutorPicker]) return [_TutorArray objectAtIndex:row];
    else return [_TimeArray objectAtIndex:row];
}
/*
 * Method Required by PickerView to set the text field to the current selected value in the picker view.
 */
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if([pickerView isEqual:tutorPicker]) _TutorTextField.text = [_TutorArray objectAtIndex:row];
    else _TimeTextField.text = [_TimeArray objectAtIndex:row];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 * Method is used when user clicks on a certain date.
 */
-(void) SACalendar:(SACalendar *)calendar didSelectDate:(int)day month:(int)month year:(int)year
{
    NSMutableArray *events = [[NSMutableArray alloc]init];
    NSString *newDay = [[NSString alloc]init];
    //    UIColor *textColor = [[UIColor alloc]init]; LATER WHEN CHANGING TO GREEN IF ACCEPTED
    //Format date correctly to fit datePicker values when looping
    
    
    if(day == 1 || day == 2 || day == 3 || day == 4 || day == 5 || day == 6 || day == 7 || day == 8 || day == 9) newDay = [NSString stringWithFormat:@"0%d", day];
    else newDay = [NSString stringWithFormat:@"%d", day];
    
    //Add each event into NSMutuableArray
    if(_mySavedEvents.count > 0)
    {
        for(int i = 0; i < _myEventDate.count; i++)
        {
            if([[_myEventDate objectAtIndex:i] isEqualToString:[NSString stringWithFormat:@"%d/%@/%d", month, newDay, year]])
            {
                [events addObject:[NSString stringWithFormat:@"%@ @ %@",[_mySavedEvents objectAtIndex:i], [_myEventTime objectAtIndex:i]]];
            }else{
                [events addObject:@"No Events"];
                
            }
        }
    } else {
        [events addObject:@"No Events"];
    }
    //Format events into string to display in message
    NSMutableString *eventString = [[NSMutableString alloc] init];
    for (NSObject * obj in events)
    {
        [eventString appendString:[NSString stringWithFormat:@"\n %@",[obj description]]];
    }
    //Display alert controller
    UIAlertController *myAlertController = [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"Selected Date: %d/%@/%d",month, newDay, year] message:@"" preferredStyle:UIAlertControllerStyleAlert];
    
    //Set color of message text *** NOT WORKING RN WHY?
    NSMutableAttributedString *requestedString = [[NSMutableAttributedString alloc]initWithString:eventString];
    [requestedString addAttribute:NSForegroundColorAttributeName
                            value:[UIColor redColor]
                            range:NSMakeRange(0, [requestedString length])];
    [myAlertController setValue:requestedString forKey:@"attributedMessage"];
    
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"Done" style:UIAlertActionStyleDefault handler:^(UIAlertAction *myAction)
                                    {
                                        //SAVE IN DATABASE HERE*
                                    }];
    
    [myAlertController addAction:defaultAction];
    [self presentViewController:myAlertController animated:YES completion:nil];
    
}

/*
 * Method is used when user slides to the next month or displaying the years
 */
-(void) SACalendar:(SACalendar *)calendar didDisplayCalendarForMonth:(int)month year:(int)year
{
    NSLog(@"%02/%i",month,year);
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

/*
 * Method is used when user clicks on Request button so that they can request appoitments.
 */
- (IBAction)AddButton:(id)sender
{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Request an Appoitment"
                                                                   message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Request" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action)
                                    {
                                        NSString *myEvent = ((UITextField *)[alert.textFields objectAtIndex:0]).text;
                                        NSString *myDate = ((UITextField *)[alert.textFields objectAtIndex:1]).text;
                                        NSString *myTime = ((UITextField *)[alert.textFields objectAtIndex:2]).text;
                                        
                                        [_mySavedEvents addObject:myEvent];
                                        [_myEventDate addObject:myDate];
                                        [_myEventTime addObject:myTime];
                                        
                                        
                                    }];
    
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
    
    //1. Field
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         //Assign the tutorPicker and tutorPickerToolBar to textfield to display properly
         _TutorTextField = textField;
         textField.inputView = tutorPicker;
         textField.inputAccessoryView = tutorPickerToolbar;
         textField.placeholder = NSLocalizedString(@"Select Tutor", @"Select Tutor");
         
     }];
    //2. Field
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         //Assign the datePicker and toolBar to the textfield to display properly
         _DOBTextField = textField;
         textField.inputView = datePicker;
         textField.inputAccessoryView = toolBar;
         textField.placeholder = NSLocalizedString(@"Select Date", @"Select Date");
         
     }];
    //3. Field
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         //Assign the timePicker and timePickerToolbar to the textfield to display properly
         _TimeTextField = textField;
         textField.inputView = timePicker;
         textField.inputAccessoryView = timePickerToolbar;
         textField.placeholder = NSLocalizedString(@"Select Time", @"Select Time");
         
     }];
    
    [alert addAction:cancelAction];
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
    
}
/*
 * Method for Date Picker to display Date properly when selected with correct format
 * in the Date Text Field.
 */
-(void)ShowSelectedDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"MM/dd/YYYY"];
    self.DOBTextField.text = [NSString stringWithFormat:@"%@", [formatter stringFromDate:datePicker.date]];
    [self.DOBTextField resignFirstResponder];
}

@end
