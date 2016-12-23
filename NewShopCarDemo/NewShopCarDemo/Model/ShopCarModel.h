//
//  ShopCarModel.h
//  NewShopCarDemo
//
//  Created by Apple on 2016/12/23.
//  Copyright © 2016年 mgjr. All rights reserved.
//

#import <Foundation/Foundation.h>

/*****************最里面层的model,字段cdPrice、cdImage、cdName*******************/

@interface DetailCDModel : NSObject

/** 价格*/
@property (nonatomic,copy)NSString *cdPrice;

/** 图片*/
@property (nonatomic,copy)NSString *cdImage;

/** 歌曲名字*/
@property (nonatomic,copy)NSString *cdName;

/** cd的个数*/
@property (nonatomic,copy)NSString *cdChooseCount;

/** 记录是否选中*/
@property (nonatomic,assign)BOOL  isChoose;


-(instancetype)initWithCdModelWithDic:(NSDictionary *)dic;

@end

/*处理中层model*/
@interface DetailModel : NSObject

/** 歌手名字*/
@property (copy, nonatomic) NSString *name;

/** 区头是否选中*/
@property (assign, nonatomic) BOOL isChoose;

/** 每个区的价格总和*/
@property (assign, nonatomic) NSInteger sectionTotalPrice;

/** 记录选中的cell*/
@property (nonatomic,strong)NSMutableArray *recordCdModelSelected ;

/** 存放model*/
@property (nonatomic,strong)NSMutableArray *detailDateArr ;

/** 记录选中的行*/
@property (nonatomic,assign)NSInteger  indexPathRow;

/** 记录选中的区*/
@property (nonatomic,assign)NSInteger  indexPathSection;

-(instancetype)initWithDic:(NSDictionary *)dictionary;

@end




/*******处理最外层model*******/
@interface ShopCarModel : NSObject
/*记录全选*/
@property (strong, nonatomic) NSMutableArray *recordArray;
/*储存model*/
@property (strong, nonatomic) NSMutableArray *headModelArray;
+ (instancetype)shopCarModelWith:(NSArray *)array;
- (instancetype)initWithModelArray:(NSArray *)array;
@end
