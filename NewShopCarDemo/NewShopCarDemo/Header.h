//
//  Header.h
//  NewShopCarDemo
//
//  Created by Apple on 2016/12/23.
//  Copyright © 2016年 mgjr. All rights reserved.
//

#ifndef Header_h
#define Header_h

#import "Masonry.h"
#import "NSMutableAttributedString+Tools.h"

#define MainScreen_size_width  [UIScreen mainScreen].bounds.size.width
#define MainScreen_size_height [UIScreen mainScreen].bounds.size.height
#define tabbar_height 48

#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define IMG(name)       [UIImage imageNamed:name]
#endif /* Header_h */
