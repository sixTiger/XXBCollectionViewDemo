//
//  XXBCollectionViewLinearCardLayout.h
//  XXBCollectionViewDemo
//
//  Created by xiaobing5 on 2022/1/15.
//

#import "XXBCollectionViewAnimateLayout.h"

NS_ASSUME_NONNULL_BEGIN

@interface XXBCollectionViewLinearCardLayout : XXBCollectionViewAnimateLayout

/// The alpha to apply on the cells that are away from the center. Should be
/// in range [0, 1]. 0.5 by default.
@property(nonatomic, assign) CGFloat minAlpha;

/// The spacing ratio between two cells. 0.4 by default.
@property(nonatomic, assign) CGFloat itemSpacing;

/// The scale rate that will applied to the cells to make it into a card.  0.7 by default.
@property(nonatomic, assign) CGFloat scaleRate;
@end

NS_ASSUME_NONNULL_END
