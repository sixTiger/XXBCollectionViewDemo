//
//  XXBCollectionViewLinear2Layout.h
//  XXBCollectionViewDemo
//
//  Created by xiaobing5 on 2022/2/22.
//

#import "XXBCollectionViewAnimateLayout.h"

NS_ASSUME_NONNULL_BEGIN

@interface XXBCollectionViewLinear2Layout : XXBCollectionViewAnimateLayout
/// The alpha to apply on the cells that are away from the center. Should be
/// in range [0, 1]. 0.5 by default.
@property(nonatomic, assign) CGFloat minAlpha;

/// The scale rate that will applied to the cells to make it into a card.  0.7 by default.
@property(nonatomic, assign) CGFloat maxScaleRate;

/// The scale rate that will applied to the cells to make it into a card.  0.7 by default.
@property(nonatomic, assign) CGFloat minScaleRate;
@end

NS_ASSUME_NONNULL_END
