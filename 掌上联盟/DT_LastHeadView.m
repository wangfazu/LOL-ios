//
//  DT_LastHeadView.m
//  LOL
//
//  Created by mac on 17/8/22.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "DT_LastHeadView.h"

@implementation DT_LastHeadView
{
    int count;
}
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
        self.frame = CGRectMake(0, 0, APPWidth, APPWidth/3.6);
        //添加一个scrollView；
        [self addSubview:self.scrolV];
        //在scrollview上面添加五个按钮
        [self creatPicBtn];
        //设置开启定时器
        [self setTimeToScrol];
    }
    return self;
    
}

- (UIScrollView *)scrolV{
    if (!_scrolV) {
        _scrolV =[[UIScrollView alloc]initWithFrame:CGRectMake(0, 5, APPWidth, APPWidth/3.6)];
        _scrolV.backgroundColor =[UIColor clearColor];
        _scrolV.contentSize =CGSizeMake(APPWidth*5, 0);
        _scrolV.pagingEnabled =YES;
        _scrolV.showsHorizontalScrollIndicator = FALSE;
        
    }

    return _scrolV;
}

- (void)creatPicBtn{

        for (int i=0; i<5; i++) {
            _picBtn = [[UIButton alloc]init];
            _picBtn.frame =CGRectMake(APPWidth*i, 0, APPWidth, APPWidth/3.6);
            [_picBtn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i+1]] forState:UIControlStateNormal];
            [_scrolV addSubview:_picBtn];
        }

}
- (void)setTimeToScrol{


    [[NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(Click) userInfo:nil repeats:YES] fire];
    
}
-(void)Click{
    _scrolV.contentOffset =CGPointMake(APPWidth*count, 0);
    if (count<5) {
        count++;
        NSLog(@"%d",count);
        
    }
    if (count==5) {
        count=0;
        
    }
}

@end
