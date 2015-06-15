//
//  HackerNewsAPI.m
//  HackerNews
//
//  Created by Michael McKinney on 6/15/15.
//  Copyright (c) 2015 Michael McKinney. All rights reserved.
//

#import "HackerNewsAPI.h"
@interface HackerNewsAPI()
+(NSDictionary *)requestJSONDictionaryUsingID:(int)ID;
@end

@implementation HackerNewsAPI

+(NSMutableArray *)getTopStories:(int)numberOfStories
{
    NSMutableArray *Stories = NSMutableArray.new;
    
    NSURL *U = [NSURL URLWithString:@"https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty"];
    NSData *data = [NSData dataWithContentsOfURL:U];
    NSError *error;
    NSArray *idArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];

    int i = 0;
    while(i<[idArray count]-(500-numberOfStories))//[InitialIDs count])
    {
        
        //NSLog([NSString stringWithFormat:@"%d at index %lu",A.ID,(unsigned long)i]);
        
        [Stories addObject:[self getStoryFromID:[idArray[i] intValue]]];
    
        i++;
    }
    return Stories;
}

+(Story *)getStoryFromID:(int)ID
{
    Story *story = Story.new;
    
    NSDictionary *jsonDict = [self requestJSONDictionaryUsingID:ID];
    
    story.ID = ID;
    story.json = jsonDict;
    story.author = [jsonDict objectForKey:@"by"];
    story.title = [jsonDict objectForKey:@"title"];
    story.type = [jsonDict objectForKey:@"type"];
    story.url = [NSURL URLWithString:[jsonDict objectForKey:@"url"]];
    story.score = [[jsonDict objectForKey:@"score"] intValue];
    story.time = [[jsonDict objectForKey:@"time"] intValue];
    story.time = [[jsonDict objectForKey:@"descendants"] intValue];
    story.kids = [jsonDict objectForKey:@"kids"];                        //make the array here
    if ([story.type  isEqualToString:@"job"] || [story.type isEqualToString:@"story"])
    {story.text = [jsonDict objectForKey:@"text"];}
    
    return story;
}
+(NSDictionary *)requestJSONDictionaryUsingID:(int)ID
{
    NSURL *U = [NSURL URLWithString:[NSString stringWithFormat:@"https://hacker-news.firebaseio.com/v0/item/%d.json?print=pretty",ID]];
    NSData *data = [NSData dataWithContentsOfURL:U];
    NSError *error;
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    return jsonDict;
}

+(Comment *)getCommentFromID:(int)ID
{
    Comment *comment = Comment.new;
    
    NSDictionary *jsonDict = [self requestJSONDictionaryUsingID:ID];
    
    comment.ID = ID;
    comment.json = jsonDict;
    comment.author = [jsonDict objectForKey:@"by"];
    comment.kids = [jsonDict objectForKey:@"kids"];
    comment.parent = [[jsonDict objectForKey:@"parent"] intValue];
    comment.time = [[jsonDict objectForKey:@"time"] intValue];
    comment.type = [jsonDict objectForKey:@"type"];
    comment.text = [jsonDict objectForKey:@"text"];
    if(!comment.author)
    {
        comment.author = @"[Deleted]";
    }
    if(!comment.text)
    {
        comment.text = @"[This comment was deleted]";
    }

    return comment;
}

@end
