//
//  FZProtocolMediator.m
//  Engineer
//
//  Created by 周飞 on 2019/1/20.
//  Copyright © 2019年 zhoufei. All rights reserved.
//

#import "FZProtocolMediator.h"

@interface FZProtocolMediator ()
@property (nonatomic, strong) NSMutableDictionary *protocolCache;
@end

@implementation FZProtocolMediator
- (void)registerProtocol:(Protocol *)proto forClass:(Class)cls {
    [self.protocolCache setObject:cls forKey:NSStringFromProtocol(proto)];
}

- (Class)classForProtocol:(Protocol *)proto {
    return self.protocolCache[NSStringFromProtocol(proto)];
}

- (NSMutableDictionary *)protocolCache {
    if (!_protocolCache) {
        _protocolCache = @{}.mutableCopy;
    }
    return _protocolCache;
}
@end
