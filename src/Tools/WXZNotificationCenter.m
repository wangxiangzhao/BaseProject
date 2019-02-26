//
//  WXZNotificationCenter.m
//  WXZNotificationCenter
//
//  Created by 王向召 on 2019/2/26.
//  Copyright © 2019 王向召. All rights reserved.
//

#import "WXZNotificationCenter.h"
#import <objc/runtime.h>

#define WXZOBJNotificationCenter [WXZNotificationCenter defaultCenter]

@interface WXZNotificationCenter ()

@property (nonatomic, copy) void(^notificationCallHandlerBlock)(NSNotification *notification);

@end

@implementation WXZNotificationCenter

+ (instancetype)defaultCenter {
    static WXZNotificationCenter *notificationCenter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        notificationCenter = [[WXZNotificationCenter alloc] init];
    });
    return notificationCenter;
}

+ (void)addName:(nullable NSNotificationName)aName callHandler:(void(^)(NSNotification *notification))callHandler  {
    [[NSNotificationCenter defaultCenter] addObserver:WXZOBJNotificationCenter selector:@selector(notificationSelector:) name:aName object:nil];
    WXZOBJNotificationCenter.notificationCallHandlerBlock = callHandler;
}

+ (void)postNotificationName:(NSNotificationName)aName userInfo:(nullable NSDictionary *)aUserInfo {
    [[NSNotificationCenter defaultCenter] postNotificationName:aName object:nil userInfo:aUserInfo];
}

+ (void)removeName:(nullable NSNotificationName)aName {
    [[NSNotificationCenter defaultCenter] removeObserver:WXZOBJNotificationCenter name:aName object:nil];
}

- (void)notificationSelector:(NSNotification *)notification {
    if (self.notificationCallHandlerBlock) {
        self.notificationCallHandlerBlock(notification);
    }
}

@end
