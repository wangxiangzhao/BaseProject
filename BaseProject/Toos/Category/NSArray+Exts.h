//
//  NSArray+Exts.h
//  BaseProject
//
//  Created by 王向召 on 2018/8/16.
//  Copyright © 2018年 王向召. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Exts)

NSArray * nonllArray(NSArray *array);

- (id (^)(NSInteger index))object;
- (id (^)(NSInteger index, id defaultValue))nonullobject;

@end
