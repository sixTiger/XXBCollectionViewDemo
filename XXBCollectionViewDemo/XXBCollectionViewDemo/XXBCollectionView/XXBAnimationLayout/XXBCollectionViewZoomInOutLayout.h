//
//  XXBCollectionViewZoomInOutLayout.h
//  XXBCollectionViewDemo
//
//  Created by xiaobing5 on 2022/1/15.
//

#import "XXBCollectionViewAnimateLayout.h"

NS_ASSUME_NONNULL_BEGIN

@interface XXBCollectionViewZoomInOutLayout : XXBCollectionViewAnimateLayout

/// The scaleRate decides the maximum scale rate where 0 means no scale and
/// 1 means the cell will disappear at min. 0.2 by default.
@property(nonatomic, assign) CGFloat scaleRate;
@end

NS_ASSUME_NONNULL_END
