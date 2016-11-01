//
//  XLViewController.m
//  XLoongGlass
//
//  Created by 孔凡伍 on 16/5/6.
//  Copyright © 2016年 kongfanwu. All rights reserved.
//

#import "XLViewController.h"

@interface XLViewController () 

@end

@implementation XLViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.hideLoading = YES;
    }
    return self;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - 重写父类

////支持旋转
//-(BOOL)shouldAutorotate{
//    return YES;
//}
//
////支持的方向
//- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
//    return UIInterfaceOrientationMaskLandscape;
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
