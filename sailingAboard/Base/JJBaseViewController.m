//
//  JJBaseViewController.m
//  sailingAboard
//
//  Created by XiangMing on 14/12/16.
//  Copyright (c) 2014年 Noodles Wang. All rights reserved.
//

#import "JJBaseViewController.h"
#import "MBProgressHUD.h"

@interface JJBaseViewController ()
{
    MBProgressHUD *_HUD;
}

@end

@implementation JJBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - AlertView Method
- (void)showAlert:(NSString *)msg
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                    message:msg
                                                   delegate:nil
                                          cancelButtonTitle:nil
                                          otherButtonTitles:@"确定",nil];
    [alert show];
}



#pragma mark - MBProgressHUD Method
- (void)showProgressHUD
{
    if (!_HUD) {
        _HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    }
}
- (void)hideProgressHUD
{
    if (_HUD) {
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    }
    _HUD = nil;
}

- (void)showToastMessage:(NSString *)message
{
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithFrame:self.view.bounds];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = message;
    hud.labelFont = [UIFont boldSystemFontOfSize:14];
    [self.view addSubview:hud];
    [hud show:YES];
    [hud hide:YES afterDelay:1.5];
}

- (void)showNetWorkFailToast
{
    [self showToastMessage:@"网络不给力,请稍后重试"];
}


@end
