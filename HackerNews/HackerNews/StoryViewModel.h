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

@property (strong, nonatomic)  NSString *author;    //by
@property int descendants;                          //descendants
@property int ID;                                   //id
@property NSArray* kids;                            //kids
@property int score;                                //score
@property int time;                                 //time
@property (strong, nonatomic)  NSString *title;     //title
@property (strong, nonatomic)  NSString *type;      //type
@property (strong, nonatomic)  NSString *text;      //text
@property (strong, nonatomic)  NSURL *url;          //url
@property (strong, nonatomic)  NSDictionary *json;  //all json data

-(void)assignStory:(Story *)story;
-(NSString *)getButtonText;
-(NSString *)getURLText;
-(NSString *)getScoreText;

@end
