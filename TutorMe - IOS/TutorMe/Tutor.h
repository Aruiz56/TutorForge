//
//  Tutor.h
//  TutorMe
//
//  Created by Marisa Gomez on 11/29/15.
//  Copyright © 2015 soft_dev2_group1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tutor : NSObject
@property (strong, nonatomic) NSString *fullname;
@property (strong, nonatomic) NSString *studentID;
@property (strong, nonatomic) NSMutableDictionary *schedule;

@end
