//
//  FZModuleMineProtocolImplete.m
//  Engineer
//
//  Created by 周飞 on 2019/1/21.
//  Copyright © 2019年 zhoufei. All rights reserved.
//

#import "FZModuleMineProtocolImplete.h"
#import "FZProtocolMediator.h"
#import "FZSportsPlanVC.h"
#import "FZSportsResultVC.h"

@implementation FZModuleMineProtocolImplete
+ (void)load {
    [[FZProtocolMediator sharedFZProtocolMediator] registerProtocol:NSProtocolFromString(@"FZModuleMineProtocol") forClass:[FZModuleMineProtocolImplete class]];
}

+ (UIViewController *)fetchSportsPlanVC {
    return [FZSportsPlanVC new];
}

+ (UIViewController *)fetchSportsResultVC {
    return [FZSportsResultVC new];
}
@end
