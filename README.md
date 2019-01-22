#### 简述组件化解决方案CTMediator与MGJRouter的主要思想

##### 简述CTMediator
CTMediator按照功能的结构来讲，使用时需要实现CTMediator的个三部分。
1. CTMediator类：承担总枢纽，总调度的责任
2. Target_(ModuleName)类：承担组件对外暴漏接口功能，组件要提供什么服务，主要在它的接口声明上进行体现
3. CTMediator+(ModuleName)分类：主要供客户端使用，里面声明了可以调用的组件接口。

详细讲解如下：
**Part1: CTMediator核心功能实现：**
CTMediator主要采用target-action的方式实现组件间解耦合，本身功能完全独立，不依赖任何组件模块。
主要结构如下：
CTMediator作为中介者，是各个组件的进行信息通讯的中枢。
主要实现方案分两种情况：

首先利用runtime进行反射，将类字符串和方法字符串转换成类和SEL方法选择子：
```
SEL action = NSSelectorFromString(@"Action_response:");
NSObject *target = [[NSClassFromString(@"Target_NoTargetAction") alloc] init];
```

1.然后调用cocoa touch框架提供的方法直接调用
代码如下
```
[target performSelector:action withObject:params];
```
2.或者使用cocoa touch提供的命令模式，将消息和消息接受者封装成一个对象，进行执行。
首先，利用target-action生成方法签名
然后，创建NSInvocation对象，进行执行invoke。并拿到返回的结果。

代码如下：
利用方法签名，NSInvocation实现
```
NSMethodSignature* methodSig = [target methodSignatureForSelector:action];
if(methodSig == nil) {
    return nil;
}
const char* retType = [methodSig methodReturnType];
if (strcmp(retType, @encode(void)) == 0) {
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSig];
    [invocation setArgument:&params atIndex:2];
    [invocation setSelector:action];
    [invocation setTarget:target];
    [invocation invoke];
    return nil;
}
```
**Part2: 组件对外服务接口
**
如果组件需要对外提供服务，就需要创建自己的接收动作类
比如ModuleA要对外提供服务。那么就要创建一个
Target_A类，然后在Target_A类的.h文件中声明对外服务的接口，并在.m文件中进行实现。
注意：Target_A类是依赖组件的。它属于组件的一部分。
代码如下：
```
@interface Target_Mine : NSObject
- (id)Action_nativeFetchSportsResultVC:(NSDictionary *)param;
- (void)Action_remoteAlertSportsResultVC:(NSDictionary *)param;
@end
```
```
@implementation Target_Mine
- (id)Action_nativeFetchSportsResultVC:(NSDictionary *)param {
    UIViewController *vc = [[FZMineCoordinator sharedFZMineCoordinator] targetVCWithClassName:NSStringFromClass([FZSportsResultVC class])];
    if ([vc isKindOfClass:[FZSportsResultVC class]]) {
        [(FZSportsResultVC *)vc configContent:param[@"title"]];
    }
    return vc;
}

- (void)Action_remoteAlertSportsResultVC:(NSDictionary *)param {
    UIViewController *vc = [[FZMineCoordinator sharedFZMineCoordinator] targetVCWithClassName:NSStringFromClass([FZSportsResultVC class])];
    if ([vc isKindOfClass:[FZSportsResultVC class]]) {
        [(FZSportsPlanVC *)vc configContent:param[@"title"]];
    }
    
    id<UIApplicationDelegate> appDelegate = [UIApplication sharedApplication].delegate;
    UITabBarController *rootVC = [[appDelegate window] rootViewController];
    [rootVC.childViewControllers[0] pushViewController:vc animated:YES];
}
@end
```
**Part3: CTMediator+ModuleA组件通讯实际使用类
**
为了实现完全解耦，这个类所有使用的所有参数全部是cocoa touch框架中定义的基本类型。
像： NSDictionary， NSString， UIImage等。
里面按照作用分，可以分为：
模块名称字符串，模块本地调用方法名称字符串，模块远程调用方法名称字符串
在CTMediator+ModuleA分类文件的.h文件中，定义了供其他模块使用的接口
在CTMediator+ModuleA分类文件的.m文件中，实现供其他模块使用的接口，调用用CTMediator的runtime机制进行实现。
代码如下：
```
- (IBAction)goSportsPlanDetail:(UIButton *)sender {
    UIViewController *vc = [[CTMediator sharedInstance] Mediator_fetchSportsPlanVC:@{@"title":[sender currentTitle]}];
    [self.navigationController pushViewController:vc animated:YES];
}
```
CTMediator提供的方案是我认为最好的，巧妙的使用了cocoaTouch提供的反射机制，方法签名与命令模式，简单又完美的解决了组件间的解耦问题。
同时因为实现是基于Object-C的特性，稳定性靠谱。
在方案不同作用类分工上，简单明了。实现了从形式到实质上完全的解耦，同时提供了对外部appURL调用的支持。是非常完美的方案。

