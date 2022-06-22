//
//  XXBCollectionViewFrameAnimationLayout.h
//  XXBCollectionViewDemo
//
//  Created by xiaobing5 on 2022/6/21.
//

#import "XXBCollectionViewAnimateLayout.h"

NS_ASSUME_NONNULL_BEGIN

@interface XXBCollectionViewFrameAnimationLayout : XXBCollectionViewAnimateLayout

/// The scale rate that will applied to the cells to make it into a card.  0.7 by default.
@property(nonatomic, assign) CGFloat maxScaleRate;

/// The scale rate that will applied to the cells to make it into a card.  0.7 by default.
@property(nonatomic, assign) CGFloat minScaleRate;

/// The count of cell will  3 by default.
@property(nonatomic, assign) NSInteger maxShowCount;

@end

NS_ASSUME_NONNULL_END
