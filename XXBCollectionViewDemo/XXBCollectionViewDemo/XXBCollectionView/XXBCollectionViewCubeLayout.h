//
//  XXBCollectionViewCubeLayout.h
//  XXBCollectionViewDemo
//
//  Created by xiaobing5 on 2022/1/14.
//

#import "XXBCollectionViewAnimateLayout.h"

NS_ASSUME_NONNULL_BEGIN

@interface XXBCollectionViewCubeLayout : XXBCollectionViewAnimateLayout

/// The perspective that will be applied to the cells. Must be negative. -1/500 by default.
/// Recommended range [-1/2000, -1/200].
/// default 1.0/500.0
@property(nonatomic, assign) CGFloat perspective;

/// The higher the angle is, the _steeper_ the cell would be when transforming.
/// default M_PI_2
@property(nonatomic, assign) CGFloat totalAngle;
@end

NS_ASSUME_NONNULL_END
