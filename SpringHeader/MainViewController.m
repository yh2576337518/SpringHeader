//
//  MainViewController.m
//  SpringHeader
//
//  Created by 惠上科技 on 2018/11/29.
//  Copyright © 2018 惠上科技. All rights reserved.
//

#import "MainViewController.h"
#import "ViewController.h"
@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIButton *userTapButton;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"哈哈哈";
    self.userTapButton.layer.cornerRadius = 50;
    self.userTapButton.layer.masksToBounds = YES;
}


- (IBAction)userTapClick:(UIButton *)sender {
    ViewController *VC = [[ViewController alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
}

@end
