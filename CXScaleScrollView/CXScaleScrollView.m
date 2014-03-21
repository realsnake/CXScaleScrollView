//
//  CXScaleScrollView.m
//  CXScaleScrollView
//
//  Created by snake on 14-3-21.
//  Copyright (c) 2014年 cx. All rights reserved.
//

#import "CXScaleScrollView.h"

@interface CXScaleScrollView ()
@property (nonatomic) NSUInteger currentIndex;
@end

@implementation CXScaleScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.delegate = self;
    self.pagingEnabled = YES;
}

- (void)setItemViews:(NSArray *)itemViews
{
    if (_itemViews != itemViews) {
        _itemViews = itemViews;
        [self layoutItemViews];
    }
}

- (NSUInteger)currentIndex
{
    return self.contentOffset.x/CGRectGetWidth(self.frame);
}

- (void)layoutItemViews
{
    CGRect newFrame;
    CGFloat width = 0;
    
    for (UIView *subview in self.itemViews) {
        newFrame = subview.frame;
        newFrame.origin.x = width;
        subview.frame = newFrame;
        
        width += CGRectGetWidth(subview.frame);
        [self addSubview:subview];
    }
    
    self.contentSize = CGSizeMake(width, CGRectGetHeight(self.frame));
}

#pragma mark scroll view delegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    for (UIView *view in self.itemViews) {
        [UIView animateWithDuration:0.2 animations:^{
            if (!self.scaleValue) {
                self.scaleValue = 0.9;
            }
            view.transform = CGAffineTransformMakeScale(self.scaleValue, self.scaleValue);
        }];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    UIView *currentItemView = [self.itemViews objectAtIndex:self.currentIndex];
    [UIView animateWithDuration:0.2 animations:^{
        currentItemView.transform = CGAffineTransformMakeScale(1.0, 1.0);
    }];
}
@end
