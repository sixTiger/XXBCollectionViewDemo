//
//  XXBCollectionViewRotateInOutLayout.h
//  XXBCollectionViewDemo
//
//  Created by xiaobing5 on 2022/1/15.
//

#import "XXBCollectionViewAnimateLayout.h"

NS_ASSUME_NONNULL_BEGIN

@interface XXBCollectionViewRotateInOutLayout : XXBCollectionViewAnimateLayout

/// The alpha to apply on the cells that are away from the center. Should be
/// in range [0, 1]. 0 by default.
@property(nonatomic, assign) CGFloat minAlpha;

/// The max rotating angle that would be applied to the cell. Should be in
/// range [0, 2pi]. PI/4 by default.
@property(nonatomic, assign) CGFloat maxRotate;
@end

NS_ASSUME_NONNULL_END
