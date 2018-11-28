//
//  UIView+Exts.m
//  BaseProject
//
//  Created by 王向召 on 2018/8/16.
//  Copyright © 2018年 王向召. All rights reserved.
//

#import "UIView+Exts.h"

@implementation UIView (Exts)

- (void)setWxz_x:(CGFloat)wxz_x {
    CGRect frame = self.frame;
    frame.origin.x = wxz_x;
    self.frame = frame;
}

- (CGFloat)wxz_x {
    return self.frame.origin.x;
}

- (void)setWxz_y:(CGFloat)wxz_y {
    CGRect frame = self.frame;
    frame.origin.y = wxz_y;
    self.frame = frame;
}

- (CGFloat)wxz_y {
    return self.frame.origin.y;
}

- (void)setWxz_w:(CGFloat)wxz_w {
    CGRect frame = self.frame;
    frame.size.width = wxz_w;
    self.frame = frame;
}

- (CGFloat)wxz_w {
    return self.frame.size.width;
}

- (void)setWxz_h:(CGFloat)wxz_h {
    CGRect frame = self.frame;
    frame.size.height = wxz_h;
    self.frame = frame;
}

- (CGFloat)wxz_h {
    return self.frame.size.height;
}

- (void)setWxz_size:(CGSize)wxz_size {
    CGRect frame = self.frame;
    frame.size = wxz_size;
    self.frame = frame;
}

- (CGSize)wxz_size {
    return self.frame.size;
}

- (void)setWxz_origin:(CGPoint)wxz_origin {
    CGRect frame = self.frame;
    frame.origin = wxz_origin;
    self.frame = frame;
}

- (CGPoint)wxz_origin {
    return self.frame.origin;
}

- (CGFloat)wxz_maxX {
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)wxz_maxY {
    return CGRectGetMaxX(self.frame);
}

@end
