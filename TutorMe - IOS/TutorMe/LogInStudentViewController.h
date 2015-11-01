//
//  LogInStudentViewController.h
//  TutorMe
//
//  Created by Marisa Gomez on 10/29/15.
//  Copyright © 2015 soft_dev2_group1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogInStudentViewController : UIViewController <UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) NSMutableArray *searchResults;
@property (weak, nonatomic) IBOutlet UITableView *searchResultsTableView;


@end
