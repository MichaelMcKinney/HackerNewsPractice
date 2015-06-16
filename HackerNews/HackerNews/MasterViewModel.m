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
/*
-(UIColor *)refreshColor
{

}
-(UIColor *)refreshBGColor
{
    
}*/
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


@end
