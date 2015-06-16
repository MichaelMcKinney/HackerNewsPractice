//
//  MasterViewController.h
//  HackerNews
//
//  Created by Michael McKinney on 6/8/15.
//  Copyright (c) 2015 Michael McKinney. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StoryCell.h"
#import "MasterViewModel.h"
#import "DetailViewController.h"

@class MasterViewModel;
@interface MasterViewController : UITableViewController <StoryCellDelegate>

@property (strong, nonatomic) DetailViewController *detailViewController; //able to pass contents to article viewer

@property (strong,nonatomic) IBOutlet UIBarButtonItem *timeButton;
@property (strong,nonatomic) IBOutlet UIBarButtonItem *scoreButton;

@property (strong, nonatomic) MasterViewModel *viewModel;

-(IBAction)sortCellsByTime:(id)sender;
-(IBAction)sortCellsByScore:(id)sender;

@end

