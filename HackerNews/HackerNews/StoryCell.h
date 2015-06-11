//
//  StoryCell.h
//  HackerNews
//
//  Created by Michael McKinney on 6/8/15.
//  Copyright (c) 2015 Michael McKinney. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Story.h"

@interface StoryCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *TitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *ScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *AuthorLabel;
@property (weak, nonatomic) IBOutlet UILabel *URLLabel;

@property (weak, nonatomic) IBOutlet UIButton *button;




-(void)FillLabelsFromStoryToSelf:(Story *)story;

@end
