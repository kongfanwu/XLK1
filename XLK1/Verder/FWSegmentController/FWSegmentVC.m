//
//  FWSegmentView.m
//  XLK1
//
//  Created by 孔凡伍 on 2016/10/31.
//  Copyright © 2016年 kongfanwu. All rights reserved.
//

#import "FWSegmentVC.h"
#import "Macrodefinition.h"

static NSString * const reuseIdentifier = @"Cell";

NS_ASSUME_NONNULL_BEGIN

@interface FWSegmentVC () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
/** <##> */
@property (nonatomic, strong) UIView *contentView;
/** <##> */
@property (nonatomic, strong) UICollectionView *collectionView;
/** <##> */
@property (nonatomic, copy) NSArray <UIViewController *> *controllers;
@end

@implementation FWSegmentVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.changeAnimation = YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self setViewController];
    
    [self.view addSubview:self.collectionView];
    
    [self getData];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:self.currentIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    CGFloat contentY = 0;
    if (isIphone) {
        contentY = self.navigationController ? 64 : CGRectGetHeight([UIApplication sharedApplication].statusBarFrame);
    } else {
        contentY =  CGRectGetHeight([UIApplication sharedApplication].statusBarFrame);
    }
    
    if (self.coustTitleView) {
        self.coustTitleView.frame = CGRectMake(0, contentY, self.coustTitleView.frame.size.width, self.coustTitleView.frame.size.height);
        
        contentY += self.coustTitleView.frame.size.height;
    }
    
    self.collectionView.frame = CGRectMake(0, contentY, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - contentY);
}

- (void)setCoustTitleView:(UIView *)coustTitleView
{
    _coustTitleView = coustTitleView;
    if (_coustTitleView) [self.view addSubview:_coustTitleView];
}

- (void)setCurrentIndex:(NSInteger)currentIndex
{
    _currentIndex = currentIndex;
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:self.currentIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:self.changeAnimation];
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.pagingEnabled = YES;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.bounces = NO;
        
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    }
    return _collectionView;
}

- (void)getData
{
    self.controllers = self.childViewControllers;
    [self.collectionView reloadData];
}

- (void)currentChange:(UIScrollView *)scrollView
{
    NSInteger index = floorf(scrollView.contentOffset.x / scrollView.frame.size.width);
    self.currentIndex = index;
    if (_didSelectItemAtIndex) _didSelectItemAtIndex(self);
}

#pragma mark - Public method

- (void)setViewController
{
    @throw [NSException exceptionWithName:@"FWSegmentVC init Controller error" reason:@"子类需要重写此方法 setViewController:" userInfo:nil];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.controllers.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    UIViewController *vc = self.controllers[indexPath.item];
    vc.view.frame = cell.contentView.bounds;
    vc.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    [cell.contentView addSubview:vc.view];
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // cell size 应该比collectionView size 小或等于。
    return CGSizeMake(collectionView.frame.size.width, collectionView.frame.size.height);
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (!decelerate) [self currentChange:scrollView];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self currentChange:scrollView];
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

NS_ASSUME_NONNULL_END
