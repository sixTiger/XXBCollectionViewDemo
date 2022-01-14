//
//  XXBCollectionViewLayoutAttributes.h
//  XXBCollectionViewDemo
//
//  Created by xiaobing5 on 2022/1/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XXBCollectionViewLayoutAttributes : UICollectionViewLayoutAttributes
@property(nonatomic, weak) UIView  *contentView;
@property(nonatomic, assign) UICollectionViewScrollDirection scrollDirection;
/// The ratio of the distance between the start of the cell and the start of the collectionView and the height/width of the cell depending on the scrollDirection. It's 0 when the start of the cell aligns the start of the collectionView. It gets positive when the cell moves towards the scrolling direction (right/down) while getting negative when moves opposite.
@property(nonatomic, assign) CGFloat startOffset;
/// The ratio of the distance between the center of the cell and the center of the collectionView and the height/width of the cell depending on the scrollDirection. It's 0 when the center of the cell aligns the center of the collectionView. It gets positive when the cell moves towards the scrolling direction (right/down) while getting negative when moves opposite.
@property(nonatomic, assign) CGFloat middleOffset;
/// The ratio of the distance between the **start** of the cell and the end of the collectionView and the height/width of the cell depending on the scrollDirection. It's 0 when the **start** of the cell aligns the end of the collectionView. It gets positive when the cell moves towards the scrolling direction (right/down) while getting negative when moves opposite.
@property(nonatomic, assign) CGFloat endOffset;
@end

NS_ASSUME_NONNULL_END
