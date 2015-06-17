//
//  StoryCell.m
//  HackerNews
//
//  Created by Michael McKinney on 6/8/15.
//  Copyright (c) 2015 Michael McKinney. All rights reserved.
//

#import "StoryCell.h"

@implementation StoryCell

/* TRAITS FOR REFERENCE
 @property (strong, nonatomic)  NSString *title;
 @property (strong, nonatomic)  NSString *score;
 @property (strong, nonatomic)  NSString *author;
 @property (strong, nonatomic)  NSString *url;
*/
-(void)awakeFromNib
{
    _viewModel = StoryViewModel.new;
}

-(void)FillLabelsFromStoryToSelf:(Story *)story //Copy ALL Properties from the Story to self

{
    [_viewModel assignStory:story];
    
    self.TitleLabel.text = [_viewModel getTitleText]; // property of the storyviewModel for these
    self.AuthorLabel.text = [_viewModel getAuthorText];
    self.ScoreLabel.text = [_viewModel getScoreText];
    self.URLLabel.text = [_viewModel getURLText];
    
    self.TitleLabel.adjustsFontSizeToFitWidth = NO;
    self.TitleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
   
    [self.button setTitle:[_viewModel getButtonText] forState:UIControlStateNormal];
    self.button.titleLabel.font = [UIFont systemFontOfSize:18.0];
    
    //[_button addTarget:_delegate action:@selector(didSelectFromSender:) forControlEvents:UIControlEventTouchUpInside];

    
    
    
#pragma mark - COLORS
    
    UIView *bgColorView = [[UIView alloc]init];
    bgColorView.backgroundColor = [[ThemeManager sharedManager] getColorForKey:@"cellSelected"];
    [self setSelectedBackgroundView:bgColorView];
    
    self.backgroundColor = [[ThemeManager sharedManager] getColorForKey:@"cellDeselected"];
    
    self.TitleLabel.textColor = [[ThemeManager sharedManager] getColorForKey:@"cellTitle"];
    self.URLLabel.textColor = [[ThemeManager sharedManager] getColorForKey:@"cellSubtitle"];
    self.ScoreLabel.textColor = self.URLLabel.textColor;
    self.AuthorLabel.textColor = self.URLLabel.textColor;
    
    [self.button setTitleColor:[[ThemeManager sharedManager] getColorForKey:@"commentButtonText"] forState:UIControlStateNormal];
    [self.button setBackgroundColor:[[ThemeManager sharedManager] getColorForKey:@"commentButtonBG"]];
}
/*
-(void)setupButtonWithTarget:(id)target Action:(SEL)action
{
    [_button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}
*/

@end
