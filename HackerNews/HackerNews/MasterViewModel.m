//
//  MasterViewModel.m
//  HackerNews
//
//  Created by Michael McKinney on 6/15/15.
//  Copyright (c) 2015 Michael McKinney. All rights reserved.
//

#import "MasterViewModel.h"

@implementation MasterViewModel

-(id)init
{
    if ((self=[super init]))
    {
        self.firstTimeLoading = YES; //keeps track of the first time for hte refresh property
        self.count = 30;
        [self loadData];
        self.commentStory = nil;
        self.sections = 1;
    }
    return self;
}
-(void)sortCellsByTime
{
    [self.Stories sortUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"time" ascending:YES]]];
}

-(void)sortCellsByScore;
{
    [self.Stories sortUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"score" ascending:NO]]];

}

-(void)loadData
{
    self.Stories = [HackerNewsAPI getTopStories:self.count];
}
-(void)setViewModelCommentStoryFrom:(id)sender andTableView:(UITableView*)tableView
{
    CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:tableView];
    NSIndexPath *indexPath = [tableView indexPathForRowAtPoint:buttonPosition];
    Story *object = _Stories[indexPath.row];
    _commentStory = object;
}



@end
