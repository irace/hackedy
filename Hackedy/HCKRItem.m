//
//  HCKRItem.m
//  Hackedy
//
//  Created by Bryan Irace on 1/8/14.
//  Copyright (c) 2014 Bryan Irace. All rights reserved.
//

#import "HCKRItem.h"
#import "NSObject+Safety.h"

@interface HCKRItem()

@property (nonatomic) NSUInteger commentCount;
@property (nonatomic, copy) NSString *domain;
@property (nonatomic) NSUInteger identifier;
@property (nonatomic) NSUInteger pointCount;
@property (nonatomic, copy) NSString *dateString;
@property (nonatomic, copy) NSString *title;
@property (nonatomic) HCKRItemType type;
@property (nonatomic, copy) NSURL *URL;
@property (nonatomic, copy) NSString *userName;

@end

@implementation HCKRItem

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        _commentCount = [dictionary[@"comments_count"] typeSafeUnsignedIntegerValue];
        _domain = [dictionary[@"domain"] typeSafeStringValue];
        _identifier = [dictionary[@"domain"] typeSafeUnsignedIntegerValue];
        _pointCount = [dictionary[@"points"] typeSafeUnsignedIntegerValue];
        _dateString = [dictionary[@"time_ago"] typeSafeStringValue];
        _title = [dictionary[@"title"] typeSafeStringValue];
        _type = itemTypeForString([dictionary[@"type"] typeSafeStringValue]);
        _URL = [NSURL URLWithString:[dictionary[@"url"] typeSafeStringValue]];
        _userName = [dictionary[@"user"] typeSafeStringValue];
    }
    
    return self;
}

#pragma mark - Private

static HCKRItemType itemTypeForString(NSString *itemTypeString) {
    if ([itemTypeString isEqualToString:@"link"]) {
        return HCKRItemTypeLink;
    }
    else if ([itemTypeString isEqualToString:@"ask"]) {
        return HCKRItemTypeAsk;
    }
    
    return HCKRItemTypeUnknown;
}

@end
