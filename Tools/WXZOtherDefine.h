//
//  WXZOtherDefine.h
//  BaseProject
//
//  Created by 王向召 on 2018/11/28.
//  Copyright © 2018 王向召. All rights reserved.
//

#ifndef WXZOtherDefine_h
#define WXZOtherDefine_h

#ifdef __OBJC__
#import "WXZDeviceInfoManager.h"
#endif

#define ADD_OBSERVER(KEY, OBJECT) [[NSNotificationCenter defaultCenter] rac_addObserverForName:(KEY) object:(OBJECT)]
#define POST_NOTIFICATION(KEY, OBJECT, USERINFO) [[NSNotificationCenter defaultCenter] postNotificationName:(KEY) object:(OBJECT) userInfo:(USERINFO)]

#define Device_Is_iPhoneX [DeviceInfoManager iPhoneXSeries]

#define DeviceVerison [DeviceInfoManager sharedManager].getDeviceVersion
#define IOS11_OR_LATER DeviceVerison >= 11.0

#endif /* WXZOtherDefine_h */
