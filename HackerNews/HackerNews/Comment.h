//
//  Comment.h
//  HackerNews
//
//  Created by Michael McKinney on 6/11/15.
//  Copyright (c) 2015 Michael McKinney. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Comment : NSObject

@property (strong, nonatomic)  NSString *author;        //by
@property int ID;                                       //id
@property NSArray* kids;                                //kids
@property int parent;                                   //parent
@property int time;                                     //time
@property (strong, nonatomic)  NSString *type;          //type
@property (strong, nonatomic)  NSString *text;          //text
@property (strong, nonatomic)  NSDictionary *json;      //all json data

@end
