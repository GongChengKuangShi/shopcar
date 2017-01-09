//
//  ShopCarCell.h
//  NewShopCarDemo
//
//  Created by Apple on 2017/1/9.
//  Copyright © 2017年 mgjr. All rights reserved.
//


#import <UIKit/UIKit.h>
@class ShopCatProductModel;

@protocol ShopCarCellDelegate <NSObject>
@optional
- (void)selectProductActionWithIndex:(NSIndexPath *)indexPath selectFlag:(BOOL)selectFlag;
- (void)addProductCountActionWithIndex:(NSIndexPath *)indexPath;
- (void)subProductCountActionWithIndex:(NSIndexPath *)indexPath;
- (void)deleteProductActionWithIndex:(NSIndexPath *)indexPath;
@end

static NSString * const ShopCarCellID = @"ShopCarCell";

@interface ShopCarCell : UITableViewCell

@property (assign, nonatomic) id<ShopCarCellDelegate> delegate;
@property (strong, nonatomic) NSIndexPath *indexPath;
@property (weak, nonatomic) IBOutlet UIButton *selectButton;
@property (weak, nonatomic) IBOutlet UILabel *shopName;
@property (weak, nonatomic) IBOutlet UILabel *amountLabel;
@property (weak, nonatomic) IBOutlet UIButton *deselectButton;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UITextField *countLabel;
@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;


- (IBAction)touchSelectButtonEvent:(UIButton *)sender;
- (IBAction)touchDeselectButtonEvent:(UIButton *)sender;
- (IBAction)touchAddButtonEvent:(UIButton *)sender;
- (IBAction)touchEliminateButtonEvent:(UIButton *)sender;
- (void)setShopcatProductModel:(ShopCatProductModel *)model;

@end
