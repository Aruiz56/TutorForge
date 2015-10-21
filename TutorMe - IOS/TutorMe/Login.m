//
//  Login.m
//  TutorMe
//
//  Created by Christian Valderrama on 10/13/15.
//  Copyright © 2015 soft_dev2_group1. All rights reserved.
//
// Class is used for Main display when user opens app. Also for them
// to login to our services. 

#import "Login.h"

@interface Login ()

@end

@implementation Login

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //URL To use for WebkitView
    self.myURL = @"https://cas.stetson.edu";
    
    NSURL *myNSURL = [NSURL URLWithString:self.myURL];
    NSURLRequest *myRequest = [NSURLRequest requestWithURL:myNSURL];
    
    //Create the webview to be the size of the screen
    _myWebView = [[WKWebView alloc] initWithFrame:self.view.frame];
    
    [_myWebView loadRequest:myRequest];
    
    
    _myWebView.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_myWebView]; //add it to the view
    
    
    
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
