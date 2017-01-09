//
//  ShopCarCell.m
//  NewShopCarDemo
//
//  Created by Apple on 2017/1/9.
//  Copyright © 2017年 mgjr. All rights reserved.
//

#import "ShopCarCell.h"
#import "ShopCatProductModel.h"

@implementation ShopCarCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.selectButton setImage:IMG(@"shopcat_no_select") forState:UIControlStateNormal];
    [self.selectButton setImage:IMG(@"shopcat_select") forState:UIControlStateSelected];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

- (void)setShopcatProductModel:(ShopCatProductModel *)model {
    
    self.shopName.text = model.productName;
    self.amountLabel.text = [NSString stringWithFormat:@"%.2f",model.productPrice];
    self.countLabel.text = [NSString stringWithFormat:@"%ld",model.productCount];
    if (model.selectStatus) {
        self.selectButton.selected = YES;
    } else {
        self.selectButton.selected = NO;
    }
}


//选取购买商品
- (IBAction)touchSelectButtonEvent:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectProductActionWithIndex:selectFlag:)]) {
        [self.delegate selectProductActionWithIndex:self.indexPath selectFlag:sender.selected];
    }
}


//减数量
- (IBAction)touchDeselectButtonEvent:(UIButton *)sender {
    
    if (self.delegate&&[self.delegate respondsToSelector:@selector(subProductCountActionWithIndex:)]) {
        [self.delegate subProductCountActionWithIndex:self.indexPath];
    }
}

//增数量
- (IBAction)touchAddButtonEvent:(UIButton *)sender {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(addProductCountActionWithIndex:)]) {
        [self.delegate addProductCountActionWithIndex:self.indexPath];
    }
    
}

//删除商品
- (IBAction)touchEliminateButtonEvent:(UIButton *)sender {
    
    if (self.delegate&&[self.delegate respondsToSelector:@selector(deleteProductActionWithIndex:)]) {
        [self.delegate deleteProductActionWithIndex:self.indexPath];
    }
}


@end
