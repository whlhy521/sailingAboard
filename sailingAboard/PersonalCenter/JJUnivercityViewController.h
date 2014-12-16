//
//  JJUnivercityViewController.h
//  sailingAboard
//
//  Created by NoodlesWang_PC on 11/7/14.
//  Copyright (c) 2014 Noodles Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JJUnivercityViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *zhuanke;
@property (strong, nonatomic) IBOutlet UIButton *benke;
@property (strong, nonatomic) IBOutlet UIButton *shuoshi;
@property (strong, nonatomic) IBOutlet UIButton *boshi;

- (IBAction)btnDown:(id)sender;
@end
