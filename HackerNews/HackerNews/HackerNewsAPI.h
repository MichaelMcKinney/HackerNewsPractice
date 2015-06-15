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

@interface HackerNewsAPI : NSObject

+(NSMutableArray *)getTopStories:(int)numberOfStories;
+(Story *)getStoryFromID:(int)ID;
+(Comment *)getCommentFromID:(int)ID;

@end
