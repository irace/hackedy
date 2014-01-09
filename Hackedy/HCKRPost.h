//
//  HCKRArticle.h
//  Hackedy
//
//  Created by Bryan Irace on 1/8/14.
//  Copyright (c) 2014 Bryan Irace. All rights reserved.
//

typedef NS_ENUM(NSUInteger, HCKRPostType) {
    HCKRPostTypeLink,
    HCKRPostTypeAsk,
    HCKRPostTypeUnknown
};

@interface HCKRPost : NSObject

@property (nonatomic, readonly) NSUInteger commentCount;
@property (nonatomic, copy, readonly) NSString *domain;
@property (nonatomic, readonly) NSUInteger identifier;
@property (nonatomic, readonly) NSUInteger pointCount;
@property (nonatomic, copy, readonly) NSString *dateString;
@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, readonly) HCKRPostType type;
@property (nonatomic, copy, readonly) NSURL *URL;
@property (nonatomic, copy, readonly) NSString *userName;
// "content"
// "poll"
// "comments"
// "more_comments_id"

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
