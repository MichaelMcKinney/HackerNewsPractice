//
//  Comment.m
//  HackerNews
//
//  Created by Michael McKinney on 6/11/15.
//  Copyright (c) 2015 Michael McKinney. All rights reserved.
//

#import "Comment.h"

@implementation Comment

+(Comment *)newCommentWithID:(int)Id
{
    Comment *cell = Comment.new;
    cell.ID = Id;
    
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
    //NSLog([NSString stringWithFormat:@"comment with ID %d",self.ID]);
    self.author = [jsonDict objectForKey:@"by"];

    self.kids = [jsonDict objectForKey:@"kids"];
    self.parent = [[jsonDict objectForKey:@"parent"] intValue];
    self.time = [[jsonDict objectForKey:@"time"] intValue];
    self.type = [jsonDict objectForKey:@"type"];
    self.text = [jsonDict objectForKey:@"text"];
    if(!self.author)
    {
        self.author = @"[Deleted]";
    }
    if(!self.text)
    {
        self.text = @"[This comment was deleted]";
    }
}

@end
