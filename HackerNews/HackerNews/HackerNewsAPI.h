//
//  HackerNewsAPI.h
//  HackerNews
//
//  Created by Michael McKinney on 6/15/15.
//  Copyright (c) 2015 Michael McKinney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Story.h"
#import "Comment.h"

//@class Story;
//@class Comment;
@interface HackerNewsAPI : NSObject

+(NSMutableArray *)getTopStories:(NSInteger)numberOfStories;
+(Story *)getStoryFromID:(int)ID;
+(Comment *)getCommentFromID:(int)ID;
//-(BOOL)Connected;
@end
