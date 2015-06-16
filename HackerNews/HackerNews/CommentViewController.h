//
//  CommentViewController.h
//  HackerNews
//
//  Created by Michael McKinney on 6/10/15.
//  Copyright (c) 2015 Michael McKinney. All rights reserved.
//

#import "CommentViewModel.h"

@interface CommentViewController : UITableViewController

@property (strong,nonatomic) CommentViewModel* viewModel;

-(void)setupCommentStoryValue:(Story *)story;

@end
