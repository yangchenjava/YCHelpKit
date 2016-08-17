//
//  NSString+Category.h
//  YCHelpKit
//
//  Created by yangc on 16-1-28.
//  Copyright (c) 2016年 yangc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Category)

- (CGSize)sizeWithFont:(UIFont *)font size:(CGSize)maxSize;

- (NSString *)md5String;

@end
