//
//  Story.h
//  HackerNews
//
//  Created by Michael McKinney on 6/8/15.
//  Copyright (c) 2015 Michael McKinney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ThemeManager.h"
#import "AppDelegate.h"

@interface Story : NSObject

@property (strong, nonatomic)  NSString *author; //by
@property int descendants;                       //descendants
@property int ID;                                //id
@property NSArray* kids;                         //kids
@property int score;                             //score
@property int time;                              //time
@property (strong, nonatomic)  NSString *title;  //title
@property (strong, nonatomic)  NSString *type;   //type
@property (strong, nonatomic)  NSString *text;   //text
@property (strong, nonatomic)  NSURL *url;    //url
@property (strong, nonatomic)  NSDictionary *json;   //all json data

//-(NSString *)getHTMLFrom:(NSString *)url;
-(void)getInfoFromID;

+(Story *)newStoryWithID:(int)ID;    //CREATES A NEW STORY OBJECT ASSIGNING THE LABELS TO THE INSTANCES

@end
