//
//  FindDescViewController.m
//  LOL
//
//  Created by 王发祖 on 2018/5/5.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "FindDescViewController.h"

@interface FindDescViewController ()

@end

@implementation FindDescViewController
{
    UIButton *backBBtn;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavgationBarItemName:_nameStr];
//    [self setButtonForBackNavgation];
    backBBtn = [[UIButton alloc]initWithFrame:CGRectMake(12, 30, 15, 22.1)];
    [backBBtn addTarget:self action:@selector(backCclick) forControlEvents:UIControlEventTouchUpInside];
    [backBBtn setBackgroundImage:[UIImage imageNamed:@"nav_btn_back_tiny_normal"] forState:UIControlStateNormal];
    [self.titleImgV addSubview:backBBtn];
    // Do any additional setup after loading the view.
}
- (void)backCclick{
    [self popoverPresentationController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
