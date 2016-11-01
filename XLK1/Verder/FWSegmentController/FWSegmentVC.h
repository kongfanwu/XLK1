//
//  FWSegmentView.h
//  XLK1
//
//  Created by 孔凡伍 on 2016/10/31.
//  Copyright © 2016年 kongfanwu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FWSegmentVC : UIViewController 

/** 当前索引， */
@property (nonatomic) NSInteger currentIndex;

/** 索引切换后回调 */
@property (nonatomic, copy) void (^didSelectItemAtIndex)(FWSegmentVC *);

/** 自定义title view */
@property (nonatomic, strong) UIView *coustTitleView;

/** 切换动画。默认YES */
@property (nonatomic) BOOL changeAnimation;

- (void)setViewController;

@end

NS_ASSUME_NONNULL_END
