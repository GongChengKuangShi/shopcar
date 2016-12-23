//
//  ShopTableViewCell.h
//  NewShopCarDemo
//
//  Created by Apple on 2016/12/23.
//  Copyright © 2016年 mgjr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *statusButton;
@property (weak, nonatomic) IBOutlet UIImageView *contentImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (weak, nonatomic) IBOutlet UILabel *reductionLabel;
@property (weak, nonatomic) IBOutlet UILabel *addLabel;
@property (weak, nonatomic) IBOutlet UILabel *middleCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *edteilViewMiddleLabel;
@property (weak, nonatomic) IBOutlet UILabel *colorLabel;
@property (weak, nonatomic) IBOutlet UILabel *sizeLabel;
@property (weak, nonatomic) IBOutlet UIView *edteilView;

- (IBAction)touchAddButtonEvent:(UIButton *)sender;
- (IBAction)touchEdteilViewDelectButtonEvent:(UIButton *)sender;
- (IBAction)touchDeleteButtonEvent:(UIButton *)sender;

@end
