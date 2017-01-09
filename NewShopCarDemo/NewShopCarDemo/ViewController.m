//
//  ViewController.m
//  NewShopCarDemo
//
//  Created by Apple on 2016/12/23.
//  Copyright © 2016年 mgjr. All rights reserved.
//

#import "ViewController.h"
#import "ShopCarViewController.h"

#define DefaultBgColor RGBA(244, 244, 244, 1)

@interface ViewController ()
@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"click me " forState:0];
    button.backgroundColor =[UIColor greenColor];
    [self.view addSubview:button];
    button.frame = CGRectMake(100, 100, 100, 100);
    [button addTarget:self action:@selector(enterShopcat) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
}

- (void)enterShopcat {
    ShopCarViewController *vc = [[ShopCarViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:nil];
    
}



@end
