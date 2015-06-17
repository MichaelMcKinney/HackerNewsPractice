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

-(NSString *)StringAtIndex:(NSInteger)index
{
    if (index == 0)
    {
        return @"#5C949C"; //push string to viewController
    }
    else
    {
        return @"#157015";
    }
}

-(void)selectedColor:(NSInteger)index
{
    if (index == 0)
    {
        [[NSUserDefaults standardUserDefaults] setValue:@"redTheme" forKey:@"theme"];
    }
    else if (index == 1)
    {
        [[NSUserDefaults standardUserDefaults] setValue:@"greenTheme" forKey:@"theme"];
    }
}
@end
