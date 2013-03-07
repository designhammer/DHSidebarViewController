//
//  DHSidebarViewController.h
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

#import <UIKit/UIKit.h>

@interface DHSidebarViewController : UIViewController <UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIViewController* rootViewController;
@property (nonatomic, strong) UIViewController* sidebarViewController;
@property (nonatomic, assign) BOOL panningEnabled;
@property (nonatomic, assign) float threshold; // The distance the user must slide the root view from its resting position to trigger an open or close
@property (nonatomic, assign) UIColor* overlayColor;
@property (nonatomic, assign) float overlayOpacity;
@property (nonatomic, assign) float openOffset; // The distance from the right screen edge where the root view will rest when open

- (id)initWithRootViewController:(UIViewController*)rootViewController sidebarViewController:(UIViewController*)sidebarViewController;
- (BOOL)isOpen;
- (void)toggleSidebar;
- (void)openSidebar;
- (void)closeSidebar;
- (void)hideRootViewController;
- (void)showRootViewController;

@end
