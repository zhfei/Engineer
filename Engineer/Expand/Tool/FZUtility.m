//
//  FZUtility.m
//  Map
//
//  Created by zhoufei on 16/6/16.
//  Copyright © 2016年 zhoufei. All rights reserved.
//


#import "FZUtility.h"

@implementation FZUtility
+(UIFont*)customFont{
    // 字体路径
    NSString *fontPath = [[NSBundle mainBundle] pathForResource:@"汉仪菱心体简" ofType:@"ttf"];
    NSURL *url = [NSURL fileURLWithPath:fontPath];
    CGDataProviderRef fontDataProvider = CGDataProviderCreateWithURL((__bridge CFURLRef)url);
    if (fontDataProvider == NULL)
        return nil;
    CGFontRef newFont = CGFontCreateWithDataProvider(fontDataProvider);
    CGDataProviderRelease(fontDataProvider);
    if (newFont == NULL) return nil;
    NSString *fontName = (__bridge NSString *)CGFontCopyFullName(newFont);
    UIFont *font = [UIFont fontWithName:fontName size:17.0f];
    CGFontRelease(newFont);
    return font;
}

@end
