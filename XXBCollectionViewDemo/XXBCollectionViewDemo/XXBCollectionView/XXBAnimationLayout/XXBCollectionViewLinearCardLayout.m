//
//  XXBCollectionViewLinearCardLayout.m
//  XXBCollectionViewDemo
//
//  Created by xiaobing5 on 2022/1/15.
//

#import "XXBCollectionViewLinearCardLayout.h"

@implementation XXBCollectionViewLinearCardLayout

- (instancetype)init {
    if (self = [super init]) {
        [self initDafaultData];
    }
    return self;
}

- (void)initDafaultData {
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.itemSize = [UIScreen mainScreen].bounds.size;
    self.minimumInteritemSpacing = 0;
    self.minimumLineSpacing = 0;
    self.sectionInset = UIEdgeInsetsZero;
    self.minAlpha = 0.5;
    self.itemSpacing = 0.4;
    self.scaleRate = 0.7;
}

- (void)animateWithAttributes:(XXBCollectionViewLayoutAttributes *)attributes {
    
    CGFloat position = attributes.middleOffset;
    CGFloat scaleFactor = self.scaleRate - 0.1 * fabs(position);
    CGAffineTransform transform = CGAffineTransformMakeScale(scaleFactor, scaleFactor);
    switch (attributes.scrollDirection) {
        case UICollectionViewScrollDirectionHorizontal:
        {
            CGFloat width = self.collectionView.frame.size.width;
            CGFloat translationX = -(width * self.itemSpacing * position);
            transform = CGAffineTransformTranslate(transform, translationX, 0);
            break;
        }
        case UICollectionViewScrollDirectionVertical:
        {
            CGFloat height = self.collectionView.frame.size.height;
            CGFloat translationY = -(height * self.itemSpacing * position);
            transform = CGAffineTransformTranslate(transform, 0, translationY);
            break;
        }
            
        default:
        {
            NSAssert(NO, @"不支持的格式");
            break;
        }
    }
    
    attributes.alpha = 1.0 - fabs(position) + self.minAlpha;
    attributes.transform = transform;
}
@end
