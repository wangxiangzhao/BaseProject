//
//  WXZNotificationCenter.h
//  WXZNotificationCenter
//
//  Created by 王向召 on 2019/2/26.
//  Copyright © 2019 王向召. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WXZNotificationCenter : NSObject

+ (void)addName:(nullable NSNotificationName)aName callHandler:(void(^)(NSNotification *notification))callHandler;

+ (void)postNotificationName:(NSNotificationName)aName userInfo:(nullable NSDictionary *)aUserInfo;

+ (void)removeName:(nullable NSNotificationName)aName;

@end

NS_ASSUME_NONNULL_END
