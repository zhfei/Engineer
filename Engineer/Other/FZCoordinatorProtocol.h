//
//  FZCoordinatorProtocol.h
//  Engineer
//
//  Created by zhoufei on 2019/1/19.
//  Copyright © 2019年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol FZCoordinatorProtocol <NSObject>
- (UIViewController *)targetVCWithClassName:(NSString *)calssName;
@end

NS_ASSUME_NONNULL_END
