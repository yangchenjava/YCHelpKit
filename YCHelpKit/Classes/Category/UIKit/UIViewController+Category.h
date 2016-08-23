//
//  UIViewController+Category.h
//  YCHelpKit
//
//  Created by yangc on 16/8/16.
//  Copyright © 2016年 yangc. All rights reserved.
//

#ifdef __IPHONE_9_0
#import <SafariServices/SafariServices.h>
#endif

#import <UIKit/UIKit.h>

#ifdef __IPHONE_9_0
@interface UIViewController (Category) <SFSafariViewControllerDelegate>
#else
@interface UIViewController (Category)
#endif

- (void)presentWebViewControllerWithURL:(NSURL *)URL animated:(BOOL)animated completion:(void (^)())completion;

@end
