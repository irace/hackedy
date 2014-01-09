//
//  HCKRAPIClient.h
//  Hackedy
//
//  Created by Bryan Irace on 1/9/14.
//  Copyright (c) 2014 Bryan Irace. All rights reserved.
//

@interface HCKRAPIClient : NSObject

- (instancetype)initWithSessionConfiguration:(NSURLSessionConfiguration *)sessionConfiguration;

- (void)news:(void (^)(NSArray *posts, NSError *error))callback;

- (void)itemWithID:(NSString *)identifier callback:(void (^)(NSDictionary *item, NSError *error))callback;

@end
