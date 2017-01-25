//
//  NSString+Category.m
//  YCHelpKit
//
//  Created by yangc on 16-1-28.
//  Copyright (c) 2016年 yangc. All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>

#import "NSString+Category.h"

@implementation NSString (Category)

- (CGSize)sizeWithFont:(UIFont *)font size:(CGSize)maxSize {
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (NSString *)md5String {
    const char *data = [self UTF8String];
    unsigned char md[CC_MD5_DIGEST_LENGTH];
    CC_MD5(data, (int) strlen(data), md);

    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", md[i]];
    }
    return output.copy;
}

- (unsigned long long)fileSize {
    NSFileManager *fm = [NSFileManager defaultManager];
    NSDictionary *attributes = [fm attributesOfItemAtPath:self error:NULL];
    unsigned long long size = 0;
    if ([attributes.fileType isEqualToString:NSFileTypeDirectory]) {
        NSArray *subpaths = [fm subpathsAtPath:self];
        for (NSString *subpath in subpaths) {
            size += [fm attributesOfItemAtPath:[self stringByAppendingPathComponent:subpath] error:NULL].fileSize;
        }
    } else {
        size = attributes.fileSize;
    }
    return size;
}

static double const _KB = 1000.0;
static double const _MB = 1000.0 * 1000.0;
static double const _GB = 1000.0 * 1000.0 * 1000.0;
static double const _TB = 1000.0 * 1000.0 * 1000.0 * 1000.0;

+ (NSString *)fileSizeUnit:(unsigned long long)fileSize {
    if (fileSize < _KB) {
        return [NSString stringWithFormat:@"%lldB", fileSize];
    } else if (fileSize < _MB) {
        return [NSString stringWithFormat:@"%.1fK", fileSize / _KB];
    } else if (fileSize < _GB) {
        return [NSString stringWithFormat:@"%.1fM", fileSize / _MB];
    } else if (fileSize < _TB) {
        return [NSString stringWithFormat:@"%.1fG", fileSize / _GB];
    } else {
        return [NSString stringWithFormat:@"%.1fT", fileSize / _TB];
    }
}

@end
