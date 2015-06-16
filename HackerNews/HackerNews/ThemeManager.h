//
//  ThemeManager.h
//  HackerNews
//
//  Created by Michael McKinney on 6/10/15.
//  Copyright (c) 2015 Michael McKinney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ColorUtil.h"

@interface ThemeManager : NSObject

@property (strong,nonatomic) NSDictionary *styles;

+ (ThemeManager *)sharedManager;

-(UIColor *)getColorForKey:(NSString *)key;


@end
