//
//  JJUnivercityListViewController.m
//  sailingAboard
//
//  Created by NoodlesWang_PC on 11/10/14.
//  Copyright (c) 2014 Noodles Wang. All rights reserved.
//

#import "JJUnivercityListViewController.h"

@interface JJUnivercityListViewController ()

@end

@implementation JJUnivercityListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
