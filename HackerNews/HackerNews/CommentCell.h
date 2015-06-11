//
//  CommentCellTableViewCell.h
//  HackerNews
//
//  Created by Michael McKinney on 6/11/15.
//  Copyright (c) 2015 Michael McKinney. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Comment.h"

@interface CommentCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *TitleLabel;

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (assign, nonatomic) CGFloat contentHeight;

-(void)FillLabelsFromCommentToSelf:(Comment *)comment;

@end
