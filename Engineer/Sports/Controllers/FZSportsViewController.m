//
//  FZSportsViewController.m
//  Map
//
//  Created by zhoufei on 16/6/12.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "FZSportsViewController.h"

@implementation FZSportsViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
   
}

-(NSString *)getValueForKey:(NSString *)key
{
    NSData *valueData = nil;
    if(valueData != nil)
    {
        NSString *value = [[NSString alloc] initWithData:valueData encoding:NSUTF8StringEncoding];
        return value;
    }
    else
    {
        return nil;
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}
@end
