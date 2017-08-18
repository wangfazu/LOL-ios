//
//  LoginVC.m
//  LOL
//
//  Created by mac on 17/8/18.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "LoginVC.h"

@interface LoginVC ()
@property (nonatomic, strong) LLGifView *gifView;
@property (nonatomic, strong) LLGifImageView *gifImageView;
@end

@implementation LoginVC
{
    UIImageView *backImgView;
    UIButton *loginBtn;
    NSArray *vcArr;
    NSArray *img1Arr;
    NSArray *img2Arr;
    NSArray *tabItemArr;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //添加背景图片，和登录的按钮；
    [self.view addSubview:[self backImgView]];
    [self.view addSubview:[self loginBtn]];


}

- (UIImageView *)backImgView{
    if (!backImgView) {
        backImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, APPWidth, APPHeight)];
        backImgView.image = [UIImage imageNamed:@"login_bkg"];
    }
    return  backImgView;
}

- (UIButton *)loginBtn{
    if (!loginBtn) {
        //方法2:适用于帧数多的gif动画，在这个背景上面添加 登录 按钮
        NSData *localData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"login_quick_btn_normal" ofType:@"gif"]];
        _gifImageView = [[LLGifImageView alloc] initWithFrame:CGRectMake(70, APPHeight - 86-40, APPWidth -140, 40) data:localData];
        [self.view addSubview:_gifImageView];
        [_gifImageView startGif];
        
        loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        loginBtn.frame = CGRectMake(70, APPHeight - 86-40, APPWidth -140, 40);
        [loginBtn addTarget:self action:@selector(enterMianClick:) forControlEvents:UIControlEventTouchUpInside];
        [loginBtn setTitle:@"QQ登录" forState:UIControlStateNormal];
        [loginBtn setTitleColor:UIColorFromRGB(0xf5d387) forState:UIControlStateNormal];
        

    }
    return loginBtn;
}
- (void)enterMianClick:(UIButton *)Btn{
    
    [Btn setImage:[UIImage imageNamed:@"login_quick_btn_press"] forState:UIControlStateHighlighted];
    [Btn setTitle:@"QQ登录" forState:UIControlStateHighlighted];
    
    [self setUpMainView];
}
- (void)setUpMainView{
    //进入主界面，先验证，再进入
    UITabBarController *tabBar = [[UITabBarController alloc]init];
    
    MessageVC *mesVc = [[MessageVC alloc]init];;
    FrendsVC *frendsVc = [[FrendsVC alloc]init];;
    [frendsVc setTabBarWithImgNomal:@"tab_icon_friend_normal" imgSelected:@"tab_icon_friend_press" tabBarItem:@"朋友"];
    ShopVC *shopVc = [[ShopVC alloc]init];
    FindVC *findVc = [FindVC new];
    MineVC *mineVc = [MineVC new];
    
    vcArr = [[NSArray alloc]initWithObjects:@"mesVc",@"frendsVc",@"shopVc",@"findVc",@"findVc",@"mineVc", nil];
    img1Arr = [[NSArray alloc]initWithObjects:@"",@"",@"",@"",@"",@"", nil];
    img2Arr = [[NSArray alloc]initWithObjects:@"",@"",@"",@"",@"",@"", nil];
    tabItemArr = [[NSArray alloc]initWithObjects:@"",@"",@"",@"",@"",@"", nil];
    //加载tabbar 上的选择图片
    for (int i = 0; i<5; i++) {
        [vcArr[i] setTabBarWithImgNomal:img1Arr[i] imgSelected:img2Arr[i] tabBarItem:tabItemArr[i]];
    }

    UINavigationController *mesNav = [[UINavigationController alloc]initWithRootViewController:mesVc];
    UINavigationController *frendNav = [[UINavigationController alloc]initWithRootViewController:frendsVc];
    UINavigationController *shopNav = [[UINavigationController alloc]initWithRootViewController:shopVc];
    UINavigationController *findNav = [[UINavigationController alloc]initWithRootViewController:findVc];
    UINavigationController *mineNav = [[UINavigationController alloc]initWithRootViewController:mineVc];
    
    [tabBar addChildViewController:mesNav];
    [tabBar addChildViewController:frendNav];
    [tabBar addChildViewController:shopNav];
    [tabBar addChildViewController:findNav];
    [tabBar addChildViewController:mineNav];
    
    [[[UIApplication sharedApplication]delegate]window].rootViewController =tabBar;
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
