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

@end
