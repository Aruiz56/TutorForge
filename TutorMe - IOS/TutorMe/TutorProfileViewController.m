//
//  TutorProfileViewController.m
//  TutorMe
//
//  Created by Marisa Gomez on 11/29/15.
//  Copyright © 2015 soft_dev2_group1. All rights reserved.
//

#import "TutorProfileViewController.h"
#import "Tutor.h"

@interface TutorProfileViewController ()

@end

@implementation TutorProfileViewController
@synthesize tutor;
@synthesize removeTutorBarButton;
@synthesize fullNameLabel;
@synthesize studentIDLabel;
@synthesize departmentLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
   
    removeTutorBarButton.action = @selector(removeTutor:);
    
    fullNameLabel.text = tutor.fullname;
    studentIDLabel.text = tutor.studentID;
    departmentLabel.text = tutor.department;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)removeTutor:(id)sender {
//    //Remove tutor
    //Connect to server and database
    NSMutableURLRequest *removeTutorRequest =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://tutorme.stetson.edu/api/administrator/removeTutor"]]];
    [removeTutorRequest setHTTPMethod:@"POST"];
    
    NSString *postBodyStr = [NSString stringWithFormat:@"ID=%@", tutor.studentID];
    
    NSData *encodedPostBody = [postBodyStr dataUsingEncoding:NSASCIIStringEncoding];
    [removeTutorRequest setHTTPBody:encodedPostBody];
    [removeTutorRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    //Setting up for response
    NSURLResponse *requestTutorResponse;
    NSError *requestTutorError;
    NSData *requestTutorData = [NSURLConnection sendSynchronousRequest:removeTutorRequest returningResponse:&requestTutorResponse error:&requestTutorError];
    
    //Get response
    id json = [NSJSONSerialization JSONObjectWithData:requestTutorData options:NSJSONReadingMutableContainers error: nil];
    NSArray *responseJSON = [json objectForKey:@"success"];
    
    if (responseJSON[0]) {
        [self performSegueWithIdentifier:@"unwindToTutors" sender:self];
    }
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
