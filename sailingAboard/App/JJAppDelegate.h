//
//  JJAppDelegate.h
//  sailingAboard
//
//  Created by NoodlesWang_PC on 10/24/14.
//  Copyright (c) 2014 Noodles Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeiboSDK.h"
#import "ASIHTTPRequest.h"

@interface JJAppDelegate : UIResponder <UIApplicationDelegate, WeiboSDKDelegate, ASIHTTPRequestDelegate>
{
    UIView *loginView;
    NSString* wbtoken;
}
@property (strong, nonatomic) UIWindow *window;

@end
