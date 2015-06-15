//
//  StoryCell.m
//  HackerNews
//
//  Created by Michael McKinney on 6/8/15.
//  Copyright (c) 2015 Michael McKinney. All rights reserved.
//

#import "ColorUtil.h"
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
    

    NSDictionary *styles = [ThemeManager sharedManager].styles;
    
    NSString *titleColor = [styles objectForKey:@"cellTitle"];
    NSString *subColor = [styles objectForKey:@"cellSubtitle"];
    NSString *BGColor = [styles objectForKey:@"cellDeselected"];
    NSString *buttonTextColor = [styles objectForKey:@"commentButtonText"];
    NSString *buttonColor = [styles objectForKey:@"commentButtonBG"];
    NSString *BGSelectedColor = [styles objectForKey:@"cellSelected"];

    
    UIView *bgColorView = [[UIView alloc]init];
    bgColorView.backgroundColor = [ColorUtil colorFromHexString:BGSelectedColor];
    [self setSelectedBackgroundView:bgColorView];
    
    self.backgroundColor = [ColorUtil colorFromHexString:BGColor];
    
    self.TitleLabel.textColor = [ColorUtil colorFromHexString:titleColor];
    self.URLLabel.textColor = [ColorUtil colorFromHexString:subColor];
    self.ScoreLabel.textColor = self.URLLabel.textColor;
    self.AuthorLabel.textColor = self.URLLabel.textColor;
    
    [self.button setTitleColor:[ColorUtil colorFromHexString:buttonTextColor] forState:UIControlStateNormal];
    [self.button setBackgroundColor:[ColorUtil colorFromHexString:buttonColor]];
}




@end
