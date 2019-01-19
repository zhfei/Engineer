//
//  FZMineViewController.m
//  Map
//
//  Created by zhoufei on 16/6/12.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "FZMineViewController.h"
#import "FZMineCoordinator.h"
#import "FZSportsPlanVC.h"
#import "FZSportsResultVC.h"

@interface FZMineViewController ()

@end

@implementation FZMineViewController

- (IBAction)sportsPlan:(UIButton *)sender {
    UIViewController *vc = [[FZMineCoordinator sharedFZMineCoordinator] targetVCWithClassName:NSStringFromClass([FZSportsPlanVC class])];
    [(FZSportsPlanVC *)vc configContent:sender.currentTitle];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)sportsResult:(UIButton *)sender {
    UIViewController *vc = [[FZMineCoordinator sharedFZMineCoordinator] targetVCWithClassName:NSStringFromClass([FZSportsResultVC class])];
    [(FZSportsPlanVC *)vc configContent:sender.currentTitle];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
