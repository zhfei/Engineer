//
//  Header.h
//  MyTestWorkProduct
//
//  Created by zhoufei on 15/11/3.
//  Copyright © 2015年 zhoufei. All rights reserved.
//

#ifndef Header_h
#define Header_h

#ifdef DEBUG  //debug log
#   define MyLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else

#   define MyLog(...);
#endif

#define isLargeIOS7 [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0
#define ScreenHight ([[[UIDevice currentDevice] systemVersion] floatValue]>=7.0?[UIScreen mainScreen].bounds.size.height:[UIScreen mainScreen].bounds.size.height-70)
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define tableViewOrigin ([[[UIDevice currentDevice] systemVersion] floatValue]>=7.0?64:0)


#define kRootDocumentsPath  [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/"]

#define kRootLibraryPath    [NSHomeDirectory() stringByAppendingPathComponent:@"Library/"]

#define kRootCachePath      [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches/"]

//主题颜色  #0075c2
#define COLOR_THEME                 RGBACOLOR(105, 189, 76, 1)

//背景颜色
#define COLOR_BACKGROUND            [UIColor colorWithWhite:0.941 alpha:1.000]

#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]


#endif /* Header_h */
