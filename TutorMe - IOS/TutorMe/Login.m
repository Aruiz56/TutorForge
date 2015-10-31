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

@interface Login ()

@end

@implementation Login
@synthesize myWebView;
@synthesize myURL;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //URL To use for WebkitView and make request
    myURL = @"https://cas.stetson.edu";
    NSURL *myNSURL = [NSURL URLWithString:self.myURL];
    NSURLRequest *myRequest = [NSURLRequest requestWithURL:myNSURL];
    
    //Create the webview to be the size of the screen
    [myWebView loadRequest:myRequest];
    
    [self.view addSubview:myWebView];
}

- (void) webViewDidFinishLoad:(UIWebView *)webView {
    if ([webView isEqual:myWebView]) {
        NSString *currentURL = myWebView.request.URL.absoluteString;
        NSLog(@"Current URL: %@", currentURL);
        NSArray *sessionIDWithLabel = [currentURL componentsSeparatedByString:@"="];
        NSString *sessionID = [sessionIDWithLabel objectAtIndex:1];
        NSLog(@"SessionID: %@", sessionID);
        
//        NSHTTPCookie *cookie;
//        NSHTTPCookieStorage *cookieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
//        for(cookie in [cookieJar cookies]) {
//            NSLog(@"%@", cookie);
//        }
    }
}

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
