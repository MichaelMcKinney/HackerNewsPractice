//
//  StoryViewModel.h
//  HackerNews
//
//  Created by Michael McKinney on 6/16/15.
//  Copyright (c) 2015 Michael McKinney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Story.h"

@interface StoryViewModel : NSObject

@property (strong,nonatomic) Story* story;

-(void)assignStory:(Story *)story;
-(NSString *)getButtonText;
-(NSString *)getURLText;
-(NSString *)getScoreText;
-(NSString *)getAuthorText;
-(NSString *)getTitleText;

@end
