//
//  ViewController.m
//  RoleModule
//
//  Created by zhoufei on 2019/1/20.
//  Copyright © 2019年 zhoufei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)openURL:(UIButton *)sender {
    NSURL *url = [NSURL URLWithString:@"engineer://www.baidu.com"];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url options:@{@"key":@"hello"} completionHandler:nil];
    } else {
        NSLog(@"无法开启。。。");
    }
}

@end
