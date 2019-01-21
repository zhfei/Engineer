//
//  FZSportsCircleViewController.m
//  Map
//
//  Created by zhoufei on 16/6/12.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "FZSportsCircleViewController.h"
#import "CTMediator+Mine.h"
#import <MGJRouter.h>
#import "FZProtocolMediator.h"
#import "FZComponentProtocol.h"

@implementation FZSportsCircleViewController
- (IBAction)goSportsPlanDetail:(UIButton *)sender {
    UIViewController *vc = [[CTMediator sharedInstance] Mediator_fetchSportsPlanVC:@{@"title":[sender currentTitle]}];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)goSportsResultDetail:(UIButton *)sender {
    UIViewController *vc = [[CTMediator sharedInstance] Mediator_fetchSportsResultVC:@{@"title":[sender currentTitle]}];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)mgj_goSportsPlanDetail:(UIButton *)sender {
    UIViewController *vc = [MGJRouter objectForURL:@"engineer://SportsPlanVC" withUserInfo:@{@"title":[sender currentTitle]}];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)mgj_goSportsResultDetail:(UIButton *)sender {
    UIViewController *vc = [MGJRouter objectForURL:@"engineer://SportsResultVC" withUserInfo:@{@"title":[sender currentTitle]}];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)protocol_class_goSportsPlanDetail:(UIButton *)sender {
    Class<FZModuleMineProtocol> class = [[FZProtocolMediator sharedFZProtocolMediator] classForProtocol:NSProtocolFromString(@"FZModuleMineProtocol")];

    UIViewController *vc = [class fetchSportsPlanVC:sender.currentTitle];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)protocol_class_goSportsResultDetail:(UIButton *)sender {
    Class<FZModuleMineProtocol> class = [[FZProtocolMediator sharedFZProtocolMediator] classForProtocol:NSProtocolFromString(@"FZModuleMineProtocol")];
    
    UIViewController *vc = [class fetchSportsResultVC:sender.currentTitle];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
