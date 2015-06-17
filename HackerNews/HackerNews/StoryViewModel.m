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
    
}

-(NSString *)getScoreText
{
    return [NSString stringWithFormat:@"%d", _story.score];
}

-(NSString *)getURLText
{
    return _story.url.host;
}
-(NSString *)getButtonText
{
    return [NSString stringWithFormat:@"%lu",(unsigned long)[_story.kids count]];
}
-(NSString *)getTitleText
{
    return _story.title;
}

-(NSString *)getAuthorText
{
    return _story.author;
}





@end
