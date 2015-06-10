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
}




@end
