//
//  CommentViewModel.h
//  HackerNews
//
//  Created by Michael McKinney on 6/16/15.
//  Copyright (c) 2015 Michael McKinney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Story.h"
#import "CommentCell.h"
#import "HackerNewsAPI.h"

@interface CommentViewModel : NSObject

@property (strong,nonatomic) Story *commentStory;
@property (assign,nonatomic) NSInteger numKids;
@property (assign, nonatomic) NSInteger sections;

-(void)setupCommentStory:(Story*)story;
-(NSInteger)getNumRows;
-(CommentCell *)setupCell:(CommentCell*)cell WithIndexPath:(NSIndexPath *)indexPath;

@end
