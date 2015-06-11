//
//  ThemeManager.m
//  HackerNews
//
//  Created by Michael McKinney on 6/10/15.
//  Copyright (c) 2015 Michael McKinney. All rights reserved.
//

#import "ThemeManager.h"

@implementation ThemeManager


-(id)init
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

+ (ThemeManager *)sharedManager
{
    static ThemeManager *sharedManager = nil;
    if (sharedManager == nil)
    {
        sharedManager = [[ThemeManager alloc] init];
    }
    return sharedManager;
}




@end
