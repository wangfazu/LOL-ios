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
    NSArray *jsonObject;

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
        [self initDataSourse];
        self.frame = CGRectMake(0, 0, APPWidth, APPWidth* 0.42);
        //添加一个scrollView；
        [self addSubview:self.scrolV];

    }
    return self;
    
}

- (UIScrollView *)scrolV{
    if (!_scrolV) {
        _scrolV =[[UIScrollView alloc]initWithFrame:CGRectMake(0, 5, APPWidth, APPWidth* 0.42)];
        _scrolV.backgroundColor =[UIColor clearColor];
        _scrolV.contentSize =CGSizeMake(APPWidth*4, 0);
        _scrolV.pagingEnabled =YES;
        _scrolV.showsHorizontalScrollIndicator = FALSE;
        
    }

    return _scrolV;
}

- (void)creatPicBtn{

        for (int i=0; i<4; i++) {
            _picBtn = [[UIButton alloc]init];
            _picBtn.frame =CGRectMake(APPWidth*i, 0, APPWidth -20, APPWidth * 0.42);
//            [_picBtn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i+1]] forState:UIControlStateNormal];
            _picBtn.layer.cornerRadius = 10;
            _picBtn.clipsToBounds = YES;
            [_picBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:[jsonObject[i] objectForKey:@"image_url_big"]] forState:UIControlStateNormal];
            [_scrolV addSubview:_picBtn];
        }

}
- (void)setTimeToScrol{


    [[NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(Click) userInfo:nil repeats:YES] fire];
    
}
-(void)Click{
    _scrolV.contentOffset =CGPointMake(APPWidth*count, 0);
    if (count<4) {
        count++;
        NSLog(@"%d",count);
        
    }
    if (count==4) {
        count=0;
        
    }
}

- (void)initDataSourse{
    
    NSString *urlString = @"http://qt.qq.com/php_cgi/news/php/varcache_getnews.php?id=13&page=0&plat=android&version=9750";
    /**
     *  对网址转码
     *
     *  @param NSString 。
     *   转换完毕后在发送网络请求
     *  @return 。
     */
    [[MyHttpRequesr alloc]getHttpRequest:urlString key:@"diyige"];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getJsonObjectForNetWork3:) name:@"diyige" object:nil];
    
}

- (void)getJsonObjectForNetWork3:(NSNotification *)notification{
    NSLog(@"%@",notification.userInfo[@"list"]);
    jsonObject = notification.userInfo[@"list"];
//    [self initUI];
    //在scrollview上面添加五个按钮
    [self creatPicBtn];
    //设置开启定时器
    [self setTimeToScrol];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    
    //    [mytableView reloadData];
    
}

@end
