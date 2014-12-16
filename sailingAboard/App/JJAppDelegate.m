//
//  JJAppDelegate.m
//  sailingAboard
//
//  Created by NoodlesWang_PC on 10/24/14.
//  Copyright (c) 2014 Noodles Wang. All rights reserved.
//

#import "JJAppDelegate.h"
#import "JJLoginViewController.h"

@implementation JJAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // sina login
    [WeiboSDK enableDebugMode:YES];
    [WeiboSDK registerApp:kAppKey];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    if (1) {
        [self showLoginView];
    }
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)showLoginView
{
    JJLoginViewController *loginViewController = [[JJLoginViewController alloc] initWithNibName:nil bundle:nil];
    [self.window.rootViewController presentViewController:loginViewController animated:NO completion:nil];
}

#pragma mark - weibo delegate

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return [WeiboSDK handleOpenURL:url delegate:self];
}

- (void)didReceiveWeiboRequest:(WBBaseRequest *)request
{
    
}

- (void)didReceiveWeiboResponse:(WBBaseResponse *)response
{
    
//    if ([response isKindOfClass:WBSendMessageToWeiboResponse.class])        //发送结果
//    {
//        NSString *message = nil;
//        switch (response.statusCode) {
//            case WeiboSDKResponseStatusCodeSuccess:
//                message = @"微博分享成功";
//                break;
//            case WeiboSDKResponseStatusCodeUserCancel:
//                message = @"分享已取消";
//                break;
//            case WeiboSDKResponseStatusCodeSentFail:
//                message = @"微博分享成功";
//                break;
//            case WeiboSDKResponseStatusCodeAuthDeny:
//                message = @"授权失败";
//                break;
//            case WeiboSDKResponseStatusCodeUserCancelInstall:
//                message = @"用户取消安装微博客户端";
//                break;
//            case WeiboSDKResponseStatusCodeUnsupport:
//                message = @"不支持的请求";
//                break;
//                
//            default:
//                message = @"未知错误";
//                break;
//        }
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:message delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil];
//        [alert show];
//    }
    if ([response isKindOfClass:WBAuthorizeResponse.class])        // 登录认证
    {
        
        if (response.statusCode == WeiboSDKResponseStatusCodeSuccess) {     // 认证成功才将数据保存并回调
            NSLog(@"登陆成功");
            NSString *userid = [(WBAuthorizeResponse *)response userID];
            wbtoken = [(WBAuthorizeResponse *)response accessToken];
            
            NSString * oauthString = [NSString stringWithFormat:@"https://api.weibo.com/2/users/show.json?uid=%@&access_token=%@",userid,wbtoken];
            
            ASIHTTPRequest *httpRequest = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:oauthString]];
            [httpRequest startAsynchronous];
            
        } else if (response.statusCode == WeiboSDKResponseStatusCodeAuthDeny)
        {
            NSLog(@"授权失败");
        }
    }
}

@end
