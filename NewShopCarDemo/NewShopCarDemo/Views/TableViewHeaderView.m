//
//  TableViewHeaderView.m
//  NewShopCarDemo
//
//  Created by Apple on 2017/1/9.
//  Copyright © 2017年 mgjr. All rights reserved.
//

#import "TableViewHeaderView.h"

@implementation TableViewHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self initWithBaseView];
    }
    return self;
}

- (void)initWithBaseView {
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.frame = CGRectMake(0, 0, MainScreen_size_width, 50);
    self.selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.contentView addSubview:self.selectBtn];
    
    [self.selectBtn setImage:IMG(@"shopcat_no_select") forState:UIControlStateNormal];
    [self.selectBtn setImage:IMG(@"shopcat_select") forState:UIControlStateSelected];
    self.selectBtn.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    [self.selectBtn addTarget:self action:@selector(selectAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(5);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(40);
    }];
    self.shopName = [[UILabel alloc] init];
    [self.contentView addSubview:self.shopName];
    [self.shopName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(60);
        make.height.mas_equalTo(30);
        ;
    }];
    
    UIButton *deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.contentView addSubview:deleteBtn];
    [deleteBtn setImage:IMG(@"mer_x_shop.png") forState:UIControlStateNormal];
    deleteBtn.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    [deleteBtn addTarget:self action:@selector(deleteSectionAction) forControlEvents:UIControlEventTouchUpInside];
    [deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.contentView).offset(5);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(40);
    }];
}

#pragma mark - Action
- (void)deleteSectionAction {
    if (self.delegate && [self.delegate respondsToSelector:@selector(didTouchHeadViewDeleteCurrectSectionsInView:)]) {
        [self.delegate didTouchHeadViewDeleteCurrectSectionsInView:self.section];
    }
}

- (void)selectAction:(UIButton *)button {
    button.selected = !button.selected;
    if (self.delegate && [self.delegate respondsToSelector:@selector(didTouchHeadViewCurrectSectionsInView:selectStatus:)]) {
        [self.delegate didTouchHeadViewCurrectSectionsInView:self.section selectStatus:button.selected];
    }
}

@end
