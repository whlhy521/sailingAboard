//
//  JJLoginViewController.m
//  sailingAboard
//
//  Created by NoodlesWang_PC on 11/7/14.
//  Copyright (c) 2014 Noodles Wang. All rights reserved.
//

#import "JJLoginViewController.h"

@interface JJLoginViewController ()

@end

@implementation JJLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)login:(id)sender
{
    WBAuthorizeRequest *request = [WBAuthorizeRequest request];
    request.redirectURI = kRedirectURI;
    request.scope = @"all";
    [WeiboSDK sendRequest:request];
    
//    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
