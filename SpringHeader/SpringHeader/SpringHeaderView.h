//
//  SpringHeaderView.h
//  SpringHeader
//
//  Created by 惠上科技 on 2018/11/29.
//  Copyright © 2018 惠上科技. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^LeftClickBlock)(UIButton *btn);
typedef void(^RightClickBlock)(UIButton *btn);

@interface SpringHeaderView : UIView

/**
 头部的图片
 */
@property (nonatomic, strong) UIImage *headerImage;

/**
 头部的标题
 */
@property (nonatomic, copy) NSString *title;

/**
 是否显示返回按钮
 */
@property (nonatomic, assign) BOOL isShowLeftButton;

/**
 是否显示更多按钮
 */
@property (nonatomic, assign) BOOL isShowRightButton;

/**
 点击返回按钮的回调
 */
@property (nonatomic, copy) LeftClickBlock leftClickBlock;

/**
 点击更多按钮的回调
 */
@property (nonatomic, copy) RightClickBlock rightClickBlock;

@end
