//
//  UITextField+Category.h
//  YCHelpKit
//
//  Created by yangc on 16-3-31.
//  Copyright (c) 2016年 yangc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Category)

+ (instancetype)textFieldForSearchBarWithFrame:(CGRect)frame icon:(NSString *)icon placeholder:(NSString *)placeholder;

@end
