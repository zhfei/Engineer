//
//  FZSportsCircleViewController.m
//  Map
//
//  Created by zhoufei on 16/6/12.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "FZSportsCircleViewController.h"
#import "CTMediator+Mine.h"

@implementation FZSportsCircleViewController
- (IBAction)goSportsPlanDetail:(UIButton *)sender {
    UIViewController *vc = [[CTMediator sharedInstance] Mediator_fetchSportsPlanVC:@{@"title":[sender currentTitle]}];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)goSportsResultDetail:(UIButton *)sender {
    UIViewController *vc = [[CTMediator sharedInstance] Mediator_fetchSportsResultVC:@{@"title":[sender currentTitle]}];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
