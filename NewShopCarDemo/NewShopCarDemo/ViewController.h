//
//  ViewController.h
//  NewShopCarDemo
//
//  Created by Apple on 2016/12/23.
//  Copyright © 2016年 mgjr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UILabel *amountLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)touchSettlementButtonEvent:(UIButton *)sender;
- (IBAction)touchSelectButtonEvent:(UIButton *)sender;
@end

