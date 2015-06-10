//
//  Story.m
//  HackerNews
//
//  Created by Michael McKinney on 6/8/15.
//  Copyright (c) 2015 Michael McKinney. All rights reserved.
//

#import "Story.h"

@implementation Story

/*
 To get all Top Stories: https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty
 
 To get infor from story ID: https://hacker-news.firebaseio.com/v0/item/9679674.json?print=pretty where the #### is the story ID
 
Lines of Story:
//by
//descendants
//id
//kids
//score
//time
//title
//type
//url
 
EX:
 
 {
 "by" : "dhouston",
 "descendants" : 71,
 "id" : 8863,
 "kids" : [ 8952, 9224, 8917, 8884, 8887, 8943, 8869, 8958, 9005, 9671, 8940, 8876 ],
 "score" : 111,
 "time" : 1175714200,
 "title" : "My YC app: Dropbox - Throw away your USB drive",
 "type" : "story",
 "url" : "http://www.getdropbox.com/u/2/screencast.html"
 }
 
*/
-(id)init
{
    if (self=[super init])
    {
        self.ID = 0;
    }
    return self;
}

+(Story *)newStoryWithID:(int)ID   //CREATES A NEW STORY OBJECT ASSIGNING THE LABELS TO THE INSTANCES
{
   // NSLog(@"In new Story");
    Story *cell = Story.new;
    cell.ID = ID;
    
    [cell getInfoFromID];
    return cell;
}

-(void)getInfoFromID
{
    NSURL *U = [NSURL URLWithString:[NSString stringWithFormat:@"https://hacker-news.firebaseio.com/v0/item/%d.json?print=pretty",self.ID]];
    NSData *data = [NSData dataWithContentsOfURL:U];
    
    
    NSError *error;
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];

    self.json = jsonDict;
    self.author = [jsonDict objectForKey:@"by"];
    self.title = [jsonDict objectForKey:@"title"];
    self.type = [jsonDict objectForKey:@"type"];
    self.url = [NSURL URLWithString:[jsonDict objectForKey:@"url"]];
    self.score = [[jsonDict objectForKey:@"score"] intValue];
    self.time = [[jsonDict objectForKey:@"time"] intValue];
    self.time = [[jsonDict objectForKey:@"descendants"] intValue];
    self.kids = [jsonDict objectForKey:@"kids"];
    if ([self.type  isEqualToString:@"job"] || [self.type isEqualToString:@"story"])
        {self.text = [jsonDict objectForKey:@"text"];}

    //NSArray *lines = [toParse componentsSeparatedByString:@"\n"];//get a ton of strings for each line
    
    /*
    self.author = [self parseAuthorFrom:lines[1]];//get author line
    self.descendants = [self parseDescendantsFrom:lines[2]];
    self.kids = [self parseKidsFrom:lines[4]];
    self.score = [self parseScoreFrom:lines[5]];
    self.time = [self parseTimeFrom:lines[7]];
    self.title = [self parseTitleFrom:lines[8]];
    self.type = [self parseTypeFrom:lines[9]];
    self.url = [self parseURLFrom:lines[10]];
    */
    //NSLog([NSString stringWithFormat:@"%@",lines[1]]);
}



@end















