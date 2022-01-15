//
//  XXBCollectionViewParallaxLayout.m
//  XXBCollectionViewDemo
//
//  Created by xiaobing5 on 2022/1/15.
//

#import "XXBCollectionViewParallaxLayout.h"

@implementation XXBCollectionViewParallaxLayout

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
    self.speed = 0.5;
}

- (void)animateWithAttributes:(XXBCollectionViewLayoutAttributes *)attributes {
    if (attributes.contentView == nil) {
        return;
    }
    UIView *contentView = attributes.contentView;
    CGFloat position = attributes.middleOffset;
    
    if (fabs(position) >= 1 ) {
        contentView.layer.transform = CATransform3DIdentity;
    } else {
        
        switch (attributes.scrollDirection) {
            case UICollectionViewScrollDirectionHorizontal:
            {
                CGFloat width = self.collectionView.frame.size.width;
                CGFloat transitionX = -(width * self.speed * position);
                CATransform3D transform = CATransform3DIdentity;
                transform.m34 = -0.02;
                transform = CATransform3DTranslate(transform, transitionX, 0, 0);
                contentView.layer.transform = transform;
                break;
            }
            case UICollectionViewScrollDirectionVertical:
            {
                CGFloat height = self.collectionView.frame.size.height;
                CGFloat transitionY = -(height * self.speed * position);
                CATransform3D transform = CATransform3DIdentity;
                transform.m34 = -0.02;
                transform = CATransform3DTranslate(transform, 0, transitionY, 0);
                contentView.layer.transform = transform;
                break;
            }
                
            default:
            {
                NSAssert(NO, @"不支持的格式");
                break;
            }
        }
    }
}
@end
