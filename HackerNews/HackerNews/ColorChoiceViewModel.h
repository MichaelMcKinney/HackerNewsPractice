//
//  ColorChoiceViewModel.h
//  HackerNews
//
//  Created by Michael McKinney on 6/16/15.
//  Copyright (c) 2015 Michael McKinney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ThemeManager.h"

@interface ColorChoiceViewModel : NSObject

@property (strong,nonatomic) NSMutableArray *colors;
@property (assign,nonatomic) NSInteger sections;
@property (assign,nonatomic) NSInteger rows;

-(void)selectedColor:(NSIndexPath *)indexPath;
-(UITableViewCell *)prepareCell:(UITableViewCell *)cell AtIndexPath:(NSIndexPath *)indexPath;
@end
