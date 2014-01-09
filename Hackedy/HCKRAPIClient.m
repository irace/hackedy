//
//  HCKRAPIClient.m
//  Hackedy
//
//  Created by Bryan Irace on 1/9/14.
//  Copyright (c) 2014 Bryan Irace. All rights reserved.
//

#import "AFHTTPSessionManager.h"
#import "HCKRAPIClient.h"

static NSString * const APIBaseURL = @"http://node-hnapi.herokuapp.com/";

@interface HCKRAPIClient()

@property (nonatomic) AFHTTPSessionManager *sessionManager;

@end

@implementation HCKRAPIClient

#pragma mark - Initialization

- (instancetype)initWithBaseURL:(NSURL *)URL sessionConfiguration:(NSURLSessionConfiguration *)configuration {
    if (self = [super init]) {
        _sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:URL
                                                   sessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    }
    
    return self;
}

- (instancetype)initWithSessionConfiguration:(NSURLSessionConfiguration *)sessionConfiguration {
    return [self initWithBaseURL:[NSURL URLWithString:APIBaseURL] sessionConfiguration:sessionConfiguration];
}

- (id)init {
    return [self initWithSessionConfiguration:nil];
}

#pragma mark - API routes

- (NSURLSessionDataTask *)news:(void (^)(NSArray *posts, NSError *error))callback {
    return [self GET:@"news" parameters:nil callback:callback];
}

- (NSURLSessionDataTask *)moreNews:(void (^)(NSArray *posts, NSError *error))callback {
    return [self GET:@"news2" parameters:nil callback:callback];
}

- (NSURLSessionDataTask *)itemWithID:(NSString *)identifier callback:(void (^)(NSDictionary *item, NSError *error))callback {
    return [self GET:[@"item/" stringByAppendingString:identifier] parameters:nil callback:callback];
}

#pragma mark - Private

- (NSURLSessionDataTask *)GET:(NSString *)URLString
                   parameters:(NSDictionary *)parameters
                     callback:(void (^)(id responseObject, NSError *error))callback {
    if (callback) {
        return [_sessionManager GET:URLString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
            callback(responseObject, nil);
            
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            callback(nil, error);
        }];
    }
    
    return nil;
}


@end
