//
//  DetailViewModel.m
//  HackerNews
//
//  Created by Michael McKinney on 6/16/15.
//  Copyright (c) 2015 Michael McKinney. All rights reserved.
//

#import "DetailViewModel.h"

@implementation DetailViewModel

-(id)init
{
    if ((self=[super init]))
    {
        _story = nil;
        
        
    }
    return self;
}


-(void)setupStory:(Story *)story
{
    if (_story != story)
    {
        _story = story;
    }
}

-(NSString *)getText
{
    return _story.text;
}

-(NSURL *)getURL
{
    return _story.url;
}

@end
