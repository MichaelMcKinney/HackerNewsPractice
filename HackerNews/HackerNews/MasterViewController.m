//
//  MasterViewController.m
//  HackerNews
//
//  Created by Michael McKinney on 6/8/15.
//  Copyright (c) 2015 Michael McKinney. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "CommentViewController.h"
#import "HackerNewsAPI.h"


@implementation MasterViewController

-(void)awakeFromNib
{
    self.viewModel = MasterViewModel.new;
    [self loadData]; //just get array of stories here from view model
    NSLog(@"Did Awake");
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //return 30;
    return self.viewModel.sections;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.viewModel.count;
}

-(void)viewDidLoad //make buttons, assign colors, make refresh icon at scroll down
{
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:self.timeButton,self.scoreButton, nil];
    self.navigationController.toolbarHidden = YES;
    self.refreshControl = [[UIRefreshControl alloc] init];
    
    self.refreshControl.backgroundColor = [[ThemeManager sharedManager] getColorForKey:@"refreshBG"]; //make connection to theme Manager Method
    self.refreshControl.tintColor = [[ThemeManager sharedManager] getColorForKey:@"refreshIcon"];
    [self.refreshControl addTarget:self action:@selector(Refresh) forControlEvents:UIControlEventValueChanged];
}
-(void)loadData //pull top stories from json, create the story objects
{
    [self.tableView reloadData];
}

-(IBAction)sortCellsByTime:(id)sender //is called by time button, does what it says
{
    [self.viewModel sortCellsByTime];
    [self.tableView reloadData];
}
-(IBAction)sortCellsByScore:(id)sender //is called by chart button, does what it says
{
    [self.viewModel sortCellsByScore];
    [self.tableView reloadData];
}
-(void)Refresh //stops refresh icon from spinning and reloads all data from json
{
    //NSLog(@"Did Refresh");
    [self.refreshControl endRefreshing];
    [self loadData];
}
          
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath //assign cells from array of stories
{
    StoryCell *cell = (StoryCell *)[tableView dequeueReusableCellWithIdentifier:@"StoryCell"];
    NSLog([NSString stringWithFormat:@"row is %ld",(long)indexPath.row]);
    [cell FillLabelsFromStoryToSelf:self.viewModel.Stories[indexPath.row]];
    
    [cell.button addTarget:self action:@selector(pressedCommentsFrom:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

-(void)pressedCommentsFrom:(id)sender //locates which comments button was pressed and performs a segue
{
    CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:buttonPosition];
    Story *object = self.viewModel.Stories[indexPath.row];
    self.viewModel.commentStory = object;
    [self performSegueWithIdentifier:@"showComments" sender:sender];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender //sends proper info to the arrival scene
{
    if ([[segue identifier] isEqualToString:@"showDetail"])
    {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Story *object = self.viewModel.Stories[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        [controller setupStoryValue:object];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
    else if ([[segue identifier] isEqualToString:@"showComments"])
    {
        CommentViewController *controller = (CommentViewController *)[[segue destinationViewController] topViewController];
        [controller setupCommentStoryValue:self.viewModel.commentStory];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

@end






