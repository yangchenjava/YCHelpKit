//
//  YCHttpUtils.m
//  YCHelpKit
//
//  Created by yangc on 16-4-25.
//  Copyright (c) 2016年 yangc. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

#import "YCHttpUtils.h"

@implementation YCHttpUtils

+ (AFHTTPSessionManager *)manager {
    static AFHTTPSessionManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
    });
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    manager.requestSerializer.timeoutInterval = 10;
    [manager.requestSerializer setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/plain"];
    
    for (NSString *key in manager.requestSerializer.HTTPRequestHeaders.allKeys) {
        [manager.requestSerializer setValue:nil forHTTPHeaderField:key];
    }
    
    return manager;
}

+ (void)cancelHttpRequest {
    AFHTTPSessionManager *manager = [self manager];
    [manager.tasks makeObjectsPerformSelector:@selector(cancel)];
}

+ (void)sendGet:(NSString *)URLString params:(NSDictionary *)params success:(void (^)(NSHTTPURLResponse *, id))success failure:(void (^)(NSHTTPURLResponse *, NSError *))failure {
    [self sendGet:URLString headers:nil params:params success:success failure:failure];
}

+ (void)sendGet:(NSString *)URLString
        headers:(NSDictionary *)headers
         params:(NSDictionary *)params
        success:(void (^)(NSHTTPURLResponse *, id))success
        failure:(void (^)(NSHTTPURLResponse *, NSError *))failure {
    AFHTTPSessionManager *manager = [self manager];
    if (headers.count) {
        [headers enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *obj, BOOL *stop) {
            [manager.requestSerializer setValue:obj forHTTPHeaderField:key];
        }];
    }
    [manager GET:[URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]
        parameters:params
        progress:nil
        success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
            if (success) {
                success((NSHTTPURLResponse *) task.response, responseObject);
            }
        }
        failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
            if (failure) {
                failure((NSHTTPURLResponse *) task.response, error);
            }
        }];
}

+ (void)sendPost:(NSString *)URLString params:(NSDictionary *)params success:(void (^)(NSHTTPURLResponse *, id))success failure:(void (^)(NSHTTPURLResponse *, NSError *))failure {
    [self sendPost:URLString headers:nil params:params success:success failure:failure];
}

+ (void)sendPost:(NSString *)URLString
         headers:(NSDictionary *)headers
          params:(NSDictionary *)params
         success:(void (^)(NSHTTPURLResponse *, id))success
         failure:(void (^)(NSHTTPURLResponse *, NSError *))failure {
    AFHTTPSessionManager *manager = [self manager];
    if (headers.count) {
        [headers enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *obj, BOOL *stop) {
            [manager.requestSerializer setValue:obj forHTTPHeaderField:key];
        }];
    }
    [manager POST:[URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]
        parameters:params
        progress:nil
        success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
            if (success) {
                success((NSHTTPURLResponse *) task.response, responseObject);
            }
        }
        failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
            if (failure) {
                failure((NSHTTPURLResponse *) task.response, error);
            }
        }];
}

+ (void)sendPost:(NSString *)URLString
          params:(NSDictionary *)params
 attachmentArray:(NSArray *)attachmentArray
         success:(void (^)(NSHTTPURLResponse *, id))success
         failure:(void (^)(NSHTTPURLResponse *, NSError *))failure {
    [self sendPost:URLString headers:nil params:params attachmentArray:attachmentArray success:success failure:failure];
}

+ (void)sendPost:(NSString *)URLString
         headers:(NSDictionary *)headers
          params:(NSDictionary *)params
 attachmentArray:(NSArray *)attachmentArray
         success:(void (^)(NSHTTPURLResponse *, id))success
         failure:(void (^)(NSHTTPURLResponse *, NSError *))failure {
    AFHTTPSessionManager *manager = [self manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    if (headers.count) {
        [headers enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *obj, BOOL *stop) {
            [manager.requestSerializer setValue:obj forHTTPHeaderField:key];
        }];
    }
    [manager POST:[URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]
        parameters:params
        constructingBodyWithBlock:^(id<AFMultipartFormData> _Nonnull formData) {
            for (YCAttachment *attachment in attachmentArray) {
                [formData appendPartWithFileData:attachment.data name:attachment.name fileName:attachment.fileName mimeType:attachment.mimeType];
            }
        }
        progress:nil
        success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
            if (success) {
                success((NSHTTPURLResponse *) task.response, responseObject);
            }
        }
        failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
            if (failure) {
                failure((NSHTTPURLResponse *) task.response, error);
            }
        }];
}

+ (void)download:(NSString *)URLString
             progress:(void (^)(NSProgress *))progress
          destination:(NSURL * (^)(NSURL *, NSHTTPURLResponse *))destination
    completionHandler:(void (^)(NSHTTPURLResponse *, NSURL *, NSError *))completionHandler {
    [self download:URLString headers:nil progress:progress destination:destination completionHandler:completionHandler];
}

+ (void)download:(NSString *)URLString
              headers:(NSDictionary *)headers
             progress:(void (^)(NSProgress *downProgress))progress
          destination:(NSURL * (^)(NSURL *targetPath, NSHTTPURLResponse *response))destination
    completionHandler:(void (^)(NSHTTPURLResponse *response, NSURL *filePath, NSError *error))completionHandler {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

    URLString = [URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URLString]];
    if (headers.count) {
        [headers enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *obj, BOOL *stop) {
            [request setValue:obj forHTTPHeaderField:key];
        }];
    }

    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request
        progress:^(NSProgress *downloadProgress) {
            if (progress) {
                progress(downloadProgress);
            }
        }
        destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
            return destination(targetPath, (NSHTTPURLResponse *) response);
        }
        completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
            completionHandler((NSHTTPURLResponse *) response, filePath, error);
        }];
    [downloadTask resume];
}

+ (void)clearWebViewCookieAndCache {
    [self clearWebViewCookie];
    [self clearWebViewCache];
}

+ (void)clearWebViewCookie {
    NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (NSHTTPCookie *cookie in storage.cookies) {
        [storage deleteCookie:cookie];
    }
}

+ (void)clearWebViewCache {
    NSURLCache *cache = [NSURLCache sharedURLCache];
    [cache removeAllCachedResponses];
    cache.diskCapacity = 0;
    cache.memoryCapacity = 0;
}

@end

@implementation YCAttachment

@end
