//
//  JJCityListViewController.m
//  sailingAboard
//
//  Created by NoodlesWang_PC on 11/10/14.
//  Copyright (c) 2014 Noodles Wang. All rights reserved.
//

#import "JJCityListViewController.h"

@interface JJCityListViewController ()

@end

@implementation JJCityListViewController

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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 26;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"JJUnivercityTableViewCell" owner:self options:nil] objectAtIndex:0];
    }
    return cell;
}


@end
