//
//  XXBCollectionViewLinear2Layout.m
//  XXBCollectionViewDemo
//
//  Created by xiaobing5 on 2022/2/22.
//

#import "XXBCollectionViewLinear2Layout.h"

@implementation XXBCollectionViewLinear2Layout
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
    self.maxScaleRate = 0.7;
    self.minScaleRate = 0.4;
}


- (NSArray<__kindof XXBCollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    CGRect newRect = CGRectZero;
    CGFloat x = CGRectGetMinX(rect);
    CGFloat y = CGRectGetMinY(rect);
    CGFloat width = CGRectGetWidth(rect);
    CGFloat height = CGRectGetHeight(rect);
    CGFloat itemWidth = self.itemSize.width;
    CGFloat itemHeight = self.itemSize.height;
    
    switch (self.scrollDirection) {
        case UICollectionViewScrollDirectionHorizontal:
        {
            
            newRect = CGRectMake(x - itemWidth,
                                 y,
                                 width + itemWidth * 2,
                                 height);
            break;
        }
            
        case UICollectionViewScrollDirectionVertical:
        {
            
            newRect = CGRectMake(x,
                                 y - itemHeight,
                                 width,
                                 height + itemHeight * 2);
            break;
        }
        default:
        {
            newRect = CGRectMake(x,
                                 y,
                                 width,
                                 height);
            break;
        }
    }
    NSArray *layoutAttributesForElements = [super layoutAttributesForElementsInRect:newRect];
    return layoutAttributesForElements;
}


- (void)animateWithAttributes:(XXBCollectionViewLayoutAttributes *)attributes {
    
    CGFloat position = attributes.middleOffset;
    CGFloat scaleFactor = self.maxScaleRate - fabs(position) * (self.maxScaleRate - self.minScaleRate);
    scaleFactor = MAX(self.minScaleRate, scaleFactor);
    scaleFactor = MIN(self.maxScaleRate, scaleFactor);
    
    CGAffineTransform transform = CGAffineTransformMakeScale(scaleFactor, scaleFactor);
    switch (attributes.scrollDirection) {
        case UICollectionViewScrollDirectionHorizontal:
        {
            CGFloat width = self.collectionView.frame.size.width;
            CGFloat cellMargin = width * (1 - self.maxScaleRate) * 0.5 + width * ( 1 - self.minScaleRate) * 0.5;
            CGFloat translationX = 0;
            if(position > -1 && position < 1 ) {
                
                CGFloat expectTranslationX = -cellMargin * position;
                translationX = expectTranslationX / scaleFactor;
                
            } else if ( position <= -1 ) {
                // 左边的cell
                CGFloat centerCellPosition = position + 1;
                
                CGFloat currentCellMarginDefault = width * (1 - self.minScaleRate) * 0.5;
                CGFloat expectTranslationX = currentCellMarginDefault;
                
                CGFloat expectCenterCellTranslationMoveX = -cellMargin * centerCellPosition;
                expectTranslationX += expectCenterCellTranslationMoveX;
                
                CGFloat centerCellScaleFactor = self.maxScaleRate - fabs(centerCellPosition) * (self.maxScaleRate - self.minScaleRate);
                centerCellScaleFactor = MAX(self.minScaleRate, centerCellScaleFactor);
                centerCellScaleFactor = MIN(self.maxScaleRate, centerCellScaleFactor);
                
                CGFloat centerCellWidth = width * centerCellScaleFactor;
                
                expectTranslationX += ((width - centerCellWidth) * 0.5);
                
                translationX = expectTranslationX / scaleFactor;
                
            } else if (position >= 1 ) {
                // 右边的cell
                CGFloat centerCellPosition = position - 1;
                
                CGFloat currentCellMarginDefault = width * (1 - self.minScaleRate) * 0.5;
                CGFloat expectTranslationX = -currentCellMarginDefault;
                
                CGFloat expectCenterCellTranslationMoveX = -cellMargin * centerCellPosition;
                expectTranslationX += expectCenterCellTranslationMoveX;
                
                CGFloat centerCellScaleFactor = self.maxScaleRate - fabs(centerCellPosition) * (self.maxScaleRate - self.minScaleRate);
                centerCellScaleFactor = MAX(self.minScaleRate, centerCellScaleFactor);
                centerCellScaleFactor = MIN(self.maxScaleRate, centerCellScaleFactor);
                
                CGFloat centerCellWidth = width * centerCellScaleFactor;
                
                expectTranslationX -= ((width - centerCellWidth) * 0.5);
                
                translationX = expectTranslationX / scaleFactor;
            }
            transform = CGAffineTransformTranslate(transform, translationX, 0);
            break;
        }
        case UICollectionViewScrollDirectionVertical:
        {
            CGFloat height = self.collectionView.frame.size.height;
            CGFloat cellMargin = height * (1 - self.maxScaleRate) * 0.5 + height * ( 1 - self.minScaleRate) * 0.5;
            CGFloat translationY = 0;
            if(position > -1 && position < 1 ) {
                
                CGFloat expectTranslationY = -cellMargin * position;
                translationY = expectTranslationY / scaleFactor;
                
            } else if ( position <= -1 ) {
                // 上边的cell
                CGFloat centerCellPosition = position + 1;
                
                CGFloat currentCellMarginDefault = height * (1 - self.minScaleRate) * 0.5;
                CGFloat expectTranslationY = currentCellMarginDefault;
                
                CGFloat expectCenterCellTranslationMoveY = -cellMargin * centerCellPosition;
                expectTranslationY += expectCenterCellTranslationMoveY;
                
                CGFloat centerCellScaleFactor = self.maxScaleRate - fabs(centerCellPosition) * (self.maxScaleRate - self.minScaleRate);
                centerCellScaleFactor = MAX(self.minScaleRate, centerCellScaleFactor);
                centerCellScaleFactor = MIN(self.maxScaleRate, centerCellScaleFactor);
                
                CGFloat centerCellHeight = height * centerCellScaleFactor;
                
                expectTranslationY += ((height - centerCellHeight) * 0.5);
                
                translationY = expectTranslationY / scaleFactor;
                
            } else if (position >= 1 ) {
                // 下边的cell
                CGFloat centerCellPosition = position - 1;
                
                CGFloat currentCellMarginDefault = height * (1 - self.minScaleRate) * 0.5;
                CGFloat expectTranslationY = -currentCellMarginDefault;
                
                CGFloat expectCenterCellTranslationMoveY = -cellMargin * centerCellPosition;
                expectTranslationY += expectCenterCellTranslationMoveY;
                
                CGFloat centerCellScaleFactor = self.maxScaleRate - fabs(centerCellPosition) * (self.maxScaleRate - self.minScaleRate);
                centerCellScaleFactor = MAX(self.minScaleRate, centerCellScaleFactor);
                centerCellScaleFactor = MIN(self.maxScaleRate, centerCellScaleFactor);
                
                CGFloat centerCellHeight = height * centerCellScaleFactor;
                
                expectTranslationY -= ((height - centerCellHeight) * 0.5);
                
                translationY = expectTranslationY / scaleFactor;
            }
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
