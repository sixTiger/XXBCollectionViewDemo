//
//  XXBCollectionViewPageLayout.h
//  XXBCollectionViewDemo
//
//  Created by xiaobing5 on 2022/1/15.
//

#import "XXBCollectionViewAnimateLayout.h"

NS_ASSUME_NONNULL_BEGIN

@interface XXBCollectionViewPageLayout : XXBCollectionViewAnimateLayout

/// The scale rate that will applied to the cells to make it into a card.  0.2 by default.
@property(nonatomic, assign) CGFloat scaleRate;
@end

NS_ASSUME_NONNULL_END
