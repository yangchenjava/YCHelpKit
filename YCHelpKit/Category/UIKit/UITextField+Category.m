//
//  UITextField+Category.m
//  YCHelpKit
//
//  Created by yangc on 16-3-31.
//  Copyright (c) 2016年 yangc. All rights reserved.
//

#import "UIImage+Category.h"
#import "UITextField+Category.h"

static NSString * const KeyPath_PlaceholderColor = @"placeholderLabel.textColor";

@implementation UITextField (Category)

+ (instancetype)textFieldForSearchBarWithFrame:(CGRect)frame placeholder:(NSString *)placeholder background:(NSString *)background icon:(NSString *)icon {
    UITextField *searchBar = [[self alloc] initWithFrame:frame];
    searchBar.font = [UIFont systemFontOfSize:15];
    searchBar.placeholder = placeholder;
    searchBar.background = [UIImage imageNamedForResize:background];
    searchBar.clearButtonMode = UITextFieldViewModeWhileEditing;
    searchBar.enablesReturnKeyAutomatically = YES;
    searchBar.returnKeyType = UIReturnKeySearch;
    UIImageView *leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:icon]];
    leftView.frame = CGRectMake(0, 0, frame.size.height + 10, frame.size.height - 10);
    leftView.contentMode = UIViewContentModeScaleAspectFit;
    searchBar.leftView = leftView;
    searchBar.leftViewMode = UITextFieldViewModeAlways;
    return searchBar;
}

- (UIColor *)placeholderColor {
    return [self valueForKeyPath:KeyPath_PlaceholderColor];
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    // 防止没有设置placeholder，导致placeholderLabel为空
    if (!self.placeholder.length) {
        self.placeholder = @" ";
        self.placeholder = nil;
    }
    if (placeholderColor == nil) {
        // 默认颜色
        placeholderColor = [UIColor colorWithRed:0 / 255.0 green:0 / 255.0 blue:0.0980392 / 255.0 alpha:0.22];
    }
    [self setValue:placeholderColor forKeyPath:KeyPath_PlaceholderColor];
}

@end
