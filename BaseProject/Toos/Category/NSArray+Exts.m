//
//  NSArray+Exts.m
//  BaseProject
//
//  Created by 王向召 on 2018/8/16.
//  Copyright © 2018年 王向召. All rights reserved.
//

#import "NSArray+Exts.h"

@implementation NSArray (Exts)

NSArray * nonllArray(NSArray *array) {
    if (![array isKindOfClass:[NSArray class]]) {
        return @[];
    }
    if (array == nil) {
        return @[];
    }
    return array;
}

- (id (^)(NSInteger index))object {
    return ^ (NSInteger index) {
        if (index < 0 || index >= self.count) {
            return (id)nil;
        }
        return (id)[self objectAtIndex:index];
    };
}

- (id (^)(NSInteger index, id defaultValue))nonullobject {
    return ^ (NSInteger index, id defaultValue) {
        if (index < 0 || index >= self.count) {
            return defaultValue;
        }
        return (id)[self objectAtIndex:index];
    };
}

@end
