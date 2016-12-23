//
//  TableHeaderView.m
//  NewShopCarDemo
//
//  Created by Apple on 2016/12/23.
//  Copyright © 2016年 mgjr. All rights reserved.
//

#import "TableHeaderView.h"

@implementation TableHeaderView
+ (instancetype)loadTableHeaderViewFromXib {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.headNameLabel.layer.cornerRadius = 3.0f;
    self.headNameLabel.clipsToBounds = YES;
}

- (IBAction)touchSelectButtonEvent:(UIButton *)sender {
    
    
}
@end
