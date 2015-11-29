//
//  AdminAddTutorInformationViewController.h
//  TutorMe
//
//  Created by Marisa Gomez on 11/23/15.
//  Copyright © 2015 soft_dev2_group1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tutor.h"

@interface AdminAddTutorInformationViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIBarButtonItem *nextBarButton;
@property (weak, nonatomic) IBOutlet UITextField *fullNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *studentIdTextField;
@property (weak, nonatomic) IBOutlet UIPickerView *departmentPicker;
@property (strong, nonatomic) NSMutableArray *subjects;
@property (strong, nonatomic) NSString *subject;
@property (strong, nonatomic) Tutor *tutor;

-(void)addTutorInformation:(id)sender;

@end
