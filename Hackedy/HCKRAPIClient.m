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

- (instancetype)initWithSessionConfiguration:(NSURLSessionConfiguration *)sessionConfiguration {
    if (self = [super init]) {
        _sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:APIBaseURL]
                                                   sessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    }
    
    return self;
}

- (id)init {
    return [self initWithSessionConfiguration:nil];
}

- (void)news:(void (^)(NSArray *posts, NSError *error))callback {
    if (callback) {
        [_sessionManager GET:@"news" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
            callback(responseObject, nil);
            
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            callback(nil, error);
        }];
    }
}

- (void)itemWithID:(NSString *)identifier callback:(void (^)(NSDictionary *item, NSError *error))callback {
    if (callback) {
        [_sessionManager GET:[@"item/" stringByAppendingString:identifier] parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
            callback(responseObject, nil);
            
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            callback(nil, error);
        }];
    }
}

@end
