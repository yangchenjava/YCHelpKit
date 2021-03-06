//
//  YCHttpUtils.h
//  YCHelpKit
//
//  Created by yangc on 16-4-25.
//  Copyright (c) 2016年 yangc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YCHttpUtils : NSObject

/**
 *  取消HTTP请求
 */
+ (void)cancelHttpRequest;

/**
 *  GET请求
 */
+ (void)sendGet:(NSString *)URLString
         params:(NSDictionary *)params
        success:(void (^)(NSHTTPURLResponse *response, id responseObject))success
        failure:(void (^)(NSHTTPURLResponse *response, NSError *error))failure;

+ (void)sendGet:(NSString *)URLString
        headers:(NSDictionary *)headers
         params:(NSDictionary *)params
        success:(void (^)(NSHTTPURLResponse *response, id responseObject))success
        failure:(void (^)(NSHTTPURLResponse *response, NSError *error))failure;

/**
 *  POST请求
 */
+ (void)sendPost:(NSString *)URLString
          params:(NSDictionary *)params
         success:(void (^)(NSHTTPURLResponse *response, id responseObject))success
         failure:(void (^)(NSHTTPURLResponse *response, NSError *error))failure;

+ (void)sendPost:(NSString *)URLString
         headers:(NSDictionary *)headers
          params:(NSDictionary *)params
         success:(void (^)(NSHTTPURLResponse *response, id responseObject))success
         failure:(void (^)(NSHTTPURLResponse *response, NSError *error))failure;

/**
 *  文件上传
 */
+ (void)sendPost:(NSString *)URLString
          params:(NSDictionary *)params
 attachmentArray:(NSArray *)attachmentArray
         success:(void (^)(NSHTTPURLResponse *response, id responseObject))success
         failure:(void (^)(NSHTTPURLResponse *response, NSError *error))failure;

+ (void)sendPost:(NSString *)URLString
         headers:(NSDictionary *)headers
          params:(NSDictionary *)params
 attachmentArray:(NSArray *)attachmentArray
         success:(void (^)(NSHTTPURLResponse *response, id responseObject))success
         failure:(void (^)(NSHTTPURLResponse *response, NSError *error))failure;

/**
 *  文件下载
 */
+ (void)download:(NSString *)URLString
             progress:(void (^)(NSProgress *downProgress))progress
          destination:(NSURL * (^)(NSURL *targetPath, NSHTTPURLResponse *response))destination
    completionHandler:(void (^)(NSHTTPURLResponse *response, NSURL *filePath, NSError *error))completionHandler;

+ (void)download:(NSString *)URLString
              headers:(NSDictionary *)headers
             progress:(void (^)(NSProgress *downProgress))progress
          destination:(NSURL * (^)(NSURL *targetPath, NSHTTPURLResponse *response))destination
    completionHandler:(void (^)(NSHTTPURLResponse *response, NSURL *filePath, NSError *error))completionHandler;

/**
 *  @author yangc, 16-08-26 14:08:59
 *
 *  清除webview的cookie和cache
 */
+ (void)clearWebViewCookieAndCache;
+ (void)clearWebViewCookie;
+ (void)clearWebViewCache;

@end

@interface YCAttachment : NSObject

@property (nonatomic, strong) NSData *data;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *fileName;
@property (nonatomic, copy) NSString *mimeType;

@end
