//
//  XXBCollectionViewController.m
//  XXBCollectionViewDemo
//
//  Created by xiaobing5 on 2022/1/14.
//

#import "XXBCollectionViewController.h"

@interface XXBCollectionViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property(nonatomic, strong) UICollectionView *collectionView;

@end

@implementation XXBCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initCollectionView];
    
}

- (void)initCollectionView {
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:self.layout];
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
    return 3;
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
    cell.clipsToBounds = YES;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"XXB | %@", indexPath);
}
@end
