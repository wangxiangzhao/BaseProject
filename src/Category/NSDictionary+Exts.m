//
//  NSDictionary+Exts.m
//  BaseProject
//
//  Created by 王向召 on 2018/8/16.
//  Copyright © 2018年 王向召. All rights reserved.
//

#import "NSDictionary+Exts.h"

@implementation NSDictionary (Exts)

NSDictionary * nonllDictionary(NSDictionary *dict) {
    if (![dict isKindOfClass:[NSDictionary class]]) {
        return @{};
    }
    if (dict == nil) {
        return @{};
    }
    return dict;
}

@end
