//
//  JJViewController.m
//  sailingAboard
//
//  Created by NoodlesWang_PC on 10/24/14.
//  Copyright (c) 2014 Noodles Wang. All rights reserved.
//

#import "JJViewController.h"
#import "JJJobTableViewCell.h"
#import "JJDetailContentViewController.h"
#import "JJPersonalCenterViewController.h"
@interface JJViewController ()

@end

@implementation JJViewController
{
    UISearchBar *searchBar;
    UISearchDisplayController *searchController;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    _avatar.layer.masksToBounds = YES; 
    _avatar.layer.cornerRadius = 30.0f;
    _avatar.layer.borderColor = ([UIColor whiteColor]).CGColor;
    _avatar.layer.borderWidth = 2.0f;
    
    _shixiDown = YES;
    
    _quanzhiTableView.hidden = YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)searchBtn:(id)searchBarButton
{
    
    searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0.0f, 20.0f, 320.0f, 44.0f)];
    searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
    searchBar.autocapitalizationType = UITextAutocapitalizationTypeNone;
    searchBar.keyboardType = UIKeyboardTypeAlphabet;
    [self.view addSubview:searchBar];
    
    searchController = [[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];
    searchController.searchResultsDataSource = self;
    searchController.searchResultsDelegate = self;
     
    [searchBar becomeFirstResponder];
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

- (IBAction)personalCneter:(id)sender
{
    JJPersonalCenterViewController *personalCenterViewController = [[JJPersonalCenterViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:personalCenterViewController animated:YES];
}

- (IBAction)quanzhiDown:(id)sender
{
    if (!_shixiDown) {
        return;
    }
    _shixiDown = NO;
    [UIView animateWithDuration:0.2f animations:^{
        CGRect frame = CGRectMake(224, 96, CGRectGetWidth(_anchor.frame), CGRectGetHeight(_anchor.frame));
        _anchor.frame = frame;
    }];
}

- (IBAction)shixiDown:(id)sender
{
    if (_shixiDown) {
        return;
    }
    _shixiDown = YES;
    [UIView animateWithDuration:0.2f animations:^{
        CGRect frame = CGRectMake(102, 96, CGRectGetWidth(_anchor.frame), CGRectGetHeight(_anchor.frame));
        _anchor.frame = frame;
    }];
}
@end
