//
//  CommentViewController.m
//  HackerNews
//
//  Created by Michael McKinney on 6/10/15.
//  Copyright (c) 2015 Michael McKinney. All rights reserved.
//

#import "CommentViewController.h"
#import "CommentCell.h"

@implementation CommentViewController


-(void)setupCommentStoryValue:(Story *)story
{
    self.commentStory = story;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([self.commentStory.kids count]!=0)
    {
        return [self.commentStory.kids count];
    }
    else
        return 1;
}

  

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommentCell *cell = (CommentCell *)[tableView dequeueReusableCellWithIdentifier:@"commentCell"];
    if ([self.commentStory.kids count]!=0)
    {
        Comment *comment = Comment.new;
        comment = [Comment newCommentWithID:[self.commentStory.kids[indexPath.row] intValue]];
        [cell FillLabelsFromCommentToSelf:comment];
        
        //NSNumber *greg = [NSNumber numberWithFloat:cell.contentHeight];
        //NSLog([NSString stringWithFormat:@"%@",greg]);
        //[self.heightArray insertObject:greg atIndex:indexPath.row];
        
        return cell;
    }
    else
    {
        cell.TitleLabel.text = @"";
        cell.textLabel.text = @"There have been no comments yet...";
        
        return cell;
    }
        
}
/*
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    float ok = [self.heightArray[indexPath.row] floatValue];
    CGFloat alright = (CGFloat)ok;
    return alright;
}
/*
 DisplayComments(Article,Indent)
    if ([Article.comments count]==0)
    {
        return;
    }
    else
    {
        int i=0;
        while(i<[Article.
    }

 
*/

@end
