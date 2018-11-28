//
//  WXZGCD.h
//  BaseProject
//
//  Created by 王向召 on 2018/8/16.
//  Copyright © 2018年 王向召. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WXZGCD : NSObject

void dispatch_after_on_main_queue(long seconds, dispatch_block_t block);
void dispatch_async_on_main(dispatch_block_t block);
void dispatch_async_on_global_queue(dispatch_block_t block);
dispatch_source_t dispatch_async_on_global_queu(dispatch_queue_t queue, long timeInterval, dispatch_block_t block);


@end
