//
//  JJViewController.h
//  sailingAboard
//
//  Created by NoodlesWang_PC on 10/24/14.
//  Copyright (c) 2014 Noodles Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JJViewController : UIViewController<UISearchBarDelegate, UISearchDisplayDelegate, UITableViewDataSource, UITableViewDelegate>
{
    BOOL _shixiDown;
}
@property (nonatomic, retain) IBOutlet UIButton *searchBtn;
@property (nonatomic, retain) IBOutlet UIButton *quanzhi;
@property (nonatomic, retain) IBOutlet UIButton *jianzhi;
@property (nonatomic, strong) IBOutlet UIButton *avatar;
@property (nonatomic, strong) IBOutlet UIImageView *anchor;

@property (nonatomic, strong) IBOutlet UITableView *quanzhiTableView;
@property (nonatomic, strong) IBOutlet UITableView *jianzhiTableView;
- (IBAction)personalCneter:(id)sender;

- (IBAction)quanzhiDown:(id)sender;
- (IBAction)shixiDown:(id)sender;
@end
