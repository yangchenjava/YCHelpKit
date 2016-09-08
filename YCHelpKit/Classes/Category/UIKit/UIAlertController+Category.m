//
//  UIAlertController+Category.m
//  YCHelpKit
//
//  Created by yangc on 16/8/30.
//  Copyright © 2016年 yangc. All rights reserved.
//

#import "UIAlertController+Category.h"

@implementation UIAlertController (Category)

+ (instancetype)alertControllerWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle alertActions:(NSArray<UIAlertAction *> *)alertActions {
    UIAlertController *alertController = [self alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    if (alertActions.count) {
        for (UIAlertAction *alertAction in alertActions) {
            [alertController addAction:alertAction];
        }
    }
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    return alertController;
}

@end
