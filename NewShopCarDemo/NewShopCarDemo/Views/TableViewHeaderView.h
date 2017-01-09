//
//  TableViewHeaderView.h
//  NewShopCarDemo
//
//  Created by Apple on 2017/1/9.
//  Copyright © 2017年 mgjr. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TableViewHeadViewDelegate <NSObject>
@optional
- (void)didTouchHeadViewCurrectSectionsInView:(NSInteger)section selectStatus:(BOOL)selectStatus;
- (void)didTouchHeadViewDeleteCurrectSectionsInView:(NSInteger)section;
@end

static NSString * const TableViewHeaderViewID = @"UITableViewHeaderFooterView";

@interface TableViewHeaderView : UITableViewHeaderFooterView

@property (assign, nonatomic) id<TableViewHeadViewDelegate> delegate;
@property (strong, nonatomic) UIButton *selectBtn;
@property (nonatomic, strong) UILabel *shopName;
@property (nonatomic, assign) NSInteger section;

@end
