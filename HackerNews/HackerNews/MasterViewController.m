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


@implementation MasterViewController

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        self.Stories = [NSMutableArray array];
        self.firstTimeLoading = YES;
        [self loadData];
        /* THE WORST WAY TO DO THIS
        
         
        NSArray *InitialIDs = [ret componentsSeparatedByString:@", "];
        
        NSString *withoutBracket1;
        NSString *withoutBracket2;

        if ([InitialIDs[0] length] > 0)
        {
            //NSLog(InitialIDs[0]);
            withoutBracket1 = [InitialIDs[0] substringFromIndex:2];
            
            NSString *last = InitialIDs[[InitialIDs count]-1];
            //NSLog(last);
            withoutBracket2 = [last substringToIndex:[last length]-2];
        }
        
        else
        {
            NSLog(@"NO ITEMS PULLED");
            
        }
        
        //NSLog(withoutBracket1);
        //NSLog(withoutBracket2);
        
        int i=0;
        Story *A;
        
        while(i<5)//[InitialIDs count])
        {
            if (i==0)
            {
                A = [Story newStoryWithID:[withoutBracket1 intValue]];
               NSLog([NSString stringWithFormat:@"%d at index %lu",A.ID,(unsigned long)i]);
            }
            else if(i==[InitialIDs count]-1)
            {
                A = [Story newStoryWithID:[withoutBracket2 intValue]];
                NSLog([NSString stringWithFormat:@"%d at index %lu",A.ID,(unsigned long)i]);
            }
            else
            {
                A = [Story newStoryWithID:[InitialIDs[i] intValue]];
                NSLog([NSString stringWithFormat:@"%d at index %lu",A.ID,(unsigned long)i]);
            }
            [self.Stories addObject:A];
            i++;
        }
        
        Story *story = [Story newStoryWithTitle:@"wubba" Score:9 Author:@"Mike Tyson" URL:@"www.wubbawubba.com"];

        Story *story2 = [Story newStoryWithTitle:@"Yuper" Score:201 Author:@"Gregory Smith" URL:@"www.alligators.com"];
        
        Story *story3 = [Story newStoryWithTitle:@"It's Gotta Be Said..." Score:99 Author:@"The Real Author" URL:@"www.LionsDontLie.com"];
        
        [self.Stories addObject:story];
        [self.Stories addObject:story2];
        [self.Stories addObject:story3];
        story.ID = 8863;
        [story getInfoFromID];
        //[story getHTMLFrom:(NSString *)];
   
        story.title = @"wubba";
        story.author = @"Mike Tyson";
        story.url = @"www.wubbawubba.com";
        story.score = 5;

        story.title = @"YUpper";
        story.author = @"Gregory Smith";
        story.url = @"www.alligators.com";
        story.score = 201;
     
        story.title = @"It's Gotta Be Said...";
        story.author = @"The Real Author";
        story.url = @"www.LionsDontLie.com";
        story.score = 99;
    */
    }
    NSLog(@"FINISHED LOADING");
    return self;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.Stories count];
}

-(void)viewDidLoad
{
    self.refreshControl = [[UIRefreshControl alloc] init];
    
    NSDictionary *styles = [ThemeManager sharedManager].styles;
    NSString *refreshBG = [styles objectForKey:@"refreshBG"];
    NSString *refreshIcon = [styles objectForKey:@"refreshIcon"];
    
    self.refreshControl.backgroundColor = [AppDelegate colorFromHexString:refreshBG];
    self.refreshControl.tintColor = [AppDelegate colorFromHexString:refreshIcon];
    [self.refreshControl addTarget:self action:@selector(Refresh) forControlEvents:UIControlEventValueChanged];
   
    
}
-(void)loadData
{
    NSURL *U = [NSURL URLWithString:@"https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty"];
    NSData *data = [NSData dataWithContentsOfURL:U];
    //NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    
    //NSData *jsonData = [searchResultString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSArray *idArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    int i = 0;
    Story *A;
    while(i<[idArray count]-470)//[InitialIDs count])
    {
        
        A = [Story newStoryWithID:[idArray[i] intValue]];
        //NSLog([NSString stringWithFormat:@"%d at index %lu",A.ID,(unsigned long)i]);
        
        if (self.firstTimeLoading)
        {
            [self.Stories addObject:A];
        }
        else
        {
            [self.Stories replaceObjectAtIndex:i withObject:A];
        }
        i++;
    }
    //NSLog([NSString stringWithFormat:@"%lu",[self.Stories count]]);
    if (self.firstTimeLoading == NO)
    {
        [self.tableView reloadData];
    }
    self.firstTimeLoading = NO;
}
-(void)Refresh
{
    //NSLog(@"Did Refresh");
    [self.refreshControl endRefreshing];
    [self loadData];
}
          
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StoryCell *cell = (StoryCell *)[tableView dequeueReusableCellWithIdentifier:@"StoryCell"];
    [cell FillLabelsFromStoryToSelf:self.Stories[indexPath.row]];
    [cell.button addTarget:self action:@selector(pressedCommentsFrom:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

-(void)pressedCommentsFrom:(id)sender
{
    CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:buttonPosition];
    Story *object = self.Stories[indexPath.row];
    self.commentStory = object;
    [self performSegueWithIdentifier:@"showComments" sender:sender];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
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
}//working???

@end






