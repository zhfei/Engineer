//
//  RootViewController.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 15/11/2.
//  Copyright © 2015年 zhoufei. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "BaseNavigationtroller.h"
#import "FZMessageViewController.h"
#import "FZMineViewController.h"
#import "FZSportsViewController.h"
#import "FZSportsCircleViewController.h"
#import "FZFoundViewController.h"

#define kTopY -15

@interface MainTabBarViewController ()
{
    NSMutableArray *controlArray;
}
@end

@implementation MainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self createControls];
}

-(void)createControls
{
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:RGBACOLOR(105, 189, 76, 1),NSForegroundColorAttributeName, nil]forState:UIControlStateSelected];
    
    [[UITabBarItem appearance] setTitlePositionAdjustment:UIOffsetMake(0, -2)];
    
    
    FZSportsCircleViewController *sportsCircle=[[FZSportsCircleViewController alloc]init];
    BaseNavigationtroller *nav1=[[BaseNavigationtroller alloc]initWithRootViewController:sportsCircle];
    sportsCircle.title=@"运动圈";
    nav1.tabBarItem.image=[[UIImage imageNamed:@"main_tab_title_social_0~iphone"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav1.tabBarItem.selectedImage=[[UIImage imageNamed:@"main_tab_title_social_1~iphone"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //赋值图片

    FZFoundViewController *found=[[FZFoundViewController alloc]init];
    BaseNavigationtroller *nav2=[[BaseNavigationtroller alloc]initWithRootViewController:found];
    found.title=@"发现";
    nav2.tabBarItem.image=[[UIImage imageNamed:@"main_tab_title_discover_0~iphone"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav2.tabBarItem.selectedImage=[[UIImage imageNamed:@"main_tab_title_discover_1~iphone"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    FZSportsViewController *sports=[[FZSportsViewController alloc]init];
    BaseNavigationtroller *nav3=[[BaseNavigationtroller alloc]initWithRootViewController:sports];
    sports.title=@"运动";
    nav3.tabBarItem.image=[[UIImage imageNamed:@"main_tab_title_sport_0~iphone"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav3.tabBarItem.selectedImage=[[UIImage imageNamed:@"main_tab_title_sport_1~iphone"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav3.tabBarItem.tag=1003;
    
    FZMessageViewController *message=[[FZMessageViewController alloc]init];
    BaseNavigationtroller *nav4=[[BaseNavigationtroller alloc]initWithRootViewController:message];
    message.title=@"消息";
    nav4.tabBarItem.image=[[UIImage imageNamed:@"main_tab_title_message_0~iphone"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav4.tabBarItem.selectedImage=[[UIImage imageNamed:@"main_tab_title_message_1~iphone"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav4.tabBarItem.badgeValue=@"2";
    
    FZMineViewController *main=[[FZMineViewController alloc]init];
    BaseNavigationtroller *nav5=[[BaseNavigationtroller alloc]initWithRootViewController:main];
    main.title=@"个人中心";
    nav5.tabBarItem.image=[[UIImage imageNamed:@"main_tab_title_personal_0~iphone"]
    imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav5.tabBarItem.selectedImage=[[UIImage imageNamed:@"main_tab_title_personal_1~iphone"]
    imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    
    nav1.tabBarItem.imageInsets=UIEdgeInsetsMake(-1, 0, 1, 0);
    nav2.tabBarItem.imageInsets=UIEdgeInsetsMake(-1, 0, 1, 0);
    nav3.tabBarItem.imageInsets=UIEdgeInsetsMake(-1, 0, 1, 0);
    nav4.tabBarItem.imageInsets=UIEdgeInsetsMake(-1, 0, 1, 0);
    nav5.tabBarItem.imageInsets=UIEdgeInsetsMake(-1, 0, 1, 0);


    controlArray=[[NSMutableArray alloc]initWithObjects:nav1,nav2,nav3,nav4,nav5, nil];
    self.viewControllers=controlArray;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
