//
//  CommentCellViewModel.h
//  HackerNews
//
//  Created by Michael McKinney on 6/16/15.
//  Copyright (c) 2015 Michael McKinney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Comment.h"

@interface CommentCellViewModel : NSObject

@property (strong,nonatomic) Comment* comment;
@property (strong,nonatomic) NSString* author;

-(void)assignComment:(Comment *)comment;

-(NSString *)getCommentText;

@end
