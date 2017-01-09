//
//  BottomView.h
//  NewShopCarDemo
//
//  Created by Apple on 2017/1/9.
//  Copyright © 2017年 mgjr. All rights reserved.
//


#import <UIKit/UIKit.h>

@protocol BottomViewDelegate <NSObject>

@optional

- (void)didTouchPayButtonAction:(UIButton *)button;

- (void)didTouchAllSelectButtonEvent;

@end

@interface BottomView : UIView

@property (strong, nonatomic) UILabel *allMoneyLabel;
@property (strong, nonatomic) UIButton *payButton;
@property (nonatomic, assign) id<BottomViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame;

@end
