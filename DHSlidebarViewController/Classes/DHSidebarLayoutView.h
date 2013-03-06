//
//  DHSidebarLayoutView.h
//  ExerciseTimer
//
//  Created by Jay Roberts on 1/3/13.
//  Copyright (c) 2013 DesignHammer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DHSidebarLayoutView : UIView

@property (nonatomic, assign) float offset;
@property (nonatomic, assign) float snapPosition;

- (void)setOffset:(float)offset animated:(BOOL)animated;

@end
