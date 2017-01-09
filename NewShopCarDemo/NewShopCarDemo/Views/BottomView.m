//
//  BottomView.m
//  NewShopCarDemo
//
//  Created by Apple on 2017/1/9.
//  Copyright © 2017年 mgjr. All rights reserved.
//

#import "BottomView.h"

@implementation BottomView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self initView];
    }
    return self;
}

- (void)initView {
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MainScreen_size_width, 0.5)];
    lineView.backgroundColor = RGBA(200, 200, 200, 1.0f);
    [self addSubview:lineView];
    
    UIButton *selectButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:selectButton];
    [selectButton setImage:IMG(@"shopcat_no_select.png") forState:UIControlStateNormal];
    [selectButton setImage:IMG(@"shopcat_select.png") forState:UIControlStateSelected];
    selectButton.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    [selectButton addTarget:self action:@selector(selectAllProductAction:) forControlEvents:UIControlEventTouchUpInside];
    [selectButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(40);
        make.centerY.equalTo(self);
    }];
    
    UILabel *allselectLabel = [[UILabel alloc] init];
    [self addSubview:allselectLabel];
    allselectLabel.text = @"全选";
    [allselectLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(50);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(40);
        make.centerY.equalTo(self);
    }];
    
    _payButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:_payButton];
    _payButton.backgroundColor = RGBA(65, 164, 249, 1.0f);
    [_payButton setTitle:@"付款(0)" forState:0];
    [_payButton setTitleColor:[UIColor whiteColor] forState:0];
    [_payButton addTarget:self action:@selector(gotoOderPage) forControlEvents:UIControlEventTouchUpInside];
    _payButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [_payButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-0);
        make.height.mas_equalTo(48);
        make.top.equalTo(self).offset(0);
        make.width.mas_equalTo(80);
    }];
    
    _allMoneyLabel = [[UILabel alloc] init];
    [self addSubview:_allMoneyLabel];
    _allMoneyLabel.text = @"合计：¥0.00";
    _allMoneyLabel.font = [UIFont systemFontOfSize:14];
    _allMoneyLabel.textColor  = [UIColor blackColor];
    [_allMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-90);
        make.centerY.equalTo(self);
        make.height.mas_equalTo(25);
    }];
}

- (void)selectAllProductAction:(UIButton *)button {
    if (self.delegate && [self.delegate respondsToSelector:@selector(didTouchPayButtonAction:)]) {
        [self.delegate didTouchPayButtonAction:button];
    }
}

- (void)gotoOderPage {
    if (self.delegate && [self.delegate respondsToSelector:@selector(didTouchAllSelectButtonEvent)]) {
        [self.delegate didTouchAllSelectButtonEvent];
    }
}


@end
