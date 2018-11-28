//
//  WXZTimer.m
//  BaseProject
//
//  Created by 王向召 on 2018/8/16.
//  Copyright © 2018年 王向召. All rights reserved.
//

#import "WXZTimer.h"

@interface WXZTimer ()

@property (nonatomic, strong) dispatch_source_t timer;

@end

@implementation WXZTimer

+ (WXZTimer *)timerWithTimeOut:(long long)timeOut
                  timeInterval:(NSTimeInterval)timeInterval
                  eventHandler:(void(^)(long long remainSeconds, BOOL *stop))eventHandler
                 finishedBlock:(void(^)(void))finishedBlock {
    __block long long _timeOut = timeOut;
    WXZTimer *timer = [[WXZTimer alloc] init];
    if (timeOut > 0) {
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        timer.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
        dispatch_source_set_timer(timer.timer,dispatch_walltime(NULL, 0),timeInterval * NSEC_PER_SEC, 0);
        dispatch_source_set_event_handler(timer.timer, ^{
            dispatch_async(dispatch_get_main_queue(), ^{
                BOOL stop = NO;
                if (eventHandler) {
                    eventHandler(_timeOut, &stop);
                }
                if (stop) [timer cancelTimer];
            });
            if (_timeOut == 0) {
                [timer cancelTimer];
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (finishedBlock) {
                        finishedBlock();
                    }
                });
            }
            _timeOut --;
        });
        dispatch_resume(timer.timer);
    } else {
        if (finishedBlock) {
            finishedBlock();
        }
    }
    return timer;
}

+ (WXZTimer *)timerWithStartDate:(NSDate *)startDate
                         endDate:(NSDate *)endDate
                    timeInterval:(NSTimeInterval)timeInterval
                    eventHandler:(void(^)(NSInteger day,NSInteger hour,NSInteger minute,NSInteger second, BOOL *stop))eventHandler
                   finishedBlock:(void (^)(NSInteger day,NSInteger hour,NSInteger minute,NSInteger second))finishedBlock {
    WXZTimer *timer = [[WXZTimer alloc] init];
    __block NSTimeInterval timeout =[endDate timeIntervalSinceDate:startDate];
    if (timeout > 0) {
        [WXZTimer timerWithTimeOut:timeout timeInterval:timeInterval eventHandler:^(long long remainSeconds, BOOL *stop) {
            NSInteger days = (NSInteger)(remainSeconds / (3600 * 24));
            NSInteger hours = (NSInteger)((remainSeconds - days * 24 * 3600) / 3600);
            NSInteger minute = (NSInteger)(remainSeconds - days * 24 * 3600 - hours * 3600) / 60;
            NSInteger second = remainSeconds - days * 24 * 3600 - hours * 3600 - minute * 60;
            if (eventHandler) {
                eventHandler(days, hours, minute, second, stop);
            }
        } finishedBlock:^{
            if (finishedBlock) {
                finishedBlock(0, 0, 0, 0);
            }
        }];
    } else {
        if (finishedBlock) {
            finishedBlock(0, 0, 0, 0);
        }
    }
    return timer;
}

- (void)cancelTimer {
    if (self.timer) {
        dispatch_source_cancel(self.timer);
        self.timer = nil;
    }
}

@end
