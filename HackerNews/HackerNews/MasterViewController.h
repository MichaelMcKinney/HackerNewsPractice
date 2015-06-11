//
//  MasterViewController.h
//  HackerNews
//
//  Created by Michael McKinney on 6/8/15.
//  Copyright (c) 2015 Michael McKinney. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StoryCell.h"

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;
@property BOOL firstTimeLoading;

@property NSMutableArray *Stories;
@property (strong,nonatomic) Story *commentStory;



@end

