//
//  StoryViewModel.m
//  HackerNews
//
//  Created by Michael McKinney on 6/16/15.
//  Copyright (c) 2015 Michael McKinney. All rights reserved.
//

#import "StoryViewModel.h"

@implementation StoryViewModel

-(void)assignStory:(Story *)story
{
    _story = story;
    
    _author = _story.author;
    _descendants = _story.descendants;
    _ID = _story.ID;
    _kids = _story.kids;
    _score = _story.score;
    _time = _story.time;
    _title = _story.title;
    _type = _story.type;
    _text = _story.text;
    _url = _story.url;
    _json = _story.json;
}

-(NSString *)getScoreText
{
    return [NSString stringWithFormat:@"%d", _score];
}

-(NSString *)getURLText
{
    return _url.host;
}
-(NSString *)getButtonText
{
    return [NSString stringWithFormat:@"%lu",(unsigned long)[_kids count]];
}



/*self.TitleLabel.text = _viewModel.title;
 self.AuthorLabel.text = _viewModel.author;
 self.ScoreLabel.text = [NSString stringWithFormat:@"%d", story.score];
 self.URLLabel.text = story.url.host;
 self.TitleLabel.adjustsFontSizeToFitWidth = NO;
 self.TitleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
 
 [self.button setTitle:[NSString stringWithFormat:@"%lu",(unsigned long)[story.kids count]] forState:UIControlStateNormal];
 
*/


@end
