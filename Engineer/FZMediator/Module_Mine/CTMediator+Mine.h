//
//  CTMediator+Mine.h
//  Engineer
//
//  Created by zhoufei on 2019/1/19.
//  Copyright © 2019年 zhoufei. All rights reserved.
//
//  中介者之-<我的>模块 访问入口

#import "CTMediator.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CTMediator (Mine)
- (UIViewController *)Mediator_fetchSportsResultVC:(NSDictionary *)param;
- (UIViewController *)Mediator_fetchSportsPlanVC:(NSDictionary *)param;
@end

NS_ASSUME_NONNULL_END
