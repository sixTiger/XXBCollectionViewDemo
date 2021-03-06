//
//  XXBCollectionViewFrameAnimationLayout.m
//  XXBCollectionViewDemo
//
//  Created by xiaobing5 on 2022/6/21.
//

#import "XXBCollectionViewFrameAnimationLayout.h"

@implementation XXBCollectionViewFrameAnimationLayout

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
    self.maxScaleRate = 0.915492;
    self.minScaleRate = 0.742253;
    self.maxShowCount = 3;
}


- (NSArray<__kindof XXBCollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    CGRect newRect = CGRectZero;
    CGFloat x = CGRectGetMinX(rect);
    CGFloat y = CGRectGetMinY(rect);
    CGFloat width = CGRectGetWidth(rect);
    CGFloat height = CGRectGetHeight(rect);
    CGFloat itemWidth = self.itemSize.width + self.minimumLineSpacing;
    
    switch (self.scrollDirection) {
        case UICollectionViewScrollDirectionHorizontal:
        {
            
            newRect = CGRectMake(x - itemWidth,
                                 y,
                                 width + itemWidth * self.maxShowCount,
                                 height);
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
    CGAffineTransform transform = CGAffineTransformIdentity;
    switch (attributes.scrollDirection) {
        case UICollectionViewScrollDirectionHorizontal:
        {
            CGFloat width = self.collectionView.frame.size.width;
            CGFloat cellWidth = self.itemSize.width;
            CGFloat cellMargin =  width * (1 - self.maxScaleRate) * 0.5;
            CGFloat cellPending = 0;
            
            if (self.maxShowCount > 1) {
                //?????????????????????????????????
                cellPending = (cellMargin * 2) / ((CGFloat) MAX(1, self.maxShowCount - 1));
            } else {
                // ???????????? ??????????????????
                cellPending = cellMargin * 2 / self.minScaleRate;
            }
            CGFloat scaleFactor = 1.0;
            if (position <= 0) {
                // ?????????????????????????????????????????????cell
                transform = CGAffineTransformMakeTranslation(-cellMargin, 0);
                scaleFactor = self.maxScaleRate;
                attributes.contentView.layer.cornerRadius = attributes.cell.layer.cornerRadius;
                attributes.contentView.clipsToBounds = attributes.cell.clipsToBounds;
                
            } else if (position < self.maxShowCount) {
                // ????????????????????????cell?????????????????????????????????cell
                scaleFactor = self.maxScaleRate - fabs(position / (double)MAX(1, self.maxShowCount - 1)) * (self.maxScaleRate - self.minScaleRate);
                scaleFactor = MAX(self.minScaleRate, scaleFactor);
                scaleFactor = MIN(self.maxScaleRate, scaleFactor);
                
                attributes.contentView.layer.cornerRadius = attributes.cell.layer.cornerRadius / scaleFactor;
                attributes.contentView.clipsToBounds = attributes.cell.clipsToBounds;
                
                CGFloat expectTranslationX =  - width * position;
                expectTranslationX -= cellMargin;
                expectTranslationX += (cellWidth * ( self.maxScaleRate - scaleFactor) * 0.5) ;
                expectTranslationX += (MIN(position, MAX(1, self.maxShowCount - 1)) * cellPending);
                transform = CGAffineTransformMakeTranslation( expectTranslationX, 0);
            } else {
                //  ???????????????????????????????????????????????????
                // ????????????????????????cell?????????????????????????????????cell
                scaleFactor = self.minScaleRate;
                attributes.contentView.layer.cornerRadius = attributes.cell.layer.cornerRadius / scaleFactor;
                attributes.contentView.clipsToBounds = attributes.cell.clipsToBounds;
                
                CGFloat expectTranslationX =  - width * position;
                expectTranslationX -= cellMargin;
                expectTranslationX += (cellWidth * ( self.maxScaleRate - scaleFactor) * 0.5) ;
                expectTranslationX += (MAX(1, self.maxShowCount - 1) * cellPending);
                
                transform = CGAffineTransformMakeTranslation( expectTranslationX, 0);
            }
            transform = CGAffineTransformScale(transform, scaleFactor, scaleFactor);
            break;
        }
        case UICollectionViewScrollDirectionVertical:
        {
            NSAssert(NO, @"??????????????????");
            break;
        }
            
        default:
        {
            NSAssert(NO, @"??????????????????");
            break;
        }
    }
    
    attributes.zIndex = NSIntegerMax - attributes.indexPath.row;
    attributes.transform = transform;
}
@end
