//
//  DemoViewController.m
//  CXScaleScrollView
//
//  Created by snake on 14-3-21.
//  Copyright (c) 2014年 cx. All rights reserved.
//

#import "DemoViewController.h"
#import "CXScaleScrollView.h"

@interface DemoViewController ()

@property (weak, nonatomic) IBOutlet CXScaleScrollView *demoScrollView;
@end

@implementation DemoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupDemoView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupDemoView
{
    NSMutableArray *subviewArray = [NSMutableArray array];
    for (int i = 1; i <= 3; i++) {
        UIView *subview = [[UIView alloc] initWithFrame:self.view.frame];
        subview.backgroundColor = [UIColor whiteColor];
        UILabel *centerLabel = [[UILabel alloc] initWithFrame:subview.frame];
        centerLabel.text = [NSString stringWithFormat:@"Page %d", i];
        centerLabel.textAlignment = NSTextAlignmentCenter;
        [subview addSubview:centerLabel];
        
        [subviewArray addObject:subview];
    }
    
    self.demoScrollView.itemViews = subviewArray;
}
@end
