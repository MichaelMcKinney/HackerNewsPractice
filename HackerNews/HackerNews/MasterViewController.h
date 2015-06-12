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

@property (strong, nonatomic) DetailViewController *detailViewController; //able to pass contents to article viewer
@property BOOL firstTimeLoading; //keeps track of the first time for hte refresh property

@property NSMutableArray *Stories; //holds all of the stories we are looking at
@property (strong,nonatomic) Story *commentStory;

@property (strong,nonatomic) IBOutlet UIBarButtonItem *timeButton;
@property (strong,nonatomic) IBOutlet UIBarButtonItem *scoreButton;


-(IBAction)sortCellsByTime:(id)sender;
-(IBAction)sortCellsByScore:(id)sender;

@end

