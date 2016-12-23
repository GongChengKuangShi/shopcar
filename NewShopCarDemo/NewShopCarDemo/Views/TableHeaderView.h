//
//  TableHeaderView.h
//  NewShopCarDemo
//
//  Created by Apple on 2016/12/23.
//  Copyright © 2016年 mgjr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableHeaderView : UIView

@property (weak, nonatomic) IBOutlet UIButton *selectButton;
@property (weak, nonatomic) IBOutlet UILabel *headNameLabel;

- (IBAction)touchSelectButtonEvent:(UIButton *)sender;
+ (instancetype)loadTableHeaderViewFromXib;
@end
