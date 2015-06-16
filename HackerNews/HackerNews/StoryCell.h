//
//  StoryCell.h
//  HackerNews
//
//  Created by Michael McKinney on 6/8/15.
//  Copyright (c) 2015 Michael McKinney. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StoryViewModel.h"

@protocol StoryCellDelegate <NSObject>
@required

-(void)didSelectFromSender:(id)sender;

@end

@interface StoryCell : UITableViewCell

@property (strong, nonatomic) StoryViewModel *viewModel;


@property (weak, nonatomic) IBOutlet UILabel *TitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *ScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *AuthorLabel;
@property (weak, nonatomic) IBOutlet UILabel *URLLabel;

@property (weak, nonatomic) IBOutlet UIButton *button;

@property  (weak, nonatomic) id delegate;

-(void)FillLabelsFromStoryToSelf:(Story *)story;
//-(void)setupButtonWithTarget:(id)target Action:(SEL)action;


@end
