//
//  XXBCollectionViewFlowLayout.h
//  XXBCollectionViewDemo
//
//  Created by xiaobing5 on 2022/1/13.
//

#import <UIKit/UIKit.h>
#import "XXBCollectionViewLayoutAttributes.h"

NS_ASSUME_NONNULL_BEGIN

@interface XXBCollectionViewFlowLayout : UICollectionViewFlowLayout

@property (nonatomic, assign) CGFloat   headerMarginTop;//默认为0.0, default is 0.0

- (XXBCollectionViewLayoutAttributes *)transformLayoutAttributes:(XXBCollectionViewLayoutAttributes *)attributes;
@end

NS_ASSUME_NONNULL_END
