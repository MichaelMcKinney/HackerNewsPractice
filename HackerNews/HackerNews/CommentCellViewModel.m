//
//  CommentCellViewModel.m
//  HackerNews
//
//  Created by Michael McKinney on 6/16/15.
//  Copyright (c) 2015 Michael McKinney. All rights reserved.
//

#import "CommentCellViewModel.h"

@implementation CommentCellViewModel

-(void)assignComment:(Comment *)comment
{
    _comment = comment;
    _author = _comment.author;
}

-(NSString *)getCommentText
{
    return _comment.text;
}

@end
