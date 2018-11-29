//
//  UIScrollView+SpringHeader.h
//  SpringHeader
//
//  Created by 惠上科技 on 2018/11/29.
//  Copyright © 2018 惠上科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpringHeaderView.h"
#define kNavHeight [[UIApplication sharedApplication] statusBarFrame].size.height + 44
#define kStatusHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define kWindowWidth [UIScreen mainScreen].bounds.size.width
#define kWindowHeight [UIScreen mainScreen].bounds.size.height
@interface UIScrollView (SpringHeader)
@property (nonatomic, weak) SpringHeaderView *headerView;
@property (nonatomic, weak) UIVisualEffectView *headerEffectView;
@property (nonatomic, weak) UILabel *titleLabel;

-(void)handleSpringHeadView:(SpringHeaderView *)view;

@end
