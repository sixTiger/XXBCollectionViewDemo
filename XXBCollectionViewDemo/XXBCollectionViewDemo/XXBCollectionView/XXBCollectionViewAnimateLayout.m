//
//  XXBCollectionViewAnimateLayout.m
//  XXBCollectionViewDemo
//
//  Created by xiaobing5 on 2022/1/14.
//

#import "XXBCollectionViewAnimateLayout.h"

@implementation XXBCollectionViewAnimateLayout

- (XXBCollectionViewLayoutAttributes *)transformLayoutAttributes:(XXBCollectionViewLayoutAttributes *)attributes {
    attributes = [super transformLayoutAttributes:attributes];
    [self animateWithAttributes:attributes];
    return attributes;
}

- (void)animateWithAttributes:(XXBCollectionViewLayoutAttributes *)attributes {
    
}
@end
