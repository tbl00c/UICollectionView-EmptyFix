//
//  UICollectionView+Fix.m
//  zhuanzhuan
//
//  Created by 李伯坤 on 2017/12/15.
//  Copyright © 2017年 转转. All rights reserved.
//

#import "UICollectionView+Fix.h"
#import <objc/runtime.h>

#define         METHOD_NAME_A           @"resumeR"
#define         METHOD_NAME_B           @"eloads"

#define         PROPERTY_NAME_A         @"_reloa"
#define         PROPERTY_NAME_B         @"dingSuspe"
#define         PROPERTY_NAME_C         @"ndedCount"

@implementation UICollectionView (Fix)

+ (void)load
{
    NSString *oldMethodString = [NSString stringWithFormat:@"_%@%@", METHOD_NAME_A, METHOD_NAME_B];
    Method oldMethod = class_getInstanceMethod(self, NSSelectorFromString(oldMethodString));
    Method newMethod = class_getInstanceMethod(self, @selector(__zz_resumeReloads));
    method_exchangeImplementations(oldMethod, newMethod);
}

- (void)__zz_resumeReloads {
    [self __zz_resumeReloads];
    NSString *pName = [NSString stringWithFormat:@"%@%@%@", PROPERTY_NAME_A, PROPERTY_NAME_B, PROPERTY_NAME_C];
    NSNumber *number = [self valueForKey:pName];
    if (number.longLongValue < 0) {
        [self setValue:@(0) forKey:pName];
    }
}


@end
