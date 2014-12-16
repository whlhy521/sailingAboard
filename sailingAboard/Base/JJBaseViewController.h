//
//  JJBaseViewController.h
//  sailingAboard
//
//  Created by XiangMing on 14/12/16.
//  Copyright (c) 2014年 Noodles Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JJBaseViewController : UIViewController

- (void)showAlert:(NSString *)msg;

- (void)showProgressHUD;

- (void)hideProgressHUD;

- (void)showToastMessage:(NSString *)message;

- (void)showNetWorkFailToast;

@end
