//
//  XXBCollectionViewLayoutAttributes.m
//  XXBCollectionViewDemo
//
//  Created by xiaobing5 on 2022/1/14.
//

#import "XXBCollectionViewLayoutAttributes.h"

@implementation XXBCollectionViewLayoutAttributes

- (id)copyWithZone:(NSZone *)zone {
    
    XXBCollectionViewLayoutAttributes *layoutAttributes = [super copyWithZone:zone];
    layoutAttributes.contentView = self.contentView;
    layoutAttributes.cell = self.cell;
    layoutAttributes.scrollDirection = self.scrollDirection;
    layoutAttributes.startOffset = self.startOffset;
    layoutAttributes.middleOffset = self.middleOffset;
    layoutAttributes.endOffset = self.endOffset;
    return layoutAttributes;
}

- (BOOL)isEqual:(XXBCollectionViewLayoutAttributes *)object {
    if ([object isKindOfClass:[XXBCollectionViewLayoutAttributes class]]) {
        return [super isEqual:object]
        && self.contentView == object.contentView
        && self.scrollDirection == object.scrollDirection
        && self.startOffset == object.startOffset
        && self.middleOffset == object.middleOffset
        && self.endOffset == object.endOffset;
    } else {
        return [super isEqual:object];
    }
}
@end
