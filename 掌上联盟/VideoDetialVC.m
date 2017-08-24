//
//  VideoDetialVC.m
//  LOL
//
//  Created by mac on 17/8/23.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "VideoDetialVC.h"
#import "ZXVideoPlayerController.h"
#import "ZXVideo.h"
@interface VideoDetialVC ()

@end

@implementation VideoDetialVC

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self setNavgationBarItemName:@"迦纳王朝"];
    [self setButtonForBackNavgation];
    self.view.backgroundColor = [UIColor whiteColor];





}




- (void)LOLsetPictureForjiana{
    
    for (int i = 0; i<4; i++) {
        UIImageView *imaV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 20 + APPWidth*0.4*i, APPWidth,APPWidth*0.4)];
        [self.view addSubview:imaV];
        imaV.image = [UIImage imageNamed:@"jiana3"];
        
    }
    UIButton *btn =[[UIButton alloc]initWithFrame:CGRectMake(10, 20, 19, 28)];
    [btn setImage:[UIImage imageNamed:@"nav_btn_back_tiny_normal"] forState:UIControlStateNormal];
    [[[[UIApplication sharedApplication]delegate]window] addSubview:btn];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)btnClick:(UIButton *)btn{
    [btn removeFromSuperview];
    [self.navigationController popToRootViewControllerAnimated:YES];
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
