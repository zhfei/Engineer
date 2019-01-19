//
//  FZMineCoordinator.m
//  Engineer
//
//  Created by zhoufei on 2019/1/19.
//  Copyright © 2019年 zhoufei. All rights reserved.
//

#import "FZMineCoordinator.h"

@implementation FZMineCoordinator
SingletonM(FZMineCoordinator)
- (UIViewController *)targetVCWithClassName:(NSString *)calssName {
    Class class = NSClassFromString(calssName);
    if (class == nil) {
        return nil;
    }
    return [class new];
}
@end
