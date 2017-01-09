//
//  ShopCarViewController.m
//  NewShopCarDemo
//
//  Created by Apple on 2017/1/9.
//  Copyright © 2017年 mgjr. All rights reserved.
//

#import "ShopCarViewController.h"
#import "BottomView.h"
#import "TableViewHeaderView.h"
#import "ShopCarCell.h"
#import "ShopcarModel.h"
#import "ShopCatProductModel.h"

@interface ShopCarViewController ()<UITableViewDelegate,UITableViewDataSource,BottomViewDelegate,ShopCarCellDelegate,TableViewHeadViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataArray;
@property (strong, nonatomic) BottomView *bottomView;

@end

@implementation ShopCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"购物车";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(exitPage)];
    
    [self tableView];
    [self bottomView];
    [self setShopData];
}

#pragma setTableView 
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, MainScreen_size_width, MainScreen_size_height - tabbar_height) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        //创建段头和列表
        [_tableView registerClass:[TableViewHeaderView class] forHeaderFooterViewReuseIdentifier:TableViewHeaderViewID];
        [_tableView registerNib:[UINib nibWithNibName:ShopCarCellID bundle:nil] forCellReuseIdentifier:ShopCarCellID];
    }
    return _tableView;
}

#pragma mark - setBottomView
- (BottomView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[BottomView alloc] initWithFrame:CGRectMake(0, MainScreen_size_height - tabbar_height, MainScreen_size_width, tabbar_height)];
        _bottomView.delegate = self;
        [self.view addSubview:_bottomView];
    }
    return _bottomView;
}

#pragma mark - setData 
- (void)setShopData {
    self.dataArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < 10; i++) {
        ShopcarModel *model = [[ShopcarModel alloc] init];
        model.shopName      = [NSString stringWithFormat:@"精品商店%d",(int)i];
        model.selectStatus  = NO;
        model.productArray  = [[NSMutableArray alloc] init];
        for (int j = 0; j < 5; j++) {
            ShopCatProductModel *productModel = [[ShopCatProductModel alloc] init];
            productModel.productName  = [NSString stringWithFormat:@"%d号香水",(int)j];
            productModel.selectStatus = NO;
            productModel.productPrice = arc4random()%100;
            productModel.productCount = 1;
            [model.productArray addObject:productModel];
        }
        [self.dataArray addObject:model];
    }
    [self.tableView reloadData];
    [self updateAllpriceAction];
}

- (void)updateAllpriceAction {
    CGFloat allmoney = 0;
    NSInteger count  = 0;
    for (ShopcarModel *shopModel in self.dataArray) {
        for (ShopCatProductModel *productModel in shopModel.productArray) {
            if (productModel.selectStatus) {
                allmoney += productModel.productPrice;
                count ++;
            }
        }
    }
    NSString *moneys = [NSString stringWithFormat:@"¥%.2f",allmoney];
    NSString *tempString = [@"合计：" stringByAppendingString:moneys];
    self.bottomView.allMoneyLabel.text = tempString;
    [self.bottomView.payButton setTitle:[NSString stringWithFormat:@"付款(%ld)", count] forState:UIControlStateNormal];
}


#pragma mark - tableView delegate && dataSource 
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    ShopcarModel *model = self.dataArray[section];
    return model.productArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 110;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ShopCarCell *cell = [tableView dequeueReusableCellWithIdentifier:ShopCarCellID];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"ShopCarCell" owner:self options:nil].lastObject;
    }
    
    cell.indexPath = indexPath;
    cell.delegate = self;
    
    ShopcarModel *shopModel = self.dataArray[indexPath.section];
    ShopCatProductModel *productModel = shopModel.productArray[indexPath.row];
    
    [cell setShopcatProductModel:productModel];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)exitPage {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - header
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    TableViewHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:TableViewHeaderViewID];
    headerView.delegate = self;
    headerView.section = section;
    ShopcarModel *model = self.dataArray[section];
    headerView.shopName.text = model.shopName;
    if (model.selectStatus) {
        headerView.selectBtn.selected = YES;
    }else {
        headerView.selectBtn.selected = NO;
    }
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}


#pragma mark BottomViewDelegate
- (void)didTouchPayButtonAction:(UIButton *)button {
    button.selected = !button.selected;
    for (ShopcarModel *shopModel in self.dataArray) {
        shopModel.selectStatus = button.selected;
        for (ShopCatProductModel *productModel in shopModel.productArray) {
            productModel.selectStatus = button.selected;
        }
    }
    [self.tableView reloadData];
    [self updateAllpriceAction];
}

- (void)didTouchAllSelectButtonEvent {
    
}

#pragma mark - TableHeaderViewDelegate
- (void)didTouchHeadViewCurrectSectionsInView:(NSInteger)section selectStatus:(BOOL)selectStatus {
    ShopcarModel *shopModel = self.dataArray[section];
    shopModel.selectStatus = selectStatus;
    for (ShopCatProductModel *productModel in shopModel.productArray) {
         productModel.selectStatus = selectStatus;
    }
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationNone];
    [self updateAllpriceAction];
}

- (void)didTouchHeadViewDeleteCurrectSectionsInView:(NSInteger)section {
    if (self.dataArray.count > section) {
        [self.dataArray removeObjectAtIndex:section];
        [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationNone];
    }
}

#pragma mark - ShopCarCellDelegate

- (void)selectProductActionWithIndex:(NSIndexPath *)indexPath selectFlag:(BOOL)selectFlag {
    ShopcarModel *shopModel = self.dataArray[indexPath.section];
    ShopCatProductModel *productModel = shopModel.productArray[indexPath.row];
    productModel.selectStatus = selectFlag;
    [self updateAllpriceAction];
}

- (void)addProductCountActionWithIndex:(NSIndexPath *)indexPath {
    ShopcarModel *shopModel = self.dataArray[indexPath.section];
    ShopCatProductModel *productModel = shopModel.productArray[indexPath.row];
    productModel.productCount ++;
    [self.tableView reloadData];
    [self updateAllpriceAction];
}

- (void)subProductCountActionWithIndex:(NSIndexPath *)indexPath {
    ShopcarModel *shopModel = self.dataArray[indexPath.section];
    ShopCatProductModel *productModel = shopModel.productArray[indexPath.row];
    productModel.productCount --;
    if (productModel.productCount <= 0) {
        productModel.productCount = 1;
    }
    [self.tableView reloadData];
    [self updateAllpriceAction];
}

- (void)deleteProductActionWithIndex:(NSIndexPath *)indexPath {
    ShopcarModel *shopModel = self.dataArray[indexPath.section];
    if (shopModel.productArray.count > indexPath.row) {
        [shopModel.productArray removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationNone];
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationNone];
        if (!shopModel.productArray.count) {
            [self.dataArray removeObjectAtIndex:indexPath.section];
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationNone];
            [self.tableView reloadData];
        }
    }
    [self updateAllpriceAction];
}

@end
