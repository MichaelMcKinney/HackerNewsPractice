//
//  DetailViewModel.h
//  HackerNews
//
//  Created by Michael McKinney on 6/16/15.
//  Copyright (c) 2015 Michael McKinney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StoryCell.h"

@interface DetailViewModel : NSObject

@property (strong, nonatomic) Story *story;


-(void)setupStory:(Story *)story;
-(NSString *)getText;
-(NSURL *)getURL;
@end
