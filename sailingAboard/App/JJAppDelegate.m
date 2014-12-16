//
//  JJAppDelegate.m
//  sailingAboard
//
//  Created by NoodlesWang_PC on 10/24/14.
//  Copyright (c) 2014 Noodles Wang. All rights reserved.
//

#import "JJAppDelegate.h"
#import "JJLoginViewController.h"
#import "JJViewController.h"
#import "WBHttpRequest.h"
#import "JJNetManager.h"

@implementation JJAppDelegate

@synthesize wbtoken;
@synthesize wbCurrentUserID;
@synthesize wbUser;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //sina login
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    [WeiboSDK enableDebugMode:YES];
    [WeiboSDK registerApp:kAppKey];
    //检测是否已经授权，是则加载job界面，否则加载登陆界面
    BOOL isNeedLogin = [self isNeedLoginWithSinaWeibo];
    if(isNeedLogin){
        [self showLoginView];
    }
    else{
        [self showJobsView];
    }
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{

}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{

}

- (void)applicationWillTerminate:(UIApplication *)application
{

}

- (BOOL)isNeedLoginWithSinaWeibo{
    BOOL need = YES;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *sinaweiboInfo = [defaults objectForKey:@"SinaWeiboAuthData"];
    if ([sinaweiboInfo objectForKey:@"AccessTokenKey"] && [sinaweiboInfo objectForKey:@"ExpirationDateKey"] &&
        [sinaweiboInfo objectForKey:@"UserIDKey"] && [sinaweiboInfo objectForKey:@"refresh_token"]) {
        wbtoken = [sinaweiboInfo objectForKey:@"AccessTokenKey"];
        wbCurrentUserID = [sinaweiboInfo objectForKey:@"UserIDKey"];
        NSDate *expirationDate = [sinaweiboInfo objectForKey:@"ExpirationDateKey"];
        NSDate *nowDate = [NSDate date];
        NSTimeInterval expirationInterval = [expirationDate timeIntervalSinceDate:nowDate];
        if(expirationInterval>0){
            need = NO;
        }
    }
    return need;
}


//展示登陆界面
- (void)showLoginView
{
    JJLoginViewController *loginViewController = [[JJLoginViewController alloc] initWithNibName:nil bundle:nil];
    self.window.rootViewController = loginViewController;
}

//展示jobs界面
- (void)showJobsView{
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *jvcNac = [mainStoryboard instantiateInitialViewController];
    self.window.rootViewController = jvcNac;
}


- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return [WeiboSDK handleOpenURL:url delegate:self];
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return [WeiboSDK handleOpenURL:url delegate:self ];
}


//获取当前登录用户的微博信息
- (void)requestForUserProfile
{
   __weak JJBaseViewController *baseVC = (JJBaseViewController *)self.window.rootViewController;
    [baseVC showProgressHUD];
    [WBHttpRequest requestForUserProfile:wbCurrentUserID withAccessToken:wbtoken andOtherProperties:nil queue:nil withCompletionHandler:^(WBHttpRequest *httpRequest, id result, NSError *error) {
        [baseVC showProgressHUD];
        if(error){
            [baseVC showToastMessage:error.description];
        }
        else{
            self.wbUser = result;
            
            [self showJobsView];
        }
    }];
}


//执行登陆网络请求
- (void)requestLogin{
    
}



#pragma mark - weibo delegate

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
            wbCurrentUserID = userid;
            wbtoken = [(WBAuthorizeResponse *)response accessToken];
            NSString *refreshToken = [(WBAuthorizeResponse *)response refreshToken];
            NSDate *expirationDate = [(WBAuthorizeResponse *)response expirationDate];
            
            NSDictionary *authData = [NSDictionary dictionaryWithObjectsAndKeys:
                                      wbtoken, @"AccessTokenKey",
                                      expirationDate, @"ExpirationDateKey",
                                      wbCurrentUserID, @"UserIDKey",
                                      refreshToken, @"refresh_token", nil];
            
            [[NSUserDefaults standardUserDefaults] setObject:authData forKey:@"SinaWeiboAuthData"];
            [[NSUserDefaults standardUserDefaults] synchronize];
         

//授权后获取当前用户信息
//            NSString *oauthString = [NSString stringWithFormat:@"https://api.weibo.com/2/users/show.json?uid=%@&access_token=%@",userid,wbtoken];
//            
//            ASIHTTPRequest *httpRequest = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:oauthString]];
//            [httpRequest startAsynchronous];
            [self requestForUserProfile];
            
        }
        else if (response.statusCode == WeiboSDKResponseStatusCodeAuthDeny)
        {
            NSLog(@"授权失败");
        }
    }
}

@end
