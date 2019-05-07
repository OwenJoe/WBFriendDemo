//
//  PagerControllerDmeoController.m
//  TYPagerControllerDemo
//
//  Created by tany on 2017/7/19.
//  Copyright © 2017年 tany. All rights reserved.
//

#import "MNGP_TrendsViewController.h"
#import "TYTabPagerBar.h"
#import "TYPagerController.h"
#import "MNGP_TrendsOneViewController.h"
#import "MNGP_TrendsTwoViewController.h"
#import "MNGP_TrendsThreeViewController.h"



@interface MNGP_TrendsViewController ()<TYTabPagerBarDataSource,TYTabPagerBarDelegate,TYPagerControllerDataSource,TYPagerControllerDelegate>

@property (nonatomic, weak) TYTabPagerBar *tabBar;
@property (nonatomic, weak) TYPagerController *pagerController;

@property (nonatomic, strong) NSArray *datas;

@end

@implementation MNGP_TrendsViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = WBColor(@"#E5E5E5");
    
//    self.title = @"动态";
    
    [self addTabPageBar];
    [self addPagerController];
    
    [self loadData];
    
}


-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    navigationBarHideYes
}



- (void)addTabPageBar {
    TYTabPagerBar *tabBar = [[TYTabPagerBar alloc]init];
    //欧文修改
    //    tabBar.layout.cellWidth = WBScreenWidth / 4;
    tabBar.backgroundColor = [UIColor whiteColor];
    tabBar.layout.barStyle = TYPagerBarStyleProgressElasticView;
    tabBar.dataSource = self;
    tabBar.delegate = self;
    [tabBar registerClass:[TYTabPagerBarCell class] forCellWithReuseIdentifier:[TYTabPagerBarCell cellIdentifier]];
    [self.view addSubview:tabBar];
    _tabBar = tabBar;
}

- (void)addPagerController {
    TYPagerController *pagerController = [[TYPagerController alloc]init];
    pagerController.layout.prefetchItemCount = 1;
    //pagerController.layout.autoMemoryCache = NO;
    // 只有当scroll滚动动画停止时才加载pagerview，用于优化滚动时性能
    pagerController.layout.addVisibleItemOnlyWhenScrollAnimatedEnd = YES;
    pagerController.dataSource = self;
    pagerController.delegate = self;
    [self addChildViewController:pagerController];
    [self.view addSubview:pagerController.view];
    _pagerController = pagerController;
}



- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WBScreenWidth, 20)];
    bgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgView];
    _tabBar.frame = CGRectMake(0, 20, CGRectGetWidth(self.view.frame), 44*KHeightRate);
    _pagerController.view.frame = CGRectMake(0, CGRectGetMaxY(_tabBar.frame), CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)- CGRectGetMaxY(_tabBar.frame));
}

- (void)loadData {
    NSMutableArray *datas = [NSMutableArray array];
    for (NSInteger i = 0; i < 3; ++i) {
        [datas addObject:[NSArray arrayWithObjects:@"关注",@"推荐",@"名人", nil][i]];
    }
    _datas = [datas copy];
    
    [self reloadData];
}

#pragma mark - TYTabPagerBarDataSource

- (NSInteger)numberOfItemsInPagerTabBar {
    return _datas.count;
}

- (UICollectionViewCell<TYTabPagerBarCellProtocol> *)pagerTabBar:(TYTabPagerBar *)pagerTabBar cellForItemAtIndex:(NSInteger)index {
    UICollectionViewCell<TYTabPagerBarCellProtocol> *cell = [pagerTabBar dequeueReusableCellWithReuseIdentifier:[TYTabPagerBarCell cellIdentifier] forIndex:index];
    cell.titleLabel.text = _datas[index];
    return cell;
}

#pragma mark - TYTabPagerBarDelegate

- (CGFloat)pagerTabBar:(TYTabPagerBar *)pagerTabBar widthForItemAtIndex:(NSInteger)index {
    NSString *title = _datas[index];
    return [pagerTabBar cellWidthForTitle:title];
}

- (void)pagerTabBar:(TYTabPagerBar *)pagerTabBar didSelectItemAtIndex:(NSInteger)index {
    [_pagerController scrollToControllerAtIndex:index animate:YES];
}

#pragma mark - TYPagerControllerDataSource

- (NSInteger)numberOfControllersInPagerController {
    return 3;
}

- (UIViewController *)pagerController:(TYPagerController *)pagerController controllerForIndex:(NSInteger)index prefetching:(BOOL)prefetching {
    if (index%3 == 0) {
        MNGP_TrendsOneViewController *VC = [[MNGP_TrendsOneViewController alloc]init];
        VC.fatherViewController = self;
        return VC;
    }else if (index%3 == 1) {
        MNGP_TrendsTwoViewController *VC = [[MNGP_TrendsTwoViewController alloc]init];
        VC.fatherViewController = self;
        return VC;
    }else {
        MNGP_TrendsThreeViewController *VC = [[MNGP_TrendsThreeViewController alloc]init];
        VC.fatherViewController = self;
        return VC;
    }
}

#pragma mark - TYPagerControllerDelegate

- (void)pagerController:(TYPagerController *)pagerController transitionFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex animated:(BOOL)animated {
    [_tabBar scrollToItemFromIndex:fromIndex toIndex:toIndex animate:animated];
}

-(void)pagerController:(TYPagerController *)pagerController transitionFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex progress:(CGFloat)progress {
    [_tabBar scrollToItemFromIndex:fromIndex toIndex:toIndex progress:progress];
}

- (void)reloadData {
    [_tabBar reloadData];
    [_pagerController reloadData];
}



@end
