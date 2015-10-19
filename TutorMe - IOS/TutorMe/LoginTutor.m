//
//  LoginTutor.m
//  TutorMe
//
//  Created by Christian Valderrama on 10/18/15.
//  Copyright © 2015 soft_dev2_group1. All rights reserved.
//

#import "LoginTutor.h"

@interface LoginTutor ()

@end

@implementation LoginTutor

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 * Method is used for when a user clicks on the login button.
 * Checks to see if they have both fields entered and checks
 * to make sure they are a user/student.
 */
- (IBAction)LoginButton:(id)sender {
    
    if([_myUsernameTextField.text isEqualToString:@""] || [_myPasswordTextField.text isEqualToString:@""])
    {
        //Alert Box to display error
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                       message:@"Both fields must be filled" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
        
        [alert addAction:cancelAction];
        [self presentViewController:alert animated:YES completion:nil];
    }else {
        
        NSString *myUsername = _myUsernameTextField.text;
        NSString *myPassword = _myPasswordTextField.text;
        
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
