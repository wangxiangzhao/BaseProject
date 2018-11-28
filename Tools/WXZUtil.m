//
//  WXZUtil.m
//  BaseProject
//
//  Created by 王向召 on 2018/8/16.
//  Copyright © 2018年 王向召. All rights reserved.
//

#import "WXZUtil.h"
#import "WXZMessyDefine.h"
#import "WXZGCD.h"

@implementation WXZUtil

+ (UIColor *)colorWithHexString:(NSString *) stringToConvert {
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor colorWithWhite:1.0 alpha:0.5];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor colorWithWhite:1.0 alpha:0.5];
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

+ (CGSize)sizeOfString:(NSString *)string font:(UIFont *)font width:(NSInteger)width {
    NSDictionary * dict = [NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName,nil];
    CGSize size = [string boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return size;
}

+ (void)callMobile:(NSString *)phoneNumber {
    dispatch_async_on_main(^{
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"telprompt://%@",phoneNumber]];
        open_url(url);
    });
}

+ (void)sendMessage:(NSString *)phoneNumber {
    dispatch_async_on_main(^{
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"sms://%@",phoneNumber]];
        open_url(url);
    });
}

+ (NSString *)thousandSeparatorFormat:(NSString *)text isDecimal:(BOOL)decimal {
    if (![text isKindOfClass:[NSString class]]) {
        return decimal ? @"0.00" : @"0";
    }
    if (!text || [text floatValue] == 0) {
        return decimal ? @"0.00" : @"0";
    } else {
        if ([text floatValue] < 1) {
            return [NSString stringWithFormat:@"%.2f", [text floatValue]];
        }
        NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
        [numberFormatter setPositiveFormat:decimal ? @",###.00" : @",###"];
        return [numberFormatter stringFromNumber:[NSNumber numberWithDouble:[text doubleValue]]];
    }
}

+ (NSArray *)rangeArrOfSubString:(NSString *)subString inString:(NSString *)string {
    if (![subString isKindOfClass:[NSString class]]) {
        return @[];
    }
    if (![string isKindOfClass:[NSString class]]) {
        return @[];
    }
    NSMutableString *muString = [string mutableCopy];
    NSMutableArray *rangeArr = [NSMutableArray array];
    while ([muString containsString:subString]) {
        NSRange range = [muString rangeOfString:subString];
        [rangeArr addObject: NSStringFromRange(range)];
        unsigned long newLocationToStartAt = range.location + range.length;
        muString = [[muString substringFromIndex:newLocationToStartAt] mutableCopy];
    }
    return rangeArr;
}

+ (NSString *)formatBankCardNo:(NSString *)No {
    No = [No stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString * newString = @"";
    int num = (int)No.length / 4;//需要插入的“ ”个数
    for (int i = 0; i < num; i ++) {
        NSString *st = [No substringWithRange:NSMakeRange(i * 4, 4)];
        newString = [newString stringByAppendingFormat:@"%@ ",st];
    }
    newString = [newString stringByAppendingFormat:@"%@",[No substringFromIndex:num * 4]];
    return [newString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

@end
