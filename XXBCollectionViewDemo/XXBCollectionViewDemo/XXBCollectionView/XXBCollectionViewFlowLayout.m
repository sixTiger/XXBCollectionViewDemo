//
//  XXBCollectionViewFlowLayout.m
//  XXBCollectionViewDemo
//
//  Created by xiaobing5 on 2022/1/13.
//

#import "XXBCollectionViewFlowLayout.h"
#

@implementation XXBCollectionViewFlowLayout

+ (Class)layoutAttributesClass {
    return [XXBCollectionViewLayoutAttributes class];
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

- (NSArray<__kindof XXBCollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray *layoutAttributesForElements = [super layoutAttributesForElementsInRect:rect];
    NSMutableArray *transformedLayoutAttributes = [NSMutableArray array];
    [layoutAttributesForElements enumerateObjectsUsingBlock:^(XXBCollectionViewLayoutAttributes *attributes, NSUInteger idx, BOOL * _Nonnull stop) {
        XXBCollectionViewLayoutAttributes *transformedAttributes = [self transformLayoutAttributes:[attributes copy]];
        [transformedLayoutAttributes addObject:transformedAttributes];
    }];
    
    return transformedLayoutAttributes;
}

- (XXBCollectionViewLayoutAttributes *)transformLayoutAttributes:(XXBCollectionViewLayoutAttributes *)attributes {
    
    if (self.collectionView == nil) {
        return attributes;
    }
    /**
     The position for each cell is defined as the ratio of the distance between
     the center of the cell and the center of the collectionView and the collectionView width/height
     depending on the scroll direction. It can be negative if the cell is, for instance,
     on the left of the screen if you're scrolling horizontally.
     */
    CGFloat distance;
    CGFloat itemOffset;
    switch (self.scrollDirection) {
        case UICollectionViewScrollDirectionHorizontal:
            // 水平滚动
            distance = self.collectionView.frame.size.width;
            itemOffset = attributes.center.x - self.collectionView.contentOffset.x;
            attributes.startOffset = (attributes.frame.origin.x - self.collectionView.contentOffset.x) / attributes.frame.size.width;
            attributes.endOffset = (attributes.frame.origin.x - self.collectionView.contentOffset.x - self.collectionView.frame.size.width) / attributes.frame.size.width;
            
            break;
        case UICollectionViewScrollDirectionVertical:
            // 竖直滚动
            distance = self.collectionView.frame.size.height;
            itemOffset = attributes.center.y - self.collectionView.contentOffset.y;
            attributes.startOffset = (attributes.frame.origin.y - self.collectionView.contentOffset.y) / attributes.frame.size.height;
            attributes.endOffset = (attributes.frame.origin.y - self.collectionView.contentOffset.y - self.collectionView.frame.size.height) / attributes.frame.size.height;
            break;
            
        default:
        {
            NSAssert(NO, @"不支持的滚动类型");
            break;
        }
    }
    
    attributes.scrollDirection = self.scrollDirection;
    attributes.middleOffset = itemOffset / distance - 0.5;

    // Cache the contentView since we're going to use it a lot.
    if (attributes.contentView == nil) {
        attributes.contentView = [[self.collectionView cellForItemAtIndexPath:attributes.indexPath] contentView];
    }
    return attributes;
}
@end
