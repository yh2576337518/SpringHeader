//
//  UIScrollView+SpringHeader.m
//  SpringHeader
//
//  Created by 惠上科技 on 2018/11/29.
//  Copyright © 2018 惠上科技. All rights reserved.
//

#import "UIScrollView+SpringHeader.h"
#import <objc/runtime.h>

@implementation UIScrollView (SpringHeader)
static char YHHeaderView;
static char YHHeaderEffectView;
static char YHTitleLabel;

-(void)setHeaderView:(SpringHeaderView *)headerView{
    objc_setAssociatedObject(self, &YHHeaderView, headerView, OBJC_ASSOCIATION_ASSIGN);
}

- (SpringHeaderView *)headerView{
    return objc_getAssociatedObject(self, &YHHeaderView);
}

-(void)setHeaderEffectView:(UIVisualEffectView *)headerEffectView{
    objc_setAssociatedObject(self, &YHHeaderEffectView, headerEffectView, OBJC_ASSOCIATION_ASSIGN);
}

-(UIVisualEffectView *)headerEffectView{
    return objc_getAssociatedObject(self, &YHHeaderEffectView);
}

-(void)setTitleLabel:(UILabel *)titleLabel{
    objc_setAssociatedObject(self, &YHTitleLabel, titleLabel, OBJC_ASSOCIATION_ASSIGN);
}

-(UILabel *)titleLabel{
    return objc_getAssociatedObject(self, &YHTitleLabel);
}



-(void)handleSpringHeadView:(SpringHeaderView *)view{
    self.contentInset = UIEdgeInsetsMake(view.bounds.size.height, 0, 0, 0);
    view.frame = CGRectMake(0, -view.bounds.size.height, view.bounds.size.width, view.bounds.size.height);
    self.headerView = view;
    [view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[UIVisualEffectView class]]) {
            self.headerEffectView = obj;
        }
        if ([obj isKindOfClass:[UILabel class]]) {
            self.titleLabel = obj;
        }
    }];
    
    //使用kvo监听scrollerView的滚动
    [self addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    [self yl_scrollViewDidScroll:self];
}


-(void)yl_scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY >= -kNavHeight) {
        offsetY = -kNavHeight;
        if (self.headerView.frame.size.height != kNavHeight) {
            self.headerView.frame = CGRectMake(0, 0, self.headerView.bounds.size.width, kNavHeight);
            [UIView animateWithDuration:0.25 animations:^{
                self.titleLabel.frame = CGRectMake(35, kStatusHeight, self.bounds.size.width - 35*2, 44);
                self.titleLabel.alpha = 1;
            }];
        }
    }else{
        self.headerView.frame = CGRectMake(0, 0, self.headerView.bounds.size.width, -offsetY);
        if (self.titleLabel.alpha != 0) {
            [UIView animateWithDuration:0.25 animations:^{
                self.titleLabel.frame = CGRectMake(35, kStatusHeight + 20, self.bounds.size.width - 35 *2, 44);
                self.titleLabel.alpha = 0;
            }];
        }
    }
    CGFloat alpha;
    if (self.headerView.frame.size.height >= kWindowWidth/2) {
        alpha = 0;
    }else{
        alpha = 1 - ((self.headerView.frame.size.height - kNavHeight)/(kWindowWidth / 2 - kNavHeight));
    }
    if (alpha >= 0 && alpha <= 1) {
        self.headerEffectView.alpha = alpha;
    }
}
@end
