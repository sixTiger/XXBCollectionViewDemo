//
//  XXBCollectionViewAnimateLayout.h
//  XXBCollectionViewDemo
//
//  Created by xiaobing5 on 2022/1/14.
//

#import <UIKit/UIKit.h>
#import "XXBCollectionViewFlowLayout.h"

NS_ASSUME_NONNULL_BEGIN

@interface XXBCollectionViewAnimateLayout : XXBCollectionViewFlowLayout

- (void)animateWithAttributes:(XXBCollectionViewLayoutAttributes *)attributes;
@end

NS_ASSUME_NONNULL_END
