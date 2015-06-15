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
#import "ColorUtil.h"
#import "HackerNewsAPI.h"


@implementation MasterViewController

-(void)awakeFromNib
{
    self.firstTimeLoading = YES;
    [self loadData];
    NSLog(@"Did Awake");
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.Stories count];
}

-(void)viewDidLoad //make buttons, assign colors, make refresh icon at scroll down
{
        
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:self.timeButton,self.scoreButton, nil];
    
    self.navigationController.toolbarHidden = YES;
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    
    NSDictionary *styles = [ThemeManager sharedManager].styles;
    NSString *refreshBG = [styles objectForKey:@"refreshBG"];
    NSString *refreshIcon = [styles objectForKey:@"refreshIcon"];
    
    self.refreshControl.backgroundColor = [ColorUtil colorFromHexString:refreshBG];
    self.refreshControl.tintColor = [ColorUtil colorFromHexString:refreshIcon];
    [self.refreshControl addTarget:self action:@selector(Refresh) forControlEvents:UIControlEventValueChanged];
   
    
}
-(void)loadData //pull top stories from json, create the story objects
{
    self.Stories = [HackerNewsAPI getTopStories:30];
    if (self.firstTimeLoading == NO)
    {
        [self.tableView reloadData];
    }
    self.firstTimeLoading = NO;
}

-(IBAction)sortCellsByTime:(id)sender //is called by time button, does what it says
{
    [self.Stories sortUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"time" ascending:YES]]];
    [self.tableView reloadData];
}
-(IBAction)sortCellsByScore:(id)sender //is called by chart button, does what it says
{
    [self.Stories sortUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"score" ascending:NO]]];
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
    [cell FillLabelsFromStoryToSelf:self.Stories[indexPath.row]];
    [cell.button addTarget:self action:@selector(pressedCommentsFrom:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

-(void)pressedCommentsFrom:(id)sender //locates which comments button was pressed and performs a segue
{
    CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:buttonPosition];
    Story *object = self.Stories[indexPath.row];
    self.commentStory = object;
    [self performSegueWithIdentifier:@"showComments" sender:sender];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender //sends proper info to the arrival scene
{
    if ([[segue identifier] isEqualToString:@"showDetail"])
    {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Story *object = self.Stories[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        [controller setupStoryValue:object];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
    else if ([[segue identifier] isEqualToString:@"showComments"])
    {
        CommentViewController *controller = (CommentViewController *)[[segue destinationViewController] topViewController];
        [controller setupCommentStoryValue:self.commentStory];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

@end






