//
//  WheelView.m
//  HIKModularizationDemo
//
//  Created by K on 17/1/22.
//  Copyright © 2017年 KHGG. All rights reserved.
//

#import "WheelView.h"
#import "WheelViewInterceptor.h"

@interface WheelView ()

@property (nonatomic, strong) WheelViewInterceptor * interceptor;
@property (nonatomic, assign) NSInteger numRows;

@end

@implementation WheelView

#pragma mark - LayoutSubviews
- (void)layoutSubviews {
    [self resetContentOffsetIfNeeded];
    [super layoutSubviews];
}

- (void)resetContentOffsetIfNeeded {
    CGPoint contentOffset  = self.contentOffset;
    //scroll over top
    if (contentOffset.y < 0.0) {
        contentOffset.y = self.contentSize.height / 3.0;
    }
    //scroll over bottom
    else if (contentOffset.y >= (self.contentSize.height - self.bounds.size.height)) {
        contentOffset.y = self.contentSize.height / 3.0 - self.bounds.size.height;
    }
    [self setContentOffset: contentOffset];
}

#pragma mark - Delegate Method
- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
    self.numRows = [self.interceptor.dataSource tableView:tableView numberOfRowsInSection:section];
    return self.numRows * 3;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSIndexPath * actualIndexPath = [NSIndexPath indexPathForRow:indexPath.row % self.numRows inSection:indexPath.section];
    return [self.interceptor.dataSource tableView:tableView cellForRowAtIndexPath:actualIndexPath];
}

#pragma mark - Setter and Getter
- (void)setDataSource:(id<UITableViewDataSource>)dataSource {
    self.interceptor.dataSource = dataSource;
    [super setDataSource:(id<UITableViewDataSource>)self.interceptor];
}

- (WheelViewInterceptor *)interceptor {
    if (!_interceptor) {
        _interceptor = [[WheelViewInterceptor alloc]init];
        _interceptor.table = self;
    }
    return _interceptor;
}
@end
