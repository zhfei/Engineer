//
//  MyNavigationtroller.m
//  xueba
//
//  Created by Tim on 12/6/14.
//  Copyright (c) 2014 aim. All rights reserved.
//

#import "BaseNavigationtroller.h"


// 判断是否为iOS7
#define iOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)


@interface BaseNavigationtroller ()

@end

@implementation BaseNavigationtroller

+ (void)initialize
{
    // 1.取出设置主题的对象
    UINavigationBar *navBar = [UINavigationBar appearance];
//    navBar.translucent=NO;
    // 2.设置导航栏的背景图片 背景颜色
    if (iOS7) { // iOS7 以上
        navBar.barTintColor = COLOR_THEME;

    } else { // iOS7 一下
        navBar.tintColor = COLOR_THEME;

    }
    
    // 3.标题
    
    [navBar setTitleTextAttributes:@{
                                     NSForegroundColorAttributeName:[UIColor whiteColor],
                                     NSFontAttributeName:[FZUtility customFont],
                                     
                                     }];
    
    NSArray * fontArrays = [[NSArray alloc] initWithArray:[UIFont familyNames]];
    for (NSString * temp in fontArrays) {
        NSLog(@"Font name  = %@", temp);
    }
}


#pragma mark 控制状态栏的样式
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


@end
