//
//  TutorRequestsViewController.h
//  TutorMe
//
//  Created by Christian Valderrama on 11/4/15.
//  Copyright © 2015 soft_dev2_group1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TutorRequestsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *myTableView;
@property(nonatomic, retain) NSMutableArray *tableData;

@end
