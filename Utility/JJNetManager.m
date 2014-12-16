

//
//  JJNetManager.m
//  sailingAboard
//
//  Created by xiangming on 14-12-16.
//  Copyright (c) 2014年 Noodles Wang. All rights reserved.
//

#import "JJNetManager.h"
#import "Reachability.h"

@implementation JJNetManager

+ (BOOL)isNetworkRunning
{
    Reachability * reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus state = reachability.currentReachabilityStatus;
    BOOL result = NO;
    switch (state) {
        case NotReachable: {
            result = NO;
        }
            break;
        case ReachableViaWiFi: {
            result = YES;
        }
            break;
        case ReachableViaWWAN: {
            result = YES;
        }
            break;
        default: {
            result = YES;
        }
            break;
    }
    return result;
}


@end
