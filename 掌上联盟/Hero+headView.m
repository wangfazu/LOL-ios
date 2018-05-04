//
//  Hero+headView.m
//  LOL
//
//  Created by 王发祖 on 2018/5/4.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "Hero+headView.h"

@implementation Hero_headView
{
    UILabel *lineLab;
    
}
- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self initDataSourse];
        self.userInteractionEnabled = YES;
        self.frame = CGRectMake(0, 0, APPWidth, APPWidth* 0.42);
        //添加一个scrollView；
//        [self addSubview:self.scrolV];
        
    }
    return self;
    
}
- (void)initDataSourse{
    NSArray *tArr = [[NSArray alloc]initWithObjects:@"全部英雄",@"新符文",@"物品",@"资料",@"LOL宇宙", nil];
    for (int i =0; i<4; i++) {
        CGFloat btnX =  20 + APPWidth/4*i;
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(btnX, 20, APPWidth/8, APPWidth/8)];
        [btn setBackgroundColor:RandomColor];
        btn.layer.cornerRadius = 10;
        btn.clipsToBounds = YES;
        [btn addTarget:self action:@selector(clickToOther:) forControlEvents:UIControlEventTouchUpOutside];
        [self addSubview:btn];
        //        NSLog(@"%F",btnX);
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(btnX, btn.marginY + 10, APPWidth/7, APPWidth/7)];
        lab.textColor = APPColor;
        lab.text = tArr[i];
        lab.font =  [UIFont systemFontOfSize:13];
        lab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:lab];
        
        lineLab = [[UILabel alloc]initWithFrame:CGRectMake(0, lab.marginY+5, APPWidth, 5)];
        lineLab.backgroundColor = UIColorFromRGB(0xededed);
        
        [self addSubview:lineLab];
    }
}
-(void)clickToOther:(UIButton *)btn{
    NSLog(@"dianjile%ld",(long)btn.tag);
    [btn setBackgroundColor:APPColor];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
