//
//  CommentViewController.h
//  HackerNews
//
//  Created by Michael McKinney on 6/10/15.
//  Copyright (c) 2015 Michael McKinney. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Story.h"

@interface CommentViewController : UITableViewController

@property (weak,nonatomic) Story *commentStory;

-(void)setupCommentStoryValue:(Story *)story;


@end
