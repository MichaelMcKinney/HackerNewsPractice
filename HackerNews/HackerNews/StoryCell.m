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
    
-(void)FillLabelsFromStoryToSelf:(Story *)story //Copy ALL Properties from the Story to self

{
    self.TitleLabel.text = story.title;
    self.AuthorLabel.text = story.author;
    self.ScoreLabel.text = [NSString stringWithFormat:@"%d", story.score];
    self.URLLabel.text = story.url.host;
    self.TitleLabel.adjustsFontSizeToFitWidth = NO;
    self.TitleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
   
    [self.button setTitle:[NSString stringWithFormat:@"%lu",(unsigned long)[story.kids count]] forState:UIControlStateNormal];
    self.button.titleLabel.font = [UIFont systemFontOfSize:18.0];
    
    
    
    
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




@end
