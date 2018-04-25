//
//  yourSelfVC.m
//  LOL
//
//  Created by mac on 17/8/31.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "yourSelfVC.h"

@interface yourSelfVC ()

@end


@implementation yourSelfVC
{
    UIButton *mmbackBtn;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    [self setNavgationBarItemName:@"设置"];
//    [self setButtonForBackNavgation];
    mmbackBtn = [[UIButton alloc]initWithFrame:CGRectMake(12, 30, 15, 22.1)];
    [mmbackBtn addTarget:self action:@selector(backClickxx) forControlEvents:UIControlEventTouchUpInside];
    [mmbackBtn setBackgroundImage:[UIImage imageNamed:@"nav_btn_back_tiny_normal"] forState:UIControlStateNormal];
//    [self.titleImgV isUserInteractionEnabled] = true;
    [self.titleImgV setUserInteractionEnabled:YES];
    [self.titleImgV addSubview:mmbackBtn];
//    [self setBackBtn:]
}

- (void)backClickxx{
    NSLog(@"new?");
    [self dismissViewControllerAnimated:YES completion:^{

    }];
}
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self dismissViewControllerAnimated:YES completion:^{
//
//    }];
//}
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