##### 简述MGJRouter
蘑菇街组件化方案，采用了url-block加protocal-class的方案，url-block用于页面跳转，protocal-class用于组件跳转
下面对MGJRouter的主要思路进行分析。

**MGJRouter核心功能实现
Part1：**
MGJRouter的url-block实现方案思路为，在路由中心维护着一张路由表，url为key, block为value。
注册路由表时，将key和value对应保存到路由表routes中
使用时，根据URL拿到对应的block进行执行。

```
- (NSMutableDictionary *)routes
{
    if (!_routes) {
        _routes = [[NSMutableDictionary alloc] init];
    }
    return _routes;
}
```
但是URL对应像UIImage,NSData这样的非常规对象是很难传递的。
**Part2：**
蘑菇街的protocal-class实现方案思路为：
在ModuleManager内维护着一张映射表，以protocol为key,以Class为Value。
注册映射表
```
[ModuleManager registerClass:ClassA forProtocol:ProtocolA]
```
使用映射表
```
[ModuleManager classForProtocol:ProtocolA]
```
注意：上面一一对应的关系中，类是实现了对应的协议的。所以通过协议拿到的类是可以按照protocol中声明的方法自由使用的。

**注册步骤：**
1.url-block方案注册：
在模块对应要展示的页面中，在load方法中进行注册
```
+ (void)load {
    [MGJRouter registerURLPattern:@"engineer://SportsPlanVC" toObjectHandler:^id(NSDictionary *routerParameters) {
        FZSportsPlanVC *planVC = [FZSportsPlanVC new];
        [planVC configContent:routerParameters[@"MGJRouterParameterUserInfo"][@"title"]];
        return planVC;
    }];
}
```
2.protocal-class方案注册：
在模块的协议实现类中进行注册：
```
+ (void)load {
    [[FZProtocolMediator sharedFZProtocolMediator] registerProtocol:NSProtocolFromString(@"FZModuleMineProtocol") forClass:[FZModuleMineProtocolImplete class]];
}
```

**使用步骤：**
根据对应的单例获取方式，获取既可。
```
- (IBAction)mgj_goSportsPlanDetail:(UIButton *)sender {
    UIViewController *vc = [MGJRouter objectForURL:@"engineer://SportsPlanVC" withUserInfo:@{@"title":[sender currentTitle]}];
    [self.navigationController pushViewController:vc animated:YES];
}
```
```
- (IBAction)protocol_class_goSportsPlanDetail:(UIButton *)sender {
    Class<FZModuleMineProtocol> class = [[FZProtocolMediator sharedFZProtocolMediator] classForProtocol:NSProtocolFromString(@"FZModuleMineProtocol")];
    UIViewController *vc = [class fetchSportsPlanVC:sender.currentTitle];
    [self.navigationController pushViewController:vc animated:YES];
}
```

MGJRouter实现方案上有些复杂，使得新手学习上有些困难，同时两张表也增加了维护成本。
不过不可否认的是url-block和protocal-class都是非常巧妙的解耦方案。

使用效果如下：
![home](https://github.com/zhfei/Engineer/blob/master/Engineer/Resource/home.png?raw=true)

![personal](https://github.com/zhfei/Engineer/blob/master/Engineer/Resource/personal.png?raw=true)

使用demo地址为：https://github.com/zhfei/Engineer




