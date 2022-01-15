//
//  XXBCollectionViewPageLayout.m
//  XXBCollectionViewDemo
//
//  Created by xiaobing5 on 2022/1/15.
//

#import "XXBCollectionViewPageLayout.h"

@implementation XXBCollectionViewPageLayout

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
    self.scaleRate = 0.2;
}

- (void)animateWithAttributes:(XXBCollectionViewLayoutAttributes *)attributes {
    
    CGFloat position = attributes.middleOffset;
    CGPoint contentOffset = self.collectionView.contentOffset;
    CGPoint itemOrigin = attributes.frame.origin;
    CGFloat scaleFactor = self.scaleRate * MIN(position, 0) + 1.0;
    CGAffineTransform transform = CGAffineTransformMakeScale(scaleFactor, scaleFactor);
    switch (attributes.scrollDirection) {
        case UICollectionViewScrollDirectionHorizontal:
        {
            transform = CGAffineTransformTranslate(transform, position < 0 ? contentOffset.x - itemOrigin.x : 0, 0);
            break;
        }
        case UICollectionViewScrollDirectionVertical:
        {
            transform = CGAffineTransformTranslate(transform, 0, position < 0 ?  contentOffset.y - itemOrigin.y : 0);
            break;
        }
            
        default:
        {
            NSAssert(NO, @"不支持的格式");
            break;
        }
    }
    attributes.transform = transform;
    attributes.zIndex = attributes.indexPath.row;
}
@end
