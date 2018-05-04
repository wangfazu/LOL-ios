//
//  mineHeadView.m
//  LOL
//
//  Created by 王发祖 on 2018/5/4.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "mineHeadView.h"

@implementation mineHeadView
- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self initDataSourse];
        self.frame = CGRectMake(0, 0, APPWidth, APPWidth* 0.3);
        //添加一个scrollView；
//        [self addSubview:self.scrolV];
//        self.backgroundColor = APPColor;
        
    }
    return self;
    
}
-(void)initDataSourse{
    UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(APPWidth/2 - 40, 22, 80, 20)];
    name.textColor = APPColor;
    name.text = @"班德尔城";
    name.textAlignment = NSTextAlignmentCenter;
    name.font = [UIFont systemFontOfSize:17];
    [self addSubview:name];
    
    UIButton *headBtn = [[UIButton alloc]initWithFrame:CGRectMake(APPWidth/2-40, name.marginY+10, 80, 80)];
    headBtn.layer.cornerRadius = 40;
    headBtn.clipsToBounds = YES;
    [headBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:@"http://ossweb-img.qq.com/images/lol/web201310/skin/big1000.jpg"] forState:UIControlStateNormal];
    [self addSubview:headBtn];
    
    UILabel *userName = [[UILabel alloc]initWithFrame:CGRectMake(APPWidth/2 -60, headBtn.marginY+5, 120, 20)];
    userName.text = @"很暴力的";
    userName.font = [UIFont systemFontOfSize:20 weight:2];
    userName.textColor = [UIColor blackColor];
    userName.textAlignment = NSTextAlignmentCenter;
    [self addSubview:userName];
    NSArray *arr    = [NSArray arrayWithObjects:@"战绩",@"能力",@"资产", nil];
    for (int i= 0; i<3; i++) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(APPWidth/3*i,userName.marginY+20, APPWidth/3, 70)];
        btn.tag = 100 +i;
        [btn setTitleColor:APPColor forState:UIControlStateNormal];
        [btn setTitle:arr[i] forState:UIControlStateNormal];
        [btn addTarget:self  action:@selector(selectClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
    }
    
    
}
- (void)selectClick:(UIButton *)btn{
    NSLog(@"%ld",btn.tag);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
