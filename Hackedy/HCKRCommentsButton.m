//
//  HCKRCommentsButton.m
//  Hackedy
//
//  Created by Bryan Irace on 1/19/14.
//  Copyright (c) 2014 Bryan Irace. All rights reserved.
//

#import "HCKRCommentsButton.h"
#import "UIView+Debug.h"

@interface HCKRCommentsButton()

@property (nonatomic) UILabel *label;

@end

@implementation HCKRCommentsButton

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.tintColor = [HCKRColors tintColor];
        
        [self setImage:[UIImage templateImageNamed:@"bubble"] forState:UIControlStateNormal];

        _label = [[UILabel alloc] init];
        _label.textColor = [HCKRColors tintColor];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.font = [UIFont systemFontOfSize:10];
        _label.text = @"500";
        [self addSubview:_label];
        
        [self sizeToFit];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.label.frame = UIEdgeInsetsInsetRect(self.bounds, UIEdgeInsetsMake(2, 2, 7, 2));
}


- (void)setCommentCount:(NSUInteger)commentCount {
    self.label.text = [NSString stringWithFormat:@"%u", commentCount];
}

- (NSUInteger)commentCount {
    return [self.label.text integerValue];
}

@end
