//
//  ViewController.m
//  NewShopCarDemo
//
//  Created by Apple on 2016/12/23.
//  Copyright © 2016年 mgjr. All rights reserved.
//

#import "ViewController.h"
#import "ShopTableViewCell.h"
#import "TableHeaderView.h"

#define DefaultBgColor RGBA(244, 244, 244, 1)

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController

static NSString *ShopTableViewCellID = @"ShopTableViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setviewUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
}

#pragma mark -- setViewUI
- (void)setviewUI {
    CGFloat space = 10;
    CGFloat temp = 0;
    self.tableView.contentInset = UIEdgeInsetsMake(temp, temp, temp, temp);
    self.tableView.backgroundColor = DefaultBgColor;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(temp, temp, MainScreen_size_width, space)];
    footView.backgroundColor = DefaultBgColor;
    self.tableView.tableFooterView = footView;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ShopTableViewCell" bundle:nil] forCellReuseIdentifier:ShopTableViewCellID];
}

#pragma mark -- 数据处理
- (void)loadDataWithPlist {
    
}


#pragma mark -- UITableViewDelegate And UITableViewDatasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ShopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ShopTableViewCellID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ShopTableViewCell" owner:self options:nil] lastObject];
    }
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    TableHeaderView *headerView = [TableHeaderView loadTableHeaderViewFromXib];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return  40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

#pragma mark button点击事件
- (IBAction)touchSettlementButtonEvent:(UIButton *)sender {
    
    
}

- (IBAction)touchSelectButtonEvent:(UIButton *)sender {
    
    
    
}
@end
