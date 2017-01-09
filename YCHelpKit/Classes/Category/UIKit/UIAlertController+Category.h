//
//  UIAlertController+Category.h
//  YCHelpKit
//
//  Created by yangc on 16/8/30.
//  Copyright © 2016年 yangc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (Category)

+ (instancetype)alertControllerWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle alertActions:(NSArray<UIAlertAction *> *)alertActions;

@end
