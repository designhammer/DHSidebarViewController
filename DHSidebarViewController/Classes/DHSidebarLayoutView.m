//
//  DHSidebarLayoutView.m
//  ExerciseTimer
//
//  Created by Jay Roberts on 1/3/13.
//  Copyright (c) 2013 DesignHammer. All rights reserved.
//
//	Permission is hereby granted, free of charge, to any person obtaining a copy
//	of this software and associated documentation files (the "Software"), to deal
//	in the Software without restriction, including without limitation the rights to
//	use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
//	of the Software, and to permit persons to whom the Software is furnished to
//	do so, subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in all
//	copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
//	OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//	WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//	CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import "DHSidebarLayoutView.h"

#define kViewTagRoot 10000
#define kViewTagSidebar 10001

@implementation DHSidebarLayoutView

#pragma mark - Initialization

- (id)initWithFrame:(CGRect)frame {
    if ( (self = [super initWithFrame:frame]) ) {
        _offset = 0.0f;
        _snapPosition = 265.0f;
    }
    return self;
}

#pragma mark - View Positioning

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
        [self adjustSubviewFramesAnimated:NO];
    }
}

// Sets the frames for the Root and Sidebar views based on the current _offset.
- (void)adjustSubviewFramesAnimated:(BOOL)animated {
    UIView* rootView = [self viewWithTag:kViewTagRoot];
    UIView* sidebarView = [self viewWithTag:kViewTagSidebar];

    if (animated) {
        [UIView animateWithDuration:0.25
                              delay: 0
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
            rootView.center = CGPointMake(self.offset + rootView.frame.size.width / 2, rootView.center.y);
            float sidebarOffset = self.offset <= _snapPosition ? self.offset : _snapPosition;
            sidebarView.center = CGPointMake(0 - _snapPosition * 0.25 + sidebarOffset * 0.25 + sidebarView.frame.size.width / 2, sidebarView.center.y);
        }
                         completion:nil];
        
    } else {
        rootView.center = CGPointMake(self.offset + rootView.frame.size.width / 2, rootView.center.y);
        float sidebarOffset = self.offset <= _snapPosition ? self.offset : _snapPosition;
        sidebarView.center = CGPointMake(0 - _snapPosition * 0.25 + sidebarOffset * 0.25 + sidebarView.frame.size.width / 2, sidebarView.center.y);
    }
}

@end
