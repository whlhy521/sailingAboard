//
//  JJDetailContentViewController.m
//  sailingAboard
//
//  Created by NoodlesWang_PC on 11/5/14.
//  Copyright (c) 2014 Noodles Wang. All rights reserved.
//

#import "JJDetailContentViewController.h"

@interface JJDetailContentViewController ()

@end

@implementation JJDetailContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBar.hidden = NO;
//    self.navigationController.navigationBar.tintColor = [UIColor grayColor];
    self.navigationItem.title = @"工作详情";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"arrow.png"] style:UIBarButtonItemStylePlain target:self action:@selector(back:)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"arrow.png"]];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"heart-big.png"] style:UIBarButtonItemStylePlain target:self action:@selector(like:)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"heart-big.png"]];
    //处理导航条遮挡
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0)) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)openSafari:(id)sender
{
    NSLog(@"open safari");
}

- (void)back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)like:(id)sender
{
    NSLog(@"like it");
}
@end
