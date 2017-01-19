//
//  UITextField+Category.h
//  YCHelpKit
//
//  Created by yangc on 16-3-31.
//  Copyright (c) 2016年 yangc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Category)

@property (nonatomic, strong) UIColor *placeholderColor;

+ (instancetype)textFieldForSearchBarWithFrame:(CGRect)frame placeholder:(NSString *)placeholder background:(NSString *)background icon:(NSString *)icon;

@end
