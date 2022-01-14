//
//  XXBCollectionViewCubeLayout.m
//  XXBCollectionViewDemo
//
//  Created by xiaobing5 on 2022/1/14.
//

#import "XXBCollectionViewCubeLayout.h"

@implementation XXBCollectionViewCubeLayout

- (instancetype)init {
    if (self = [super init]) {
        self.perspective = -0.0010;
        self.totalAngle = M_PI_2;
    }
    return self;
}

- (void)animateWithAttributes:(XXBCollectionViewLayoutAttributes *)attributes {
    UIView *contentView = attributes.contentView;
    if (contentView == nil) {
        return;
    }
    CGFloat position = attributes.middleOffset;
   
    if (fabs(position) >= 1) {
        contentView.layer.transform = CATransform3DIdentity;
        contentView.layer.anchorPoint = CGPointMake(0.5, 0.5);
    } else {
        switch (attributes.scrollDirection) {
            case UICollectionViewScrollDirectionHorizontal:
            {
                CGFloat rotateAngle = self.totalAngle * position;
                CGPoint anchorPoint = CGPointMake(position > 0 ? 0 : 1, 0.5);
                
                // As soon as we changed anchor point, we'll need to either update frame/position
                // or transform to offset the position change. frame doesn't work for iOS 14 any
                // more so we'll use transform.
                // CGFloat anchorPointOffsetValue = contentView.layer.bounds.size.width / 2.0;
                // CGFloat anchorPointOffset = position > 0 ? -anchorPointOffsetValue : anchorPointOffsetValue;
                // CATransform3D transform = CATransform3DMakeTranslation(0, 0, 0);
                // transform.m34 = self.perspective;
                // transform = CATransform3DRotate(transform, rotateAngle, 0, 1, 0);
                CATransform3D transform = CATransform3DIdentity;
                transform.m34 = self.perspective;
                transform = CATransform3DRotate(transform, rotateAngle, 0, 1, 0);
                contentView.layer.transform = transform;
                contentView.layer.anchorPoint = anchorPoint;
                break;
            }
            case UICollectionViewScrollDirectionVertical:
            {
                CGFloat rotateAngle = self.totalAngle * position;
                CGPoint anchorPoint = CGPointMake(0.5, position > 0 ? 0 : 1);
                
                // As soon as we changed anchor point, we'll need to either update frame/position
                // or transform to offset the position change. frame doesn't work for iOS 14 any
                // more so we'll use transform.
                // CGFloat anchorPointOffsetValue = contentView.layer.bounds.size.height / 2.0;
                // CGFloat anchorPointOffset = position > 0 ? -anchorPointOffsetValue : anchorPointOffsetValue;
                // CATransform3D transform = CATransform3DMakeTranslation(0, 0, 0);
                // transform.m34 = self.perspective;
                // transform = CATransform3DRotate(transform, rotateAngle, -1, 0, 0);
                
                CATransform3D transform = CATransform3DIdentity;
                transform.m34 = self.perspective;
                transform = CATransform3DRotate(transform, rotateAngle, -1, 0, 0);
                contentView.layer.transform = transform;
                contentView.layer.anchorPoint = anchorPoint;
                break;
            }
                
            default:
            {
                NSAssert(NO, @"不支持的滚动方式");
                break;
            }
        }
    }
}
@end
