//
//  PersonSet.m
//  LOL
//
//  Created by mac on 17/8/21.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "PersonSet.h"

@interface PersonSet ()

@end

@implementation PersonSet
{
    UIImageView *bgImgV ;
    UIButton *btn,*undBtn;
    UILabel *myLab,*undLab;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //添加背景图片
    [self.view addSubview:[self bgView]];
    [self.view addSubview:self.headBtn];
    [self.view addSubview:self.nameLab];
    [self.view addSubview:self.myCardBtn];
    [self.view addSubview:self.myCardLab];
    [self.view addSubview:self.underLine];

    [self setUPBtnAndLabForOrder];
    [self.view addSubview:self.setBtn];
    [self.view addSubview:self.setLab];
    [self fzTouchEvent];
   
}

- (UIView *)bgView{
    if (!bgImgV) {
        bgImgV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, APPWidth, APPHeight)];
        bgImgV.image = [UIImage imageNamed:@"twoDimension_view_background" ];
    }
    return bgImgV;
    
}

- (UIButton *)headBtn{
    if (!_headBtn) {
        _headBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _headBtn.frame = CGRectMake(25, 50, 50, 50);
        _headBtn.backgroundColor= [UIColor whiteColor];
        _headBtn.layer.cornerRadius = 25;
        _headBtn.clipsToBounds = YES;
    }
    return _headBtn;
}

- (UILabel *)nameLab{
    if (!_nameLab) {
        _nameLab = [[UILabel alloc]initWithFrame:CGRectMake(15, _headBtn.marginY+17, 70, 17)];
        _nameLab.text = @"无尽之人";
        _nameLab.textColor = [UIColor whiteColor];
    }
    return _nameLab;
}
- (UIButton *)myCardBtn{
    if (!_myCardBtn) {
        _myCardBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _myCardBtn.frame = CGRectMake(_headBtn.marginX+150, _headBtn.orginY, 35, 25);
        [_myCardBtn setImage:[UIImage imageNamed:@"cardBtn"] forState:UIControlStateNormal];
        _myCardBtn.backgroundColor = [UIColor grayColor];
        
    }
    return _myCardBtn;
}

- (UILabel *)myCardLab{
    if (!_myCardLab) {
        _myCardLab = [[UILabel alloc]initWithFrame:CGRectMake(_myCardBtn.orginX-6, _myCardBtn.marginY+10, 50, 15)];
        _myCardLab.text = @"我的卡片";
        _myCardLab.font= [UIFont systemFontOfSize:12];
        _myCardLab.textColor = [UIColor grayColor];
    }
    return _myCardLab;
    
}

- (void)setUPBtnAndLabForOrder{
    for (int i=0; i<3; i++) {
        /* i-> 与我相关 活动中心 我的订单*/
        btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(48+(22+60)*(i%3), _nameLab.marginY+66, 22, 16);
        btn.backgroundColor = [UIColor grayColor];
        btn.tag = 100+i;
        [self.view addSubview:btn];
        
        myLab = [[UILabel alloc]init];
        myLab.frame = CGRectMake(22.5+(65+22.5)*(i%3), btn.marginY+14, 70, 16);
        
        myLab.text = [[NSArray alloc]initWithObjects:@"与我相关",@"活动中心",@"我的订单", nil][i];
        myLab.textColor = [UIColor grayColor];
        [self.view addSubview:myLab];
        
        /* i-> 我的动态 我的订阅 我的收藏*/
        undBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        undBtn.frame = CGRectMake(22.5, _underLine.marginY+32+(26+32)*i, 26, 26);
        undBtn.backgroundColor = [UIColor whiteColor];
        undBtn.tag =200+i;
        [self.view addSubview:undBtn];
        
        undLab = [[UILabel alloc]init];
        undLab.frame = CGRectMake(undBtn.marginX+22, _underLine.marginY+32+(26+32)*i, 70, 20);
        undLab.text = [[NSArray alloc]initWithObjects:@"我的动态",@"我的订阅",@"我的收藏", nil][i];
        undLab.textColor = [UIColor grayColor];
        [self.view addSubview:undLab];
    }
}

- (UILabel *)underLine{
    if (!_underLine) {
        _underLine = [[UILabel alloc]initWithFrame:CGRectMake(0, APPHeight *0.43, APPWidth, 1)];
        _underLine.backgroundColor =[UIColor grayColor];
    }
    return _underLine;
}

- (UIButton *)setBtn{
    if (!_setBtn) {
        _setBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _setBtn.frame = CGRectMake(24, undBtn.marginY+150, 26, 26);
        _setBtn.backgroundColor = [UIColor grayColor];
    }
    return _setBtn;
}


- (UILabel *)setLab{
    if (!_setLab) {
        _setLab = [UILabel new];
        _setLab.frame = CGRectMake(_setBtn.marginX+10, undBtn.marginY+150, 35, 24);
        _setLab.text = @"设置";
        _setLab.font = [UIFont systemFontOfSize:12];
        _setLab.textColor = [UIColor grayColor];
    }
    return _setLab;
}

#pragma mark - 点击事件
- (void)fzTouchEvent{
    /*设置按钮的点击事件，进入设置页面*/
    [_setBtn addTarget:self action:@selector(yourSelfSetClick) forControlEvents:UIControlEventTouchUpInside];
    
    
}

- (void)yourSelfSetClick{
    NSLog(@"go to new world!");
//    [self.navigationController pushViewController:[yourSelfVC new] animated:YES];
    [self presentViewController:[yourSelfVC new] animated:YES completion:nil];
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
