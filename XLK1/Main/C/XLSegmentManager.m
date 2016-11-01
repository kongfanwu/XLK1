//
//  XLSegmentManager.m
//  XLK1
//
//  Created by 孔凡伍 on 2016/10/31.
//  Copyright © 2016年 kongfanwu. All rights reserved.
//

#import "XLSegmentManager.h"
#import "XLVideoListVC.h"
#import "FWSegmentTitleView.h"
#import "Macrodefinition.h"

@interface XLSegmentManager () <FWSegmentTitleViewDelegate>

/** <##> */
@property (nonatomic, strong) FWSegmentTitleView *segmentTitleView;

@end

@implementation XLSegmentManager

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak typeof(self) _self = self;
    
    NSArray *dataArray = @[@"最新动态", @"点赞最多", @"评论最多"];
    self.segmentTitleView = [[FWSegmentTitleView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
    self.segmentTitleView.segDelegate = self;
    self.segmentTitleView.dataArray = dataArray;
    self.segmentTitleView.currentIndex = 1;
    self.segmentTitleView.normalColor = [UIColor blackColor];
    self.segmentTitleView.selectColor = [UIColor redColor];
    self.coustTitleView = self.segmentTitleView;
    [self.segmentTitleView setDidSelectItemAtIndex:^(FWSegmentTitleView *seg) {
        __strong typeof(_self) self = _self;
        self.currentIndex = seg.currentIndex;
    }];
    
    self.currentIndex = self.segmentTitleView.currentIndex;
    
    [self setDidSelectItemAtIndex:^(FWSegmentVC *vc) {
        __strong typeof(_self) self = _self;
        self.segmentTitleView.currentIndex = vc.currentIndex;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addChildController:(UIViewController *)vc
{
    [self willMoveToParentViewController:vc];
    [self addChildViewController:vc];
    [self didMoveToParentViewController:vc];
}


#pragma mark - 重写父类

- (void)setViewController
{
    XLVideoListVC *videoListVC = kStoryboardVC(@"XLVideoListVC", @"XLVideoListVC");
    XLVideoListVC *videoListVC2 = kStoryboardVC(@"XLVideoListVC", @"XLVideoListVC");
    XLVideoListVC *videoListVC3 = kStoryboardVC(@"XLVideoListVC", @"XLVideoListVC");
    [self addChildController:videoListVC];
    [self addChildController:videoListVC2];
    [self addChildController:videoListVC3];
}

#pragma mark - FWSegmentTitleViewDelegate
/* 自定义title 相关设置
- (void)segmentTitleView:(FWSegmentTitleView *)segmentTitleView
               cellIndexPath:(NSIndexPath *)indexPath
             cellContentView:(UIView *)contentView
{
    UILabel *titleLabel = [contentView viewWithTag:100];
    if (!titleLabel) {
        titleLabel = [[UILabel alloc] initWithFrame:contentView.bounds];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.tag = 100;
        titleLabel.textColor = [UIColor blackColor];
        [contentView addSubview:titleLabel];
    }
    if (indexPath.item == self.currentIndex) {
        titleLabel.textColor = [UIColor redColor];
    }
    titleLabel.text = segmentTitleView.dataArray[indexPath.item];
}

- (void)didSelectItem:(FWSegmentTitleView *)segmentTitleView
{
    [segmentTitleView.indexPathsForVisibleItems enumerateObjectsUsingBlock:^(NSIndexPath * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UICollectionViewCell *cell = [segmentTitleView cellForItemAtIndexPath:obj];
        UILabel *titleLabel = [cell.contentView viewWithTag:100];
        titleLabel.textColor = obj.item == segmentTitleView.currentIndex ? [UIColor redColor] : [UIColor blackColor];
    }];
}

- (UIEdgeInsets)segmentTitleView:(UICollectionView *)segmentTitleView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    CGFloat gap = (segmentTitleView.frame.size.width - 300) / 2.f;
    return UIEdgeInsetsMake(0, gap, 0, gap);
}

- (CGSize)segmentTitleView:(UICollectionView *)segmentTitleView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100, 44);
}
 */

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
