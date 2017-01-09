//
//  ShopcarModel.h
//  NewShopCarDemo
//
//  Created by Apple on 2017/1/9.
//  Copyright © 2017年 mgjr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShopcarModel : NSObject
@property (nonatomic, strong) NSString *shopName;
@property (nonatomic, assign) BOOL selectStatus;
@property (nonatomic, strong) NSMutableArray *productArray;
@end
