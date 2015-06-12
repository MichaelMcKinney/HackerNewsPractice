//  WORKING COPY
//  AppDelegate.h
//  HackerNews
//
//  Created by Michael McKinney on 6/8/15.
//  Copyright (c) 2015 Michael McKinney. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

+ (UIColor *)colorFromHexString:(NSString *)hexString; //makes colors from the plist file for color preferences

@property (strong, nonatomic) UIWindow *window;


@end

