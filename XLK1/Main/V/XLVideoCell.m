//
//  XLVideoCell.m
//  XLK1
//
//  Created by 孔凡伍 on 2016/10/31.
//  Copyright © 2016年 kongfanwu. All rights reserved.
//

#import "XLVideoCell.h"
#import "Macrodefinition.h"

@interface XLVideoCell ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageViewWidthConstraint;

@end

@implementation XLVideoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.imageViewWidthConstraint.constant = (SCREEN_WIDTH / 2.f - 20) / 3.f * 2;
}

@end
