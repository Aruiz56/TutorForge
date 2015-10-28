//
//  StudentScheduleViewController.m
//  TutorMe
//
//  Created by Christian Valderrama on 10/27/15.
//  Copyright © 2015 soft_dev2_group1. All rights reserved.
//

#import "StudentScheduleViewController.h"

@interface StudentScheduleViewController ()

@end

@implementation StudentScheduleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Create the SACalendar
    SACalendar *myCalendar = [[SACalendar alloc]initWithFrame:CGRectMake(0, 20, 320, 400)];
    
    myCalendar.delegate = self;
    
    [_myView addSubview:myCalendar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
