//
//  CTMediator+Mine.m
//  Engineer
//
//  Created by zhoufei on 2019/1/19.
//  Copyright © 2019年 zhoufei. All rights reserved.
//

#import "CTMediator+Mine.h"

NSString * const FZMediatorTargetModuleName = @"Mine";
NSString * const FZMediatorTargetActionFetchSportsResultVC = @"fetchSportsResultVC";
NSString * const FZMediatorTargetActionFetchSportsPlanVC = @"fetchSportsPlanVC";


@implementation CTMediator (Mine)
- (UIViewController *)Mediator_fetchSportsResultVC:(NSDictionary *)param {
    
    UIViewController *vc = [self performTarget:FZMediatorTargetModuleName action:FZMediatorTargetActionFetchSportsResultVC params:param shouldCacheTarget:YES];
    if (vc == nil) {
        return [UIViewController new];
    } else {
        return vc;
    }
}
- (UIViewController *)Mediator_fetchSportsPlanVC:(NSDictionary *)param {
    UIViewController *vc = [self performTarget:FZMediatorTargetModuleName action:FZMediatorTargetActionFetchSportsPlanVC params:param shouldCacheTarget:YES];
    if (vc == nil) {
        return [UIViewController new];
    } else {
        return vc;
    }
}
@end
