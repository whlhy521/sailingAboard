//
//  JJPersonalCenterViewController.m
//  sailingAboard
//
//  Created by NoodlesWang_PC on 11/6/14.
//  Copyright (c) 2014 Noodles Wang. All rights reserved.
//

#import "JJPersonalCenterViewController.h"
#import "JJJobTableViewCell.h"
#import "JJDetailContentViewController.h"

@interface JJPersonalCenterViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation JJPersonalCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = NO;
    //    self.navigationController.navigationBar.tintColor = [UIColor grayColor];
    self.navigationItem.title = @"个人中心";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"arrow.png"] style:UIBarButtonItemStylePlain target:self action:@selector(back:)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"arrow.png"]];

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JJJobTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"JJJobTableViewCell" owner:self options:nil] objectAtIndex:0];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%d", indexPath.row);
    JJDetailContentViewController *detailContentViewController = [[JJDetailContentViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:detailContentViewController animated:YES];
}

@end
