//
//  CTMediator+Mine.m
//  Engineer
//
//  Created by zhoufei on 2019/1/19.
//  Copyright © 2019年 zhoufei. All rights reserved.
//

#import "CTMediator+Mine.h"

NSString * const FZMediatorTargetMine = @"Mine";

NSString * const FZMediatorActionNativFetchSportsResultVC = @"nativeFetchSportsResultVC";
NSString * const FZMediatorActionNativFetchSportsPlanVC = @"nativeFetchSportsPlanVC";

NSString * const FZMediatorActionRemoteFetchSportsResultVC = @"remoteFetchSportsResultVC";


@implementation CTMediator (Mine)
- (UIViewController *)Mediator_fetchSportsResultVC:(NSDictionary *)param {
    
    UIViewController *vc = [self performTarget:FZMediatorTargetMine action:FZMediatorActionNativFetchSportsResultVC params:param shouldCacheTarget:YES];
    if (vc == nil) {
        return [UIViewController new];
    } else {
        return vc;
    }
}
- (UIViewController *)Mediator_fetchSportsPlanVC:(NSDictionary *)param {
    UIViewController *vc = [self performTarget:FZMediatorTargetMine action:FZMediatorActionNativFetchSportsPlanVC params:param shouldCacheTarget:YES];
    if (vc == nil) {
        return [UIViewController new];
    } else {
        return vc;
    }
}
@end
