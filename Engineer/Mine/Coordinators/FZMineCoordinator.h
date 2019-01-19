//
//  FZMineCoordinator.h
//  Engineer
//
//  Created by zhoufei on 2019/1/19.
//  Copyright © 2019年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BottomComponentLib/Macro.h>
#import "FZMineCoordinatorProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface FZMineCoordinator : NSObject <FZMineCoordinatorProtocol>
SingletonH(FZMineCoordinator)
@end

NS_ASSUME_NONNULL_END
