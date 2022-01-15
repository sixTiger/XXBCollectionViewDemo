//
//  ViewController.m
//  XXBCollectionViewDemo
//
//  Created by xiaobing5 on 2022/1/13.
//

#import "ViewController.h"
#import "XXBCollectionViewCubeLayout.h"
#import "XXBCollectionViewController.h"
#import "XXBCollectionViewRotateInOutLayout.h"
#import "XXBCollectionViewZoomInOutLayout.h"
#import "XXBCollectionViewLinearCardLayout.h"
#import "XXBCollectionViewPageLayout.h"
#import "XXBCollectionViewParallaxLayout.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, weak) UITableView  *tableview;
@property(nonatomic, strong) NSArray    *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initData];
    [self initView];
    
    
}

- (void)initData {
    XXBCollectionViewCubeLayout *cubeLayout = [[XXBCollectionViewCubeLayout alloc] init];
    
    XXBCollectionViewCubeLayout *cubeLayout2 = [[XXBCollectionViewCubeLayout alloc] init];
    cubeLayout2.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    XXBCollectionViewCubeLayout *cubeLayout3 = [[XXBCollectionViewCubeLayout alloc] init];
    cubeLayout3.totalAngle = M_PI;
    
    XXBCollectionViewCubeLayout *cubeLayout4 = [[XXBCollectionViewCubeLayout alloc] init];
    cubeLayout4.scrollDirection = UICollectionViewScrollDirectionVertical;
    cubeLayout4.totalAngle = M_PI;
    
    XXBCollectionViewRotateInOutLayout *rotateInOutLayout = [[XXBCollectionViewRotateInOutLayout alloc] init];
    
    XXBCollectionViewZoomInOutLayout *zoomInOutLayout = [[XXBCollectionViewZoomInOutLayout alloc] init];
    
    XXBCollectionViewLinearCardLayout *linearCardLayout = [[XXBCollectionViewLinearCardLayout alloc] init];
    
    XXBCollectionViewPageLayout *pageLayout = [[XXBCollectionViewPageLayout alloc] init];
    
    XXBCollectionViewParallaxLayout *parallaxLayout = [[XXBCollectionViewParallaxLayout alloc] init];
    self.dataArray = @[
        cubeLayout,
        cubeLayout2,
        cubeLayout3,
        cubeLayout4,
        rotateInOutLayout,
        zoomInOutLayout,
        linearCardLayout,
        pageLayout,
        parallaxLayout
    ];
}

- (void)initView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.automaticallyAdjustsScrollIndicatorInsets = NO;
    tableView.contentInsetAdjustmentBehavior =  UIScrollViewContentInsetAdjustmentAutomatic;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    XXBCollectionViewFlowLayout *flowLayout = self.dataArray[indexPath.row];
    cell.textLabel.text = NSStringFromClass([flowLayout class]);
    return cell;
}
#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    XXBCollectionViewFlowLayout *flowLayout = self.dataArray[indexPath.row];
    XXBCollectionViewController *collectionViewController = [[XXBCollectionViewController alloc] init];
    collectionViewController.layout = flowLayout;
    [self.navigationController pushViewController:collectionViewController animated:YES];
    
}
@end
