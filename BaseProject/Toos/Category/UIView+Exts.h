//
//  UIView+Exts.h
//  BaseProject
//
//  Created by 王向召 on 2018/8/16.
//  Copyright © 2018年 王向召. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Exts)

@property (assign, nonatomic) CGFloat wxz_x;
@property (assign, nonatomic) CGFloat wxz_y;
@property (assign, nonatomic) CGFloat wxz_w;
@property (assign, nonatomic) CGFloat wxz_h;
@property (assign, nonatomic) CGSize wxz_size;
@property (assign, nonatomic) CGPoint wxz_origin;

@property (assign, nonatomic, readonly) CGFloat wxz_maxX;
@property (assign, nonatomic, readonly) CGFloat wxz_maxY;

@end
