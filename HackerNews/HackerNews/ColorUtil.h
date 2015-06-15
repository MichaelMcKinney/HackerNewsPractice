//
//  ColorUtil.h
//  HackerNews
//
//  Created by Michael McKinney on 6/15/15.
//  Copyright (c) 2015 Michael McKinney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface ColorUtil : NSObject

+ (UIColor *)colorFromHexString:(NSString *)hexString; //makes colors from the plist file for color preferences

@end
