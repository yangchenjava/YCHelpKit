//
//  UIView+Category.h
//  YCHelpKit
//
//  Created by yangc on 16-5-13.
//  Copyright (c) 2016年 yangc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Category)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize size;

/**
 *  @author yangc, 16-08-26 14:08:55
 *
 *  获取当前View所在的ViewController
 */
@property (nonatomic, strong, readonly) UIViewController *viewController;

/**
 *  @author yangc, 16-08-26 14:08:55
 *
 *  加载名称为当前类名的xib文件
 */
+ (instancetype)viewFromNib;


/**
 *  @author yangc, 16-08-26 14:08:55
 *
 *  判断是否与指定的view有视觉上的交叉或者重合
 */
- (BOOL)viewIntersectsView:(UIView *)view;

@end
