//
//  HCKRNewsTableViewCell.m
//  Hackedy
//
//  Created by Bryan Irace on 1/9/14.
//  Copyright (c) 2014 Bryan Irace. All rights reserved.
//

#import "HCKRCommentsButton.h"
#import "HCKRNewsTableViewCell.h"

@interface HCKRNewsTableViewCell()

@property (nonatomic) HCKRCommentsButton *commentsButton;

@end

@implementation HCKRNewsTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [HCKRColors backgroundColor];
        self.textLabel.textColor = [HCKRColors tintColor];
        self.detailTextLabel.textColor = [HCKRColors tintColor];
        
        _commentsButton = [[HCKRCommentsButton alloc] init];
        [self addSubview:_commentsButton];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect commentsButtonFrame = self.commentsButton.frame;
    commentsButtonFrame.origin.x = CGRectGetWidth(self.bounds) - CGRectGetWidth(commentsButtonFrame) - 10;
    commentsButtonFrame.origin.y = floor((CGRectGetHeight(self.bounds) - CGRectGetHeight(commentsButtonFrame))/2);
    self.commentsButton.frame = commentsButtonFrame;
}


@end
