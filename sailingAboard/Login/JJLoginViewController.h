//
//  JJLoginViewController.h
//  sailingAboard
//
//  Created by NoodlesWang_PC on 11/7/14.
//  Copyright (c) 2014 Noodles Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeiboSDK.h"

#define kAppKey         @"2032427802"
#define kRedirectURI    @"https://api.weibo.com/oauth2/default.html"

@interface JJLoginViewController : UIViewController
- (IBAction)login:(id)sender;

@end
