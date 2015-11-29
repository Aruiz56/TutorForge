//
//  AdminAddTutorViewController.m
//  TutorMe
//
//  Created by Marisa Gomez on 11/16/15.
//  Copyright © 2015 soft_dev2_group1. All rights reserved.
//

#import "AdminAddTutorViewController.h"
#import "Tutor.h"

@interface AdminAddTutorViewController ()

@end

@implementation AdminAddTutorViewController
@synthesize tutors;
@synthesize tutor;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    tutors = [[NSMutableArray alloc] init];
    tutor = [[Tutor alloc] init];
    NSData *encodedTutors = [NSKeyedArchiver archivedDataWithRootObject:tutors];
    NSData *encodedTutor = [NSKeyedArchiver archivedDataWithRootObject:tutor];
    [defaults setObject:encodedTutors forKey:@"tutors"];
    [defaults setObject:encodedTutor forKey:@"tutor"];
    [defaults synchronize];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

- (IBAction)unwindToTutors:(UIStoryboardSegue *)unwindSegue {
    
}


@end
