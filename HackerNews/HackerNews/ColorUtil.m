//
//  ColorUtil.m
//  HackerNews
//
//  Created by Michael McKinney on 6/15/15.
//  Copyright (c) 2015 Michael McKinney. All rights reserved.
//

#import "ColorUtil.h"

@implementation ColorUtil

+ (UIColor *)colorFromHexString:(NSString *)hexString //from a generous stackoverflow user - converts hex strings to UIColors
{
    
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}


@end
