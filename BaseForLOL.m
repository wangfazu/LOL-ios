//
//  BaseForLOL.m
//  掌上联盟
//
//  Created by mac on 17/8/18.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "BaseForLOL.h"

@interface BaseForLOL ()

@end

@implementation BaseForLOL
- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden = YES;

    [super viewWillAppear:animated];
    
    //设置导航条透明度
    self.navigationController.navigationBar.translucent = NO;//不透明
    [[[self.navigationController.navigationBar subviews] objectAtIndex:0] setAlpha:1];
    //图标颜色为黑色
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
    //导航栏背景颜色
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    //导航条下面的黑线
    self.navigationController.navigationBar.clipsToBounds = NO;
    
    //刷新状态栏背景颜色
    // [self setNeedsStatusBarAppearanceUpdate];
    
    //设置状态栏颜色
    [self setStatusBarBackgroundColor:[UIColor clearColor]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self MyPreferredStatusBarStyle];//将状态栏，改变为白色
    self.view.backgroundColor= [UIColor whiteColor];

    // Do any additional setup after loading the view.
}
//设置状态栏颜色
- (void)setStatusBarBackgroundColor:(UIColor *)color {
    
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    NSLog(@"statusBar.backgroundColor--->%@",statusBar.backgroundColor);
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;//白色
}

#pragma mark - 自定义导航栏
-(void)setNavgationBarItemName:(NSString *)setString{
    _titleImgV= [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, APPWidth, 64)];
    [self.view addSubview: _titleImgV];
    _titleImgV.backgroundColor = UIColorFromRGB(0x43d3a2);
    _titleImgV.image = [UIImage imageNamed:@"personal_info_share_back_ground"];
//    _titleImgV.userInteractionEnabled = YES;
//    _titleImgV.userinter
    _lab  = [[UILabel alloc]initWithFrame:CGRectMake(APPWidth/2-100, 28, 200, 29)];
    _lab.textColor = APPColor;
    _lab.text = setString;
    _lab.textAlignment = NSTextAlignmentCenter;
    _lab.font=[UIFont systemFontOfSize:18];
    
    [_titleImgV addSubview:_lab];
}
#pragma mark - 自定义，导航栏上面返回的，button

- (void)setButtonForBackNavgation{
    _backBtn = [[UIButton alloc]initWithFrame:CGRectMake(12, 30, 15, 22.1)];
    [_backBtn addTarget:self action:@selector(backCclick:) forControlEvents:UIControlEventTouchUpInside];
    [_backBtn setBackgroundImage:[UIImage imageNamed:@"nav_btn_back_tiny_normal"] forState:UIControlStateNormal];
    [_titleImgV addSubview:_backBtn];
    
}
- (void)backCclick:(UIButton *)btn{
    [self.navigationController popViewControllerAnimated:YES];
    
}


//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self.view endEditing:YES];
//}
#pragma mark - 添加手势，键盘消失
- (void)ViewKyebordDownTap{
    UITapGestureRecognizer *TapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(keyBordDownClick: )];
    TapGestureRecognizer.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:TapGestureRecognizer];
    
    
}
- (void)keyBordDownClick:(UITapGestureRecognizer *)tap{
    
    [self.view endEditing:YES];
}



#pragma mark - 在导航栏的右边添加一个按钮，做事件响应
- (void)setRightBtnForNavgationWithTitle:(NSString *)btnName btnImage:(NSString *)btnImageName{
    
    UIButton *rightBtnNav = [[UIButton alloc]initWithFrame:CGRectMake(APPWidth - 37, 30, 54/2, 45/2)];
    //    rightBtnNav.backgroundColor = [UIColor redColor];
    [rightBtnNav setBackgroundImage:[UIImage imageNamed:btnImageName] forState:UIControlStateNormal];
    [rightBtnNav addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_titleImgV addSubview:rightBtnNav];
}


#pragma mark - 自定义状态栏的颜色为黑色，改变为白色

-(UIStatusBarStyle)myPreferredStatusBarStyle

{
    
    
    return UIStatusBarStyleLightContent;  //默认的值是黑色的
    
}


- (void)rightBtnClick{
    //    if (block) {
    //        block([UIImage imageNamed:@"follow"]);
    //    }
    NSLog( @"you select this btn!");
}

- (void)setTabBarWithImgNomal:(NSString *)img1 imgSelected:(NSString *)img2 tabBarItem:(NSString *) item{
    
    //最下方Bar的图片
    //mainvc
    UIImage *imgNomal=[[UIImage imageNamed:img1] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *imgSelected=[[UIImage imageNamed:img2] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.tabBarItem = [[UITabBarItem alloc] initWithTitle:item image:imgNomal selectedImage:imgSelected];
    
}

- (void)LOLaddChildViewControler:(UIViewController *)ViewController MultipleWidth:(int)Multiple{
    [self addChildViewController:ViewController];
    [self.view addSubview:ViewController.view];
    ViewController.view.frame = CGRectMake(0, 64, APPWidth * Multiple, APPHeight);
    [ViewController didMoveToParentViewController:self];
}

- (void)LOLaddChildViewControler:(UIViewController *)ViewController MultipleHeigh:(int)Multiple{
    [self addChildViewController:ViewController];
    [self.view addSubview:ViewController.view];
    ViewController.view.frame = CGRectMake(0, 64, APPWidth , APPHeight* Multiple);
    [ViewController didMoveToParentViewController:self];
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
