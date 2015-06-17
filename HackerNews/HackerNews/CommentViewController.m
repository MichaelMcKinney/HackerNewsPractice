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
    _viewModel = CommentViewModel.new;
    [_viewModel setupCommentStory:story];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _viewModel.sections;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_viewModel getNumRows];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommentCell *cell = (CommentCell *)[tableView dequeueReusableCellWithIdentifier:@"commentCell"];
    

    if (_viewModel.numKids!=0)
    {
        
        [cell FillLabelsFromCommentToSelf:[_viewModel getCommentAtIndex:indexPath.row]];
    }
    
    else
    {
        cell.TitleLabel.text = @"";
        cell.textLabel.text = @"There have been no comments yet...";
    }
    
    return cell;

}



@end
