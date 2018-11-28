//
//  NSString+Exts.m
//  BaseProject
//
//  Created by 王向召 on 2018/8/16.
//  Copyright © 2018年 王向召. All rights reserved.
//

#import "NSString+Exts.h"

@implementation NSString (Exts)

NSString *nonullString(NSString *string) {
    return nonullToDefaultString(string, @"");
}

NSString *nonullToDefaultString(NSString *string, NSString *defaultString) {
    if (![string isKindOfClass:[NSString class]]) {
        return defaultString;
    }
    if (!string) {
        return defaultString;
    }
    if ([string isEqualToString:@""] || [string isEqualToString:@"(null)"] || [string isEqualToString:@"<null>"] || [string isEqualToString:@"null"] || string == nil) {
        return defaultString;
    } else {
        return string;
    }
}

@end
