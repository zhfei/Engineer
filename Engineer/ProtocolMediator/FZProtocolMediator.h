//
//  FZProtocolMediator.h
//  Engineer
//
//  Created by 周飞 on 2019/1/20.
//  Copyright © 2019年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BottomComponentLib/Macro.h>
#import "FZComponentProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface FZProtocolMediator : NSObject
SingletonH(FZProtocolMediator)
- (void)registerProtocol:(Protocol *)proto forClass:(Class)cls ;
- (Class)classForProtocol:(Protocol *)proto ;


@end

NS_ASSUME_NONNULL_END
