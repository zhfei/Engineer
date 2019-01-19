//
//  FZSportsResultVC.m
//  Engineer
//
//  Created by zhoufei on 2019/1/19.
//  Copyright © 2019年 zhoufei. All rights reserved.
//

#import "FZSportsResultVC.h"
#import <BottomComponentLib/UILabel+ShortCut.h>
#import <Masonry.h>


@interface FZSportsResultVC ()
@property (nonatomic, strong) UILabel *content;
@property (nonatomic, strong) NSString *contentText;

@end

@implementation FZSportsResultVC
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
}

#pragma mark - Getter, Setter
- (UILabel *)content {
    if (!_content) {
        _content = [UILabel shortCutLabelWithFrame:self.view.bounds title:nil];
        _content.backgroundColor = [UIColor clearColor];
        _content.textColor = [UIColor whiteColor];
        _content.font = [UIFont systemFontOfSize:20];
    }
    return _content;
}
#pragma mark - Event

#pragma mark - Public Method
- (void)configContent:(NSString *)text {
    self.contentText = text;
}
#pragma mark - Private Method
- (void)setupData {
    
}

- (void)setupUI {
    self.view.backgroundColor = [UIColor purpleColor];
    self.title = @"个人中心";

    [self.view addSubview:self.content];
    self.content.text = self.contentText;
    [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)resetData {
    
}

- (void)resetUI {
    
}

#pragma mark - Delegate

#pragma mark - NSCopying

#pragma mark - NSObject
@end
