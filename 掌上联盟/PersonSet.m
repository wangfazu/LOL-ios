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
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //添加背景图片
    [self.view addSubview:[self bgView]];
    [self.view addSubview:self.headBtn];
    [self.view addSubview:self.myCardBtn];
    [self.view addSubview:self.aboutBtn];
    [self.view addSubview:self.actBtn];
    [self.view addSubview:self.orderBtn];
    [self.view addSubview:self.myLifeBtn];
    [self.view addSubview:self.myBookBtn];
    [self.view addSubview:self.myCollectionBtn];
    [self.view addSubview:self.setBtn];
    
    [self.view addSubview:self.nameLab];
    [self.view addSubview:self.myCardLab];
    [self.view addSubview:self.aboutLab];
    [self.view addSubview:self.actLab];
    [self.view addSubview:self.orderLab];
    [self.view addSubview:self.myLifeLab];
    [self.view addSubview:self.myBookLab];
    [self.view addSubview:self.myCollectionLab];
    [self.view addSubview:self.setLab];
   
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
        _headBtn.frame = CGRectMake(25, 50, 50, 45);
        _headBtn.backgroundColor= [UIColor redColor];
    }
    return _headBtn;
}

- (UIButton *)myCardBtn{
    if (!_myCardBtn) {
        
    }
    return _myCardBtn;
}

- (UIButton *)aboutBtn{
    if (!_aboutBtn) {
        
    }
    return _aboutBtn;
}
- (UIButton *)actBtn{
    if (!_actBtn) {
        
    }
    return _actBtn;
}

- (UIButton *)orderBtn{
    if (!_orderBtn) {
        
    }
    return _orderBtn;
}
- (UIButton *)myLifeBtn{
    if (!_myLifeBtn) {
        
    }
    return _myLifeBtn;
}
- (UIButton *)myBookBtn{
    if (!_myBookBtn) {
        
    }
    return _myBookBtn;
}
- (UIButton *)myCollectionBtn{
    if (!_myCollectionBtn) {
        
    }
    return _myCollectionBtn;
}
- (UIButton *)setBtn{
    if (!_setBtn) {
        
    }
    return _setBtn;
}

- (UILabel *)nameLab{
    if (!_nameLab) {
        
    }
    return _nameLab;
}

- (UILabel *)myCardLab{
    if (!_myCardLab) {
        
    }
    return _myCardLab;
}



- (UILabel *)aboutLab{
    if (!_aboutLab) {
        
    }
    return _aboutLab;
}
- (UILabel *)actLab{
    if (!_actLab) {
        
    }
    return _actLab;
}

- (UILabel *)orderLab{
    if (!_orderLab) {
        
    }
    return _orderLab;
}
- (UILabel *)myLifeLab{
    if (!_myLifeLab) {
        
    }
    return _myLifeLab;
}
- (UILabel *)myBookLab{
    if (!_myBookLab) {
        
    }
    return _myBookLab;
}
- (UILabel *)myCollectionLab{
    if (!_myCollectionLab) {
        
    }
    return _myCollectionLab;
}
- (UILabel *)setLab{
    if (!_setLab) {
        
    }
    return _setLab;
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
