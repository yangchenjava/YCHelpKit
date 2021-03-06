//
//  UIView+Category.m
//  YCHelpKit
//
//  Created by yangc on 16-5-13.
//  Copyright (c) 2016年 yangc. All rights reserved.
//

#import "UIView+Category.h"

@implementation UIView (Category)

- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (void)setY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (UIViewController *)viewController {
    UIViewController *viewController;
    UIResponder *responder = self.nextResponder;
    while (responder) {
        if ([responder isKindOfClass:[UIViewController class]]) {
            viewController = (UIViewController *) responder;
            break;
        }
        responder = responder.nextResponder;
    }
    return viewController;
}

+ (instancetype)viewFromNib {
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;
}

- (BOOL)viewIntersectsView:(UIView *)view {
    UIView *window = [UIApplication sharedApplication].keyWindow;
    CGRect rect1 = [self convertRect:self.bounds toView:window];
    CGRect rect2 = [view convertRect:view.bounds toView:window];
    return CGRectIntersectsRect(rect1, rect2);
}

@end
