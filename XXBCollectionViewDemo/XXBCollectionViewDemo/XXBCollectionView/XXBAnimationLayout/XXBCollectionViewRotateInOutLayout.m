//
//  XXBCollectionViewRotateInOutLayout.m
//  XXBCollectionViewDemo
//
//  Created by xiaobing5 on 2022/1/15.
//

#import "XXBCollectionViewRotateInOutLayout.h"

@implementation XXBCollectionViewRotateInOutLayout

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
    self.minAlpha = 0;
    self.maxRotate = M_PI_4;
}

- (void)animateWithAttributes:(XXBCollectionViewLayoutAttributes *)attributes {
    CGFloat position = attributes.middleOffset;
    if (fabs(position) >= 1) {
        
        attributes.transform = CGAffineTransformIdentity;
        attributes.alpha = 1.0;
    } else {
        
        CGFloat rotateFactor = self.maxRotate * position;
        attributes.zIndex = attributes.indexPath.row;
        attributes.alpha = 1.0 - fabs(position) + self.minAlpha;
        attributes.transform = CGAffineTransformMakeRotation(rotateFactor);
    }
}
@end
