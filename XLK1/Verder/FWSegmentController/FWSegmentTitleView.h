//
//  FWSegmentTitleView.h
//  XLK1
//
//  Created by 孔凡伍 on 2016/11/1.
//  Copyright © 2016年 kongfanwu. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol FWSegmentTitleViewDelegate;

NS_ASSUME_NONNULL_BEGIN

@interface FWSegmentTitleView : UICollectionView

/** 数据源 */
@property (nonatomic, strong) NSArray *dataArray;

/** 索引切换后回调 */
@property (nonatomic, copy) void (^didSelectItemAtIndex)(FWSegmentTitleView *);

/** 代理 */
@property (nonatomic, weak) id <FWSegmentTitleViewDelegate> segDelegate;

/** 当前索引， */
@property (nonatomic) NSInteger currentIndex;

/** 正常颜色，选中颜色 */
@property (nonatomic, strong) UIColor *normalColor, *selectColor;

/** 禁止使用初始化方法 */
- (nullable instancetype)init UNAVAILABLE_ATTRIBUTE;
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(nonnull UICollectionViewLayout *)layout __attribute__((unavailable("方法不可用，请用initWithFrame:")));
+ (nullable instancetype)new __attribute__((unavailable("new方法不可用，请用initWithFrame:")));

@end

@protocol FWSegmentTitleViewDelegate <NSObject>

@optional

/**
 自定义cell

 @param segmentTitleView segmentTitleView
 @param indexPath        cell indexPath
 @param contentView      cell背景view
 */
- (void)segmentTitleView:(FWSegmentTitleView *)segmentTitleView
               cellIndexPath:(NSIndexPath *)indexPath
             cellContentView:(UIView *)contentView;


/**
 索引切换后回调

 @param segmentTitleView segmentTitleView
 */
- (void)didSelectItem:(FWSegmentTitleView *)segmentTitleView;

/*
 * 自定义相关方法
 */
- (CGSize)segmentTitleView:(UICollectionView *)segmentTitleView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;

- (UIEdgeInsets)segmentTitleView:(UICollectionView *)segmentTitleView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section;

- (CGFloat)segmentTitleView:(UICollectionView *)segmentTitleView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section;

- (CGFloat)segmentTitleView:(UICollectionView *)segmentTitleView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section;
@end

NS_ASSUME_NONNULL_END
