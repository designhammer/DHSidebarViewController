//
//  DHSlidebarLayoutView.m
//  ExerciseTimer
//
//  Created by Jay Roberts on 1/3/13.
//  Copyright (c) 2013 DesignHammer. All rights reserved.
//

#import "DHSlidebarLayoutView.h"

#define kViewTagRoot 10000
#define kViewTagSidebar 10001

@implementation DHSlidebarLayoutView

- (id)initWithFrame:(CGRect)frame {
    if ( (self = [super initWithFrame:frame]) ) {
        // Initialization code
        _offset = 0.0f;
        _snapPosition = 265.0f;
    }
    return self;
}

- (void)setOffset:(float)offset {
    [self setOffset:offset animated:NO];
}

- (void)setOffset:(float)offset animated:(BOOL)animated {
    _offset = offset;
    
    if (_offset < 0) {
        _offset = 0;
    }
    if (animated) {
        [self adjustSubviewFramesAnimated:YES];
    } else {
        [self setNeedsLayout];
    }
}

- (void)adjustSubviewFramesAnimated:(BOOL)animated {
    UIView* rootView = [self viewWithTag:kViewTagRoot];
    UIView* sidebarView = [self viewWithTag:kViewTagSidebar];

    if (animated) {
        [UIView animateWithDuration:0.25
                              delay: 0
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
            rootView.frame = CGRectMake(self.offset, rootView.frame.origin.y, rootView.bounds.size.width, rootView.bounds.size.height);


            float sidebarOffset = self.offset <= _snapPosition ? self.offset : _snapPosition;

            sidebarView.frame = CGRectMake(0 - _snapPosition * 0.25 + sidebarOffset * 0.25, self.bounds.origin.y, rootView.bounds.size.width, self.bounds.size.height);
        }
                         completion:nil];
        
    } else {
        rootView.frame = CGRectMake(self.offset, rootView.frame.origin.y, self.bounds.size.width, self.bounds.size.height);
        
        float sidebarOffset = self.offset <= _snapPosition ? self.offset : _snapPosition;
        
        sidebarView.frame = CGRectMake(0 - _snapPosition * 0.25 + sidebarOffset * 0.25, self.bounds.origin.y, rootView.bounds.size.width, self.bounds.size.height);

    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self adjustSubviewFramesAnimated:NO];
}

@end
