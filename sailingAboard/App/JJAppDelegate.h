//
//  JJAppDelegate.h
//  sailingAboard
//
//  Created by NoodlesWang_PC on 10/24/14.
//  Copyright (c) 2014 Noodles Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeiboSDK.h"
#import "WeiboUser.h"

@interface JJAppDelegate : UIResponder <UIApplicationDelegate, WeiboSDKDelegate>
{
    NSString* wbtoken;
    NSString* wbCurrentUserID;
    WeiboUser* wbUser;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSString *wbtoken;
@property (strong, nonatomic) WeiboUser *wbUser;
@property (strong, nonatomic) NSString *wbCurrentUserID;

@end
