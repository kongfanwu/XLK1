//
//  XLLoginViewController.m
//  XLK1
//
//  Created by 孔凡伍 on 2016/10/27.
//  Copyright © 2016年 kongfanwu. All rights reserved.
//

#import "XLLoginViewController.h"

@interface XLLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameTextFiled;
@property (weak, nonatomic) IBOutlet UITextField *PasswordTextFiled;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;


@end

@implementation XLLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)loginClick:(UIButton *)sender {
    [self.view endEditing:YES];
    if (_loginSuccess) _loginSuccess(self);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
