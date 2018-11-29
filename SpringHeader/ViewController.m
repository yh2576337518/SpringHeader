//
//  ViewController.m
//  SpringHeader
//
//  Created by 惠上科技 on 2018/11/29.
//  Copyright © 2018 惠上科技. All rights reserved.
//

#import "ViewController.h"
#import "UIScrollView+SpringHeader.h"
#import "SpringHeaderView.h"
#import <WebKit/WebKit.h>
@interface ViewController ()
@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) SpringHeaderView *headerView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, kWindowWidth, kWindowHeight)];
    self.webView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.webView];
    
    NSURL *url = [NSURL URLWithString:@"https://yongliangp.github.io/"];
    NSMutableURLRequest *re = [NSMutableURLRequest requestWithURL:url];
    [self.webView loadRequest:re];
    
    //初始化
    self.headerView.headerImage = [UIImage imageNamed:@"saber"];
    self.headerView.title = @"四周年快乐";
    self.headerView.isShowLeftButton = YES;
    self.headerView.isShowRightButton = YES;
    __weak typeof (self) weakSelf = self;
    self.headerView.leftClickBlock = ^(UIButton *btn) {
        [weakSelf.navigationController popViewControllerAnimated:YES];
    };
    self.headerView.rightClickBlock = ^(UIButton *btn) {
        UIViewController *view = [[UIViewController alloc] init];
        view.view.backgroundColor = [UIColor whiteColor];
        [weakSelf.navigationController pushViewController:view animated:YES];
    };
    [self.webView.scrollView handleSpringHeadView:self.headerView];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


-(void)dealloc{
    [self.webView.scrollView removeObserver:self.webView.scrollView forKeyPath:@"contentOffset"];
}


#pragma mark -------Getter
-(SpringHeaderView *)headerView{
    if (!_headerView) {
        _headerView = [[SpringHeaderView alloc] initWithFrame:CGRectMake(0, 0, kWindowWidth, kWindowWidth/2.0)];
        [self.view addSubview:_headerView];
    }
    return _headerView;
}

@end
