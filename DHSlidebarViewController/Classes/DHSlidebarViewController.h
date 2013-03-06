//
//  DHSlidebarViewController.h
//  ExerciseTimer
//
//  Created by Jay Roberts on 1/3/13.
//  Copyright (c) 2013 DesignHammer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DHSlidebarViewController : UIViewController <UIGestureRecognizerDelegate>

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
