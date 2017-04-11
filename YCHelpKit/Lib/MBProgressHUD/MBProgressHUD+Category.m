//
//  MBProgressHUD+Category.m
//  YCHelpKit
//
//  Created by yangc on 16-2-6.
//  Copyright (c) 2016年 yangc. All rights reserved.
//

#import "MBProgressHUD+Category.h"
#import "YCHttpUtils.h"

@implementation MBProgressHUD (Category)

#pragma mark - 显示成功
+ (void)showSuccess:(NSString *)success {
    [self showSuccess:success toView:nil];
}
+ (void)showSuccess:(NSString *)success toView:(UIView *)view {
    [self showSuccessOrError:@"MBProgressHUD.bundle/success.png" message:success toView:view];
}

#pragma mark - 显示失败
+ (void)showError:(NSString *)error {
    [self showError:error toView:nil];
}
+ (void)showError:(NSString *)error toView:(UIView *)view {
    [self showSuccessOrError:@"MBProgressHUD.bundle/error.png" message:error toView:view];
}

#pragma mark - 显示成功或失败
+ (void)showSuccessOrError:(NSString *)icon message:(NSString *)message toView:(UIView *)view {
    if (view == nil) {
        view = [UIApplication sharedApplication].keyWindow;
    }
    MBProgressHUD *hud = [self showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    hud.removeFromSuperViewOnHide = YES;
    hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.backgroundView.color = [UIColor colorWithWhite:0.f alpha:.2f];
    UIImage *image = [UIImage imageNamed:icon inBundle:[NSBundle bundleForClass:[YCHttpUtils class]] compatibleWithTraitCollection:nil];
    hud.customView = [[UIImageView alloc] initWithImage:image];
    hud.label.text = message;
    [hud hideAnimated:YES afterDelay:1];
}

#pragma mark - 显示消息，带返回值
+ (MBProgressHUD *)showMessage:(NSString *)message mask:(BOOL)mask {
    return [self showMessage:message mask:mask toView:nil];
}
+ (MBProgressHUD *)showMessage:(NSString *)message mask:(BOOL)mask toView:(UIView *)view {
    if (view == nil) {
        view = [UIApplication sharedApplication].keyWindow;
    }
    MBProgressHUD *hud = [self showHUDAddedTo:view animated:YES];
    hud.removeFromSuperViewOnHide = YES;
    hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.label.text = message;
    if (mask) {
        hud.backgroundView.color = [UIColor colorWithWhite:0.f alpha:.2f];
        hud.userInteractionEnabled = YES;
    } else {
        hud.backgroundView.color = [UIColor clearColor];
        hud.userInteractionEnabled = NO;
    }
    return hud;
}

#pragma mark - 隐藏(移除)
+ (void)hideHUD {
    [self hideHUDForView:nil];
}
+ (void)hideHUDForView:(UIView *)view {
    if (view == nil) {
        view = [UIApplication sharedApplication].keyWindow;
    }
    [MBProgressHUD hideHUDForView:view animated:YES];
}

@end
