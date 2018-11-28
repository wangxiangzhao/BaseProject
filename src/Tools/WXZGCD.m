//
//  WXZGCD.m
//  BaseProject
//
//  Created by 王向召 on 2018/8/16.
//  Copyright © 2018年 王向召. All rights reserved.
//

#import "WXZGCD.h"

@implementation WXZGCD

void dispatch_after_on_main(long seconds, dispatch_block_t block) {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(seconds * NSEC_PER_SEC)), dispatch_get_main_queue(), block);
}

void dispatch_async_on_main(dispatch_block_t block) {
    dispatch_async(dispatch_get_main_queue(), block);
}

void dispatch_async_on_global_queue(dispatch_block_t block) {
    dispatch_async(dispatch_get_global_queue(0, 0), block);
}

dispatch_source_t dispatch_async_on_global_queu(dispatch_queue_t queue, long timeInterval, dispatch_block_t block) {
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, dispatch_walltime(NULL, 0) * NSEC_PER_SEC, timeInterval * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, block);
    dispatch_resume(timer);
    return timer;
}

@end
