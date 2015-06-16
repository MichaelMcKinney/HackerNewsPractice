//
//  CommentCellTableViewCell.m
//  HackerNews
//
//  Created by Michael McKinney on 6/11/15.
//  Copyright (c) 2015 Michael McKinney. All rights reserved.
//

#import "CommentCell.h"

@implementation CommentCell

- (void)awakeFromNib
{
    _viewModel = CommentCellViewModel.new;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)FillLabelsFromCommentToSelf:(Comment *)comment
{
    [_viewModel assignComment:comment];
    
    self.TitleLabel.text = _viewModel.author;
    self.webView.scrollView.scrollEnabled = NO;
    self.webView.scrollView.bounces = NO;
    
    [self.webView loadHTMLString:[_viewModel getCommentText] baseURL:nil];
}





@end
