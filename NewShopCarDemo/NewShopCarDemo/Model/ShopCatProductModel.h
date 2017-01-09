//
//  ShopCatProductModel.h
//  NewShopCarDemo
//
//  Created by Apple on 2017/1/9.
//  Copyright © 2017年 mgjr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShopCatProductModel : NSObject
@property (nonatomic, strong) NSString *productName;
@property (nonatomic, assign) BOOL selectStatus;
@property (nonatomic, assign) NSInteger productCount;
@property (nonatomic, assign) CGFloat productPrice;
@end
