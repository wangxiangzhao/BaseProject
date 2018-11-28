//
//  WXZMessyDefine.h
//  BaseProject
//
//  Created by 王向召 on 2018/8/16.
//  Copyright © 2018年 王向召. All rights reserved.
//

#ifndef WXZMessyDefine_h
#define WXZMessyDefine_h

#define open_url(url)             \
if (@available(iOS 10.0, *)) {          \
[[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];  \
} else {        \
    [[UIApplication sharedApplication] openURL:url];        \
}

#ifdef DEBUG
#define WXZLog(format, ...) printf("%s\n\n",[[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String])
#else
#define WXZLog(format, ...)
#endif

#define SCREEN_WIDTH  [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGTH [[UIScreen mainScreen] bounds].size.height
#define NAVI_HEIGHT  ((SCREEN_HEIGTH >= 812) ? 88 : 64)
#define TAB_BAR_HEIGHT ((SCREEN_HEIGTH >= 812) ? 83 : 49)
#define USABLE_SCREEN_HEIGTH (SCREEN_HEIGTH - NAVI_HEIGHT - TAB_BAR_HEIGHT)

#endif /* WXZMessyDefine_h */
