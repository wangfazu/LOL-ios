//
//  Find_headview.m
//  LOL
//
//  Created by 王发祖 on 2018/5/5.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "Find_headview.h"

@implementation Find_headview

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self initDataSourse];
        self.frame = CGRectMake(0, 0, APPWidth, APPWidth* 0.56);
        //添加一个scrollView；
        //        [self addSubview:self.scrolV];
        //        self.backgroundColor = APPColor;
        
    }
    return self;
    
}
-(void)initDataSourse{

    UIButton *headBtn = [[UIButton alloc]initWithFrame:CGRectMake(10,0, APPWidth-20, APPWidth*0.56)];
    headBtn.layer.cornerRadius = 10;
    headBtn.clipsToBounds = YES;
    [headBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:@"http://ossweb-img.qq.com/images/lol/web201310/skin/big1000.jpg"] forState:UIControlStateNormal];
    [self addSubview:headBtn];
}
@end
