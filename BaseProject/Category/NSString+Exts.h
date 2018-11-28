//
//  NSString+Exts.h
//  BaseProject
//
//  Created by 王向召 on 2018/8/16.
//  Copyright © 2018年 王向召. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Exts)

NSString *nonullString(NSString *string);
NSString *nonullToDefaultString(NSString *string, NSString *defaultString);

@end
