//
//  WXZTimer.h
//  BaseProject
//
//  Created by 王向召 on 2018/8/16.
//  Copyright © 2018年 王向召. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WXZTimer : NSObject

+ (WXZTimer *)timerWithTimeOut:(long long)timeOut
                  timeInterval:(NSTimeInterval)timeInterval
                  eventHandler:(void(^)(long long remainSeconds, BOOL *stop))eventHandler
                 finishedBlock:(void(^)(void))finishedBlock;

+ (WXZTimer *)timerWithStartDate:(NSDate *)startDate
                         endDate:(NSDate *)endDate
                    timeInterval:(NSTimeInterval)timeInterval
                    eventHandler:(void(^)(NSInteger day,NSInteger hour,NSInteger minute,NSInteger second, BOOL *stop))eventHandler
                   finishedBlock:(void (^)(NSInteger day,NSInteger hour,NSInteger minute,NSInteger second))finishedBlock;

- (void)cancelTimer;

@end
