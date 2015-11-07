//
//  Login.h
//  TutorMe
//
//  Created by Christian Valderrama on 10/13/15.
//  Copyright © 2015 soft_dev2_group1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "UIWebView+AFNetworking.h"

@interface Login : UIViewController <UIWebViewDelegate, NSURLConnectionDelegate>

@property(strong,nonatomic) IBOutlet UIWebView *myWebView;
@property (strong, nonatomic) NSString *myURL;
@property (strong, nonatomic) NSMutableData *responseData;

- (void)getUserInformation;

@end

