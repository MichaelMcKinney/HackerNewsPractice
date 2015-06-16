//
//  ColorChoiceViewModel.m
//  HackerNews
//
//  Created by Michael McKinney on 6/16/15.
//  Copyright (c) 2015 Michael McKinney. All rights reserved.
//

#import "ColorChoiceViewModel.h"

@implementation ColorChoiceViewModel

-(id)init
{
    if((self=[super init]))
    {
        _colors = NSMutableArray.new;
        _sections = 1;
        _rows = 2;
        [self.colors addObject:@"redTheme"];
        [self.colors addObject:@"greenTheme"];
    }
    return self;
}

-(UITableViewCell *)prepareCell:(UITableViewCell *)cell AtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        cell.backgroundColor = [ColorUtil colorFromHexString:@"#5C949C"];
    }
    else
    {
        cell.backgroundColor = [ColorUtil colorFromHexString:@"#157015"];
    }
    return cell;
}

-(void)selectedColor:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        [[NSUserDefaults standardUserDefaults] setValue:@"redTheme" forKey:@"theme"];
    }
    else if (indexPath.row ==1)
    {
        [[NSUserDefaults standardUserDefaults] setValue:@"greenTheme" forKey:@"theme"];
    }
}
@end
