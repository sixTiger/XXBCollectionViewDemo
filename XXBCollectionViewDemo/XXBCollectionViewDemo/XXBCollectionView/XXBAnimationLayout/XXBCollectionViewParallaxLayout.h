//
//  XXBCollectionViewParallaxLayout.h
//  XXBCollectionViewDemo
//
//  Created by xiaobing5 on 2022/1/15.
//

#import "XXBCollectionViewAnimateLayout.h"

NS_ASSUME_NONNULL_BEGIN

@interface XXBCollectionViewParallaxLayout : XXBCollectionViewAnimateLayout

/// The higher the speed is, the more obvious the parallax.
/// It's recommended to be in range [0, 1] where 0 means no parallax. 0.5 by default.
@property(nonatomic, assign) CGFloat speed;
@end

NS_ASSUME_NONNULL_END
