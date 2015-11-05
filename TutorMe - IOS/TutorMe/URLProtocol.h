//
//  URLProtocol.h
//  TutorMe
//
//  Created by Marisa Gomez on 11/5/15.
//  Copyright © 2015 soft_dev2_group1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface URLProtocol : NSURLProtocol <NSURLConnectionDelegate>

@property (nonatomic, strong) NSURLConnection *connection;

@end
