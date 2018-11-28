//
//  WXZUtil.h
//  BaseProject
//
//  Created by 王向召 on 2018/8/16.
//  Copyright © 2018年 王向召. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WXZUtil : NSObject

//16进制颜色转换
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;
//字符串size
+ (CGSize)sizeOfString:(NSString *)string font:(UIFont *)font width:(NSInteger)width;
//打电话
+ (void)callMobile:(NSString *)phoneNumber;
//发消息
+ (void)sendMessage:(NSString *)phoneNumber;
//添加千分符
+ (NSString *)thousandSeparatorFormat:(NSString *)text isDecimal:(BOOL)decimal;
//子字符串在字符串中所有的位置
+ (NSArray *)rangeArrOfSubString:(NSString *)subString inString:(NSString *)string;
//格式化银行卡
+ (NSString *)formatBankCardNo:(NSString *)No;

@end
