//
//  CommentViewModel.m
//  HackerNews
//
//  Created by Michael McKinney on 6/16/15.
//  Copyright (c) 2015 Michael McKinney. All rights reserved.
//

#import "CommentViewModel.h"

@implementation CommentViewModel
-(id)init
{
    if ((self=[super init]))
    {
        _commentStory = Story.new;
        _numKids = [_commentStory.kids count];
        _sections = 1;
    }
    return self;
}



-(void)setupCommentStory:(Story*)story
{
    _commentStory = story;
    _numKids = [_commentStory.kids count];
}

-(NSInteger)getNumRows
{
    if (_numKids!=0)
    {
        return _numKids;
    }
    else
    {
        return 1;
    }
}
-(Comment *)getCommentAtIndex:(NSInteger)Index
{
    Comment *comment = [HackerNewsAPI getCommentFromID:[_commentStory.kids[Index] intValue]];
    return comment;
}

@end
