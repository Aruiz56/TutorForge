//
// Login.m
// TutorMe
//
// Created by Christian Valderrama on 10/13/15.
// Copyright © 2015 soft_dev2_group1. All rights reserved.
//
// Class is used for Main display when user opens app. Also for them
// to login to our services. 

#import "Login.h"
#import "AFNetworking.h"
#import "UIWebView+AFNetworking.h"

@interface Login ()

@end

@implementation Login
@synthesize myWebView;
@synthesize myURL;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //URL To use for WebkitView and make request
//    myURL = @"https://casdev.ad.stetson.edu/cas/login?service=https%3A%2F%2Ftutorme.stetson.edu%2fapi%2fiosauthenticate";
    myURL = @"https://tutorme.stetson.edu/api/students/get?field=FullName&value=Marisa%20Gomez";
    NSURL *myNSURL = [NSURL URLWithString:myURL];
    NSURLRequest *myRequest = [NSURLRequest requestWithURL:myNSURL];
    
    //Load request
//    [myWebView stopLoading];
//    [myWebView loadRequest:myRequest];
    
    //Try using AFNetworking
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    manager.securityPolicy.allowInvalidCertificates = YES;
//
//    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:myRequest];
//    [operation setCompletionBlockWithSuccess: ^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        NSString *stringResponse = [[NSString alloc] initWithData:responseObject
//                                                         encoding:NSUTF8StringEncoding];
//        [myWebView loadHTMLString:stringResponse baseURL:nil];
//        
//    } failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//        [myWebView loadHTMLString:error.localizedDescription baseURL:nil];
//        
//    }];
//    
//    [operation start];
    
    [myWebView loadRequest:myRequest progress:^(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite) {    } success:^NSString * _Nonnull(NSHTTPURLResponse * _Nonnull response, NSString * _Nonnull HTML) {
//        NSLog(@"JSON: %@", HTML);
        return HTML;
    } failure:^(NSError * _Nonnull error) {
        NSLog(@"Failed with error: %@", error);
    }];
}

#pragma mark - UIWebView Delegate methods

- (void) webViewDidFinishLoad:(UIWebView *)webView {
    if ([webView isEqual:myWebView]) {
        NSString *currentURL = myWebView.request.URL.absoluteString;
        NSLog(@"Current URL: %@", currentURL);
        NSArray *sessionIDWithLabel = [currentURL componentsSeparatedByString:@"="];
        NSString *sessionID = [sessionIDWithLabel objectAtIndex:1];
        NSLog(@"SessionID: %@", sessionID);
    
//        [self getUserInformation];
    }
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"Error: %@", error);
}

//- (void)getUserInformation {
//    //Connect to server and database
//    NSMutableURLRequest *request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://tutorme.stetson.edu/student"]];
//    
//    //Setting up for response
//    NSURLResponse *response;
//    NSError *err;
//    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];
//    
//    //Printing response
//    id json = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error: nil];
//
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)unwindToMainMenu:(UIStoryboardSegue*)sender
{
    UIViewController *sourceViewController = sender.sourceViewController;
    // Pull any data from the view controller which initiated the unwind segue.
}

@end
