//
//  ViewController.m
//  XXBCollectionViewDemo
//
//  Created by xiaobing5 on 2022/1/13.
//

#import "ViewController.h"
#import "XXBCollectionViewCubeLayout.h"
#import "XXBCollectionViewController.h"

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
    cubeLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    cubeLayout.itemSize = [UIScreen mainScreen].bounds.size;
    cubeLayout.minimumInteritemSpacing = 0;
    cubeLayout.minimumLineSpacing = 0;
    cubeLayout.sectionInset = UIEdgeInsetsZero;
    
    XXBCollectionViewCubeLayout *cubeLayout2 = [[XXBCollectionViewCubeLayout alloc] init];
    cubeLayout2.scrollDirection = UICollectionViewScrollDirectionVertical;
    cubeLayout2.itemSize = [UIScreen mainScreen].bounds.size;
    cubeLayout2.minimumInteritemSpacing = 0;
    cubeLayout2.minimumLineSpacing = 0;
    cubeLayout2.sectionInset = UIEdgeInsetsZero;
    
    XXBCollectionViewCubeLayout *cubeLayout3 = [[XXBCollectionViewCubeLayout alloc] init];
    cubeLayout3.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    cubeLayout3.itemSize = [UIScreen mainScreen].bounds.size;
    cubeLayout3.minimumInteritemSpacing = 0;
    cubeLayout3.minimumLineSpacing = 0;
    cubeLayout3.sectionInset = UIEdgeInsetsZero;
    cubeLayout3.totalAngle = M_PI;
    
    XXBCollectionViewCubeLayout *cubeLayout4 = [[XXBCollectionViewCubeLayout alloc] init];
    cubeLayout4.scrollDirection = UICollectionViewScrollDirectionVertical;
    cubeLayout4.itemSize = [UIScreen mainScreen].bounds.size;
    cubeLayout4.minimumInteritemSpacing = 0;
    cubeLayout4.minimumLineSpacing = 0;
    cubeLayout4.sectionInset = UIEdgeInsetsZero;
    cubeLayout4.totalAngle = M_PI;
    
    self.dataArray = @[
        cubeLayout,
        cubeLayout2,
        cubeLayout3,
        cubeLayout4
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
