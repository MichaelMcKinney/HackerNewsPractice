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
    //initialize
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)FillLabelsFromCommentToSelf:(Comment *)comment
{
    self.TitleLabel.text = comment.author;
    self.webView.scrollView.scrollEnabled = NO;
    self.webView.scrollView.bounces = NO;
    
    [self.webView loadHTMLString:comment.text baseURL:nil];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    self.contentHeight = self.webView.scrollView.contentSize.height;
}


@end
