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
-(CommentCell *)setupCell:(CommentCell *)cell WithIndexPath:(NSIndexPath *)indexPath
{
    if (_numKids!=0)
    {
        Comment *comment = Comment.new;
        comment = [HackerNewsAPI getCommentFromID:[_commentStory.kids[indexPath.row] intValue]]; //use hacker news call
        [cell FillLabelsFromCommentToSelf:comment];
    }
    
    else
    {
        cell.TitleLabel.text = @"";
        cell.textLabel.text = @"There have been no comments yet...";
    }

    return cell;
}

@end
