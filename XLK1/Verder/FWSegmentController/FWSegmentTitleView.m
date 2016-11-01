//
//  FWSegmentTitleView.m
//  XLK1
//
//  Created by 孔凡伍 on 2016/11/1.
//  Copyright © 2016年 kongfanwu. All rights reserved.
//

#import "FWSegmentTitleView.h"

static NSString * const reuseIdentifier = @"Cell";

NS_ASSUME_NONNULL_BEGIN
@interface FWSegmentTitleView () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@end

@implementation FWSegmentTitleView

- (instancetype)initWithFrame:(CGRect)frame
{
    self.backgroundColor = [UIColor whiteColor];
    
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        
        [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    }
    return self;
}

- (void)setCurrentIndex:(NSInteger)currentIndex
{
    _currentIndex = currentIndex;
    if (![self.segDelegate respondsToSelector:@selector(segmentTitleView:cellIndexPath:cellContentView:)]) {
        [self.indexPathsForVisibleItems enumerateObjectsUsingBlock:^(NSIndexPath * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UICollectionViewCell *cell = [self cellForItemAtIndexPath:obj];
            UILabel *titleLabel = [cell.contentView viewWithTag:100];
            titleLabel.textColor = obj.item == _currentIndex ? self.selectColor : self.normalColor;
        }];
    }
    
    if ([self.segDelegate respondsToSelector:@selector(didSelectItem:)]) {
        [self.segDelegate didSelectItem:self];
    }
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    if ([self.segDelegate respondsToSelector:@selector(segmentTitleView:cellIndexPath:cellContentView:)]) {
        [self.segDelegate segmentTitleView:self cellIndexPath:indexPath cellContentView:cell.contentView];
    } else {
        UILabel *titleLabel = [cell.contentView viewWithTag:100];
        if (!titleLabel) {
            titleLabel = [[UILabel alloc] initWithFrame:cell.contentView.bounds];
            titleLabel.textAlignment = NSTextAlignmentCenter;
            titleLabel.tag = 100;
            titleLabel.textColor = self.normalColor;
            [cell.contentView addSubview:titleLabel];
        }
        if (indexPath.item == self.currentIndex) {
            titleLabel.textColor = self.selectColor;
        }
        titleLabel.text = self.dataArray[indexPath.item];
    }
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // cell size 应该比collectionView size 小或等于。
    if ([self.segDelegate respondsToSelector:@selector(segmentTitleView:layout:sizeForItemAtIndexPath:)]) {
        return [self.segDelegate segmentTitleView:collectionView layout:collectionViewLayout sizeForItemAtIndexPath:indexPath];
    }
    return CGSizeMake(collectionView.frame.size.width / self.dataArray.count, collectionView.frame.size.height);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if ([self.segDelegate respondsToSelector:@selector(segmentTitleView:layout:insetForSectionAtIndex:)]) {
        return [self.segDelegate segmentTitleView:collectionView layout:collectionViewLayout insetForSectionAtIndex:section];
    }
    return UIEdgeInsetsZero;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    if ([self.segDelegate respondsToSelector:@selector(segmentTitleView:layout:minimumLineSpacingForSectionAtIndex:)]) {
        return [self.segDelegate segmentTitleView:collectionView layout:collectionViewLayout minimumLineSpacingForSectionAtIndex:section];
    }
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    if ([self.segDelegate respondsToSelector:@selector(segmentTitleView:layout:minimumInteritemSpacingForSectionAtIndex:)]) {
        return [self.segDelegate segmentTitleView:collectionView layout:collectionViewLayout minimumInteritemSpacingForSectionAtIndex:section];
    }
    return 0;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.currentIndex = indexPath.item;
    
    if (_didSelectItemAtIndex) _didSelectItemAtIndex(self);
    
    if ([self.segDelegate respondsToSelector:@selector(didSelectItem:)]) {
        [self.segDelegate didSelectItem:self];
    }
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
