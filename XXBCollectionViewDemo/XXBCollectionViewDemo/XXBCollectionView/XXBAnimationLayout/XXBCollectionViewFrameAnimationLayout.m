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
    self.maxScaleRate = 0.7;
    self.minScaleRate = 0.6;
    self.maxShowCount = 3;
}


- (NSArray<__kindof XXBCollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    CGRect newRect = CGRectZero;
    CGFloat x = CGRectGetMinX(rect);
    CGFloat y = CGRectGetMinY(rect);
    CGFloat width = CGRectGetWidth(rect);
    CGFloat height = CGRectGetHeight(rect);
    CGFloat itemWidth = self.itemSize.width;
    
    switch (self.scrollDirection) {
        case UICollectionViewScrollDirectionHorizontal:
        {
            
            newRect = CGRectMake(x - itemWidth,
                                 y,
                                 width + itemWidth * 2,
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
    NSMutableArray *transformedLayoutAttributes = [NSMutableArray array];
    [layoutAttributesForElements enumerateObjectsUsingBlock:^(XXBCollectionViewLayoutAttributes *attributes, NSUInteger idx, BOOL * _Nonnull stop) {
        XXBCollectionViewLayoutAttributes *transformedAttributes = [self transformLayoutAttributes:[attributes copy]];
        [transformedLayoutAttributes addObject:transformedAttributes];
    }];
    
    return transformedLayoutAttributes;
}


- (void)animateWithAttributes:(XXBCollectionViewLayoutAttributes *)attributes {
    
    CGFloat position = attributes.middleOffset;
    CGAffineTransform transform = CGAffineTransformIdentity;
    switch (attributes.scrollDirection) {
        case UICollectionViewScrollDirectionHorizontal:
        {
            CGFloat width = self.collectionView.frame.size.width;
            CGFloat cellMargin =  width * (1 - self.maxScaleRate) * 0.5;
            CGFloat scaleFactor = 1.0;
            if (position <= 0) {
                // 正在展示的以及正在展示的左边的cell
                transform = CGAffineTransformMakeTranslation(0, 0);
                scaleFactor = self.maxScaleRate;
            } else if (position <= (self.maxShowCount - 0.5)) {
                // 正在展示的右边的cell，在需要展示的氛围内的cell
                scaleFactor = self.maxScaleRate - fabs(position / (double)self.maxShowCount) * (self.maxScaleRate - self.minScaleRate);
                scaleFactor = MAX(self.minScaleRate, scaleFactor);
                scaleFactor = MIN(self.maxScaleRate, scaleFactor);
                
                CGFloat expectTranslationX =  - width * position;
                expectTranslationX += cellMargin * position * 0.5;
                transform = CGAffineTransformMakeTranslation(expectTranslationX, 0);
            } else {
                //  右边超过需要展示的数量的暂时不处理
                transform = CGAffineTransformIdentity;
                scaleFactor = 1.0;
            }
            transform = CGAffineTransformScale(transform, scaleFactor, scaleFactor);
            break;
        }
        case UICollectionViewScrollDirectionVertical:
        {
            NSAssert(NO, @"不支持的格式");
            break;
        }
            
        default:
        {
            NSAssert(NO, @"不支持的格式");
            break;
        }
    }
    
    attributes.zIndex = NSIntegerMax - attributes.indexPath.row;
    attributes.transform = transform;
}
@end
