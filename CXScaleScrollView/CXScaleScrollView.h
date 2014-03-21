//
//  CXScaleScrollView.h
//  CXScaleScrollView
//
//  Created by snake on 14-3-21.
//  Copyright (c) 2014年 cx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CXScaleScrollView : UIScrollView <UIScrollViewDelegate>
@property (strong, nonatomic) NSArray *itemViews;   // all subviews for scroll view
@property (nonatomic) CGFloat scaleValue;
@end
