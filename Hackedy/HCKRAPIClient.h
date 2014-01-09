//
//  HCKRAPIClient.h
//  Hackedy
//
//  Created by Bryan Irace on 1/9/14.
//  Copyright (c) 2014 Bryan Irace. All rights reserved.
//

// TODO: Caching

@interface HCKRAPIClient : NSObject

- (instancetype)initWithBaseURL:(NSURL *)URL sessionConfiguration:(NSURLSessionConfiguration *)configuration;

- (instancetype)initWithSessionConfiguration:(NSURLSessionConfiguration *)sessionConfiguration;

- (NSURLSessionDataTask *)news:(void (^)(NSArray *posts, NSError *error))callback;

- (NSURLSessionDataTask *)moreNews:(void (^)(NSArray *posts, NSError *error))callback;

- (NSURLSessionDataTask *)itemWithID:(NSString *)identifier callback:(void (^)(NSDictionary *item, NSError *error))callback;

@end
