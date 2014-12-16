//
//  JJNetManager.h
//  sailingAboard
//
//  Created by xiangming on 14-12-16.
//  Copyright (c) 2014年 Noodles Wang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JJNetManager : NSObject
/**
 *  检测网络函数
 *
 *  @return 有网络时 YES
 */
+ (BOOL)isNetworkRunning;

@end
