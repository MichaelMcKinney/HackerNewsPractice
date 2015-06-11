//
//  CommentViewController.m
//  HackerNews
//
//  Created by Michael McKinney on 6/10/15.
//  Copyright (c) 2015 Michael McKinney. All rights reserved.
//

#import "CommentViewController.h"

@implementation CommentViewController


-(void)setupCommentStoryValue:(Story *)story
{
    NSLog([NSString stringWithFormat:@"setting up story with ID %d",story.ID]);
    self.commentStory = story;
}

@end
