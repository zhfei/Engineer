//
//  FZFoundStorage.h
//  Map
//
//  Created by 周飞 on 2018/11/3.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FZFoundStorage : NSObject
//从数据库读取信息
- (void)readData:(NSString *)path;

@end

NS_ASSUME_NONNULL_END
