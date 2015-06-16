//
//  MasterViewModel.h
//  HackerNews
//
//  Created by Michael McKinney on 6/15/15.
//  Copyright (c) 2015 Michael McKinney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MasterViewController.h"
#import "HackerNewsAPI.h"


@interface MasterViewModel : NSObject

@property BOOL firstTimeLoading; //keeps track of the first time for hte refresh property

@property NSMutableArray *Stories; //holds all of the stories we are looking at
@property (strong,nonatomic) Story *commentStory;
@property (assign, nonatomic) NSInteger count;
@property (assign, nonatomic) NSInteger sections;



-(UIColor *)refreshColor;
-(UIColor *)refreshBGColor;
-(void)sortCellsByTime;
-(void)sortCellsByScore;
-(void)loadData;
-(void)ButtonPosition;

-(void)setViewModelCommentStoryFrom:(id)sender andTableView:(UITableView*)tableView;



@end
