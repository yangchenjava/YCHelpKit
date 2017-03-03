//
//  UIImageView+SDWebImageCategory.h
//  YCHelpKit
//
//  Created by yangc on 16-4-19.
//  Copyright (c) 2016年 yangc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/SDWebImageManager.h>

@interface UIImageView (SDWebImageCategory)

- (void)sd_setImageCircleWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder;

- (void)sd_setImageCircleWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completed:(SDExternalCompletionBlock)completedBlock;

- (void)sd_setImageRoundRectWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder radius:(CGFloat)radius;

- (void)sd_setImageRoundRectWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder radius:(CGFloat)radius completed:(SDExternalCompletionBlock)completedBlock;

@end
