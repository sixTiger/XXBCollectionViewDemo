//
//  XXBCollectionViewZoomInOutLayout.m
//  XXBCollectionViewDemo
//
//  Created by xiaobing5 on 2022/1/15.
//

#import "XXBCollectionViewZoomInOutLayout.h"

@implementation XXBCollectionViewZoomInOutLayout

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
    if (position <= 0 && position > -1) {
        
        CGFloat scaleFactor = self.scaleRate * position + 1.0;
        attributes.zIndex = attributes.indexPath.row;
        attributes.transform = CGAffineTransformMakeScale(scaleFactor, scaleFactor);
    } else {
        
        attributes.transform = CGAffineTransformIdentity;
    }
}
@end
