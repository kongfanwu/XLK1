//
//  XLLoginViewController.h
//  XLK1
//
//  Created by 孔凡伍 on 2016/10/27.
//  Copyright © 2016年 kongfanwu. All rights reserved.
//

#import "XLViewController.h"

@interface XLLoginViewController : XLViewController

/** <##> */
@property (nonatomic, copy) void (^loginSuccess)(XLLoginViewController *);

@end
