//
//  NSMutableAttributedString+Tools.m
//  NewShopCarDemo
//
//  Created by Apple on 2017/1/9.
//  Copyright © 2017年 mgjr. All rights reserved.
//

#import "NSMutableAttributedString+Tools.h"

@implementation NSAttributedString (Tools)

- (NSMutableAttributedString *)changeLabelColorOriginalString:(NSString *)originalString changeString:(NSString *)changeString {
    NSRange changeStringRange = [originalString rangeOfString:changeString];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:originalString];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:changeStringRange];
    return attributedString;
}

@end
