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
    [self preferredStatusBarStyle];//将状态栏，改变为白色
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - 自定义导航栏
-(void)setNavgationBarItemName:(NSString *)setString{
    _titleview= [[UIView alloc]initWithFrame:CGRectMake(0, 0, APPWidth, 64)];
    [self.view addSubview: _titleview];
    _titleview.backgroundColor = UIColorFromRGB(0x43d3a2);
    
    _lab  = [[UILabel alloc]initWithFrame:CGRectMake(APPWidth/2-100, 28, 200, 29)];
    _lab.textColor = [UIColor whiteColor];
    _lab.text = setString;
    _lab.textAlignment = NSTextAlignmentCenter;
    _lab.font=[UIFont systemFontOfSize:18];
    
    [_titleview addSubview:_lab];
}
#pragma mark - 自定义，导航栏上面返回的，button

- (void)setButtonForBackNavgation{
    _backBtn = [[UIButton alloc]initWithFrame:CGRectMake(12, 30, 13, 23)];
    [_backBtn addTarget:self action:@selector(backVCclick) forControlEvents:UIControlEventTouchUpInside];
    [_backBtn setBackgroundImage:[UIImage imageNamed:@"return"] forState:UIControlStateNormal];
    [_titleview addSubview:_backBtn];
    
}
- (void)backVCclick{
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
    [_titleview addSubview:rightBtnNav];
}


#pragma mark - 自定义状态栏的颜色为黑色，改变为白色

-(UIStatusBarStyle)preferredStatusBarStyle

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
