//
//  ThemeManager.m
//  HackerNews
//
//  Created by Michael McKinney on 6/10/15.
//  Copyright (c) 2015 Michael McKinney. All rights reserved.
//

#import "ThemeManager.h"

@implementation ThemeManager


-(id)init //generously donated by stack overflow
{
    if ((self=[super init]))
    {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSString *themeName = [defaults objectForKey:@"theme"] ?: @"redTheme";
        
        NSString *path = [[NSBundle mainBundle] pathForResource:themeName ofType:@"plist"];
        self.styles = [NSDictionary dictionaryWithContentsOfFile:path];
    }
    return self;
}

+ (ThemeManager *)sharedManager //Stack Overflow
{
    static ThemeManager *sharedManager = nil;
    if (sharedManager == nil)
    {
        sharedManager = [[ThemeManager alloc] init];
    }
    return sharedManager;
}

-(UIColor *)getColorForKey:(NSString *)key
{
    NSString *barColor = [_styles objectForKey:key];        //set the bar color to plist's navBar code
    return [ColorUtil colorFromHexString:barColor];
}

@end
