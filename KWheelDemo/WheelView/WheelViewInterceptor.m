//
//  WheelViewInterceptor.m
//  HIKModularizationDemo
//
//  Created by K on 17/1/22.
//  Copyright © 2017年 KHGG. All rights reserved.
//

#import "WheelViewInterceptor.h"

@implementation WheelViewInterceptor

- (id)forwardingTargetForSelector:(SEL)aSelector {
    if ([self.table respondsToSelector:aSelector]) return self.table;
    if ([self.dataSource respondsToSelector:aSelector]) return self.dataSource;
    return [super forwardingTargetForSelector:aSelector];
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    if ([self.table respondsToSelector:aSelector]) return YES;
    if ([self.dataSource respondsToSelector:aSelector]) return YES;
    return [super respondsToSelector:aSelector];
}

@end
