//
//  XXBCollectionViewController.m
//  XXBCollectionViewDemo
//
//  Created by xiaobing5 on 2022/1/14.
//

#import "XXBCollectionViewController.h"
#import "XXBCollectionViewFrameAnimationLayout.h"

@interface XXBCollectionViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property(nonatomic, strong) UICollectionView *collectionView;

@end

@implementation XXBCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initCollectionView];
    self.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1.0];
    
}

- (void)initCollectionView {
    CGRect frame = self.view.bounds;
    if ([self.layout isKindOfClass:[XXBCollectionViewFrameAnimationLayout class]]) {
        CGFloat viewWidth = CGRectGetWidth(self.view.bounds);
        CGFloat width = self.layout.itemSize.width;
        CGFloat height = self.layout.itemSize.height;
        frame = CGRectMake((viewWidth - width) * 0.5, 100, width, height);
        
    }
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:self.layout];
    collectionView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:0.3];
    [self.view addSubview:collectionView];
    collectionView.clipsToBounds = YES;
    collectionView.pagingEnabled = YES;
    collectionView.autoresizingMask = (1 << 6) - 1;
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    collectionView.automaticallyAdjustsScrollIndicatorInsets = NO;
    collectionView.contentInsetAdjustmentBehavior =  UIScrollViewContentInsetAdjustmentNever;
    collectionView.contentInset = UIEdgeInsetsZero;
    _collectionView = collectionView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1000;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255. green:arc4random_uniform(255)/255. blue:arc4random_uniform(255)/255. alpha:1.0];
    UILabel *label = [cell.contentView viewWithTag:10000];
    if (label == nil) {
        label = [[UILabel alloc] initWithFrame:cell.contentView.bounds];
        label.tag = 10000;
        label.numberOfLines = 0;
        label.textAlignment = NSTextAlignmentCenter;
        [cell.contentView addSubview:label];
        label.autoresizingMask = (1 << 6) - 1;
    }
    label.text = [NSString stringWithFormat:@"%@",indexPath];
    cell.backgroundColor = [UIColor yellowColor];
    cell.layer.cornerRadius = 5;
    cell.clipsToBounds = YES;
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"XXB | %@", indexPath);
}
@end
