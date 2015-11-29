//
//  AdminAddTutorScheduleViewController.h
//  TutorMe
//
//  Created by Marisa Gomez on 11/28/15.
//  Copyright © 2015 soft_dev2_group1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdminAddTutorScheduleViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *addTimeSlotButton;
@property (weak, nonatomic) IBOutlet UILabel *sundayLabel;
@property (weak, nonatomic) IBOutlet UILabel *mondayLabel;
@property (weak, nonatomic) IBOutlet UILabel *tuesdayLabel;
@property (weak, nonatomic) IBOutlet UILabel *wednesdayLabel;
@property (weak, nonatomic) IBOutlet UILabel *thursdayLabel;
@property (weak, nonatomic) IBOutlet UILabel *fridayLabel;
@property (weak, nonatomic) IBOutlet UILabel *saturdayLabel;

-(void)addTutorInformation:(id)sender;

@end
