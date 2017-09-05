//
//  MessageVC.m
//  掌上联盟
//
//  Created by mac on 17/8/18.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "MessageVC.h"

@interface MessageVC ()

@end

@implementation MessageVC
{
    
    UIScrollView *titleSrc, *mainScrV;
    UIImageView *tab_selectedV;
    UIButton *titleBtn;
    
    NSArray *titleArr;
    NSInteger  aint;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self preferredStatusBarStyle];
    [self  setNavgationBarItemName:@"英雄联盟"];
    mainScrV.backgroundColor = [UIColor whiteColor];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self InitNetWork];
    
    [self.view addSubview:[self titleScr]];
    /* 创建一个ScrolView，放置多个视图：最新,新版本,英雄圈,视频,赛事,专栏 */
    [self.view addSubview:[self mainScrV]];
    
    /* 添加管理六个页面的按钮*/
    [self addtitleBtnAndTabSelect];
    
    /* 为 mainscrol 添加六个视图，便于管理 */
    [self mainSCrolViewAddViewcontrol:[DT_LastVC new] MultipleWidth:0];
    [self mainSCrolViewAddViewcontrol:[DT_NewVersionVC new] MultipleWidth:1];
    [self mainSCrolViewAddViewcontrol:[DT_HeroVC new] MultipleWidth:2];
    [self mainSCrolViewAddViewcontrol:[DT_VideoVC new] MultipleWidth:3];
    [self mainSCrolViewAddViewcontrol:[DT_GameVC new] MultipleWidth:4];
    [self mainSCrolViewAddViewcontrol:[DT_ColumnVC new] MultipleWidth:5];

}

- (void)InitNetWork{
    titleArr = [[NSArray alloc]initWithObjects:@"最 新",@"新版本",@"英雄圈",@"视频",@"赛事",@"专栏", nil];
    
}


- (UIScrollView *)titleScr{
    if (!titleSrc) {
        titleSrc = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, APPWidth, 45)];
        titleSrc.delegate = self ;
        titleSrc.contentSize = CGSizeMake(100+ APPWidth, 0);
        titleSrc.backgroundColor = [UIColor whiteColor];
        titleSrc.showsHorizontalScrollIndicator = FALSE;
    }
    return titleSrc;
}
- (UIScrollView *)mainScrV{
    if (!mainScrV) {
        mainScrV = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64 +45, APPWidth, APPHeight)];
        mainScrV.delegate = self;
        mainScrV.contentSize = CGSizeMake(6*APPWidth, 0);
        /**
         *  时scroll不在自由移动，会根据导航偏移
         */
        self.automaticallyAdjustsScrollViewInsets = NO;
        

        //添加SCROLLview的滑动标记，检测当前滑动的位置
        for (int i = 0; i<6; i++) {
            UIButton *btttn = [[UIButton alloc]initWithFrame:CGRectMake(14+APPWidth*i, APPHeight-200, APPHeight/10, APPHeight/10)];
            btttn.backgroundColor = [UIColor greenColor];
            btttn.tag=100+i;
            [btttn setTitle:[NSString stringWithFormat:@"%d",i] forState:normal];
            [mainScrV addSubview:btttn];
        }
    }
    return mainScrV;
}

- (void)addtitleBtnAndTabSelect{
    for (int i= 0; i<6; i++) {
        titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        titleBtn.frame = CGRectMake(15+ (10+APPWidth/6)*i, 0, 40, 45);
        [titleBtn setTitle:titleArr[i] forState:UIControlStateNormal];
        [titleBtn setTitleColor:APPColor forState:UIControlStateNormal];
        titleBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        titleBtn.tag = 100 +i;
        [titleBtn addTarget:self action:@selector(tab_selectClick:) forControlEvents:    UIControlEventTouchUpInside ];
        [titleSrc addSubview:titleBtn];
        
        if (!tab_selectedV) {
            tab_selectedV = [[UIImageView alloc]init];

        }
            tab_selectedV.frame = CGRectMake(15, titleBtn.marginY -10, 40, 8);
        tab_selectedV.image = [UIImage imageNamed:@"tab_selected"];
        [titleSrc addSubview:tab_selectedV];

    }
}

- (void)tab_selectClick:(UIButton *)btn{
    aint = btn.tag - 100;
    tab_selectedV.frame = CGRectMake(15+ (10+APPWidth/6) *aint, titleBtn.marginY -10, 40, 8);
     mainScrV.contentOffset = CGPointMake(APPWidth*aint, 0);
}

- (void)mainSCrolViewAddViewcontrol:(UIViewController *)viewControl MultipleWidth: (int)multiple{
    viewControl.view.frame = CGRectMake(APPWidth *  multiple, 0, APPWidth, APPHeight-64-49);
    [self addChildViewController:viewControl];
    [mainScrV addSubview:viewControl.view];
    [viewControl didMoveToParentViewController:self];

    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"%f",mainScrV.contentOffset.x);
//    tab_selectedV.frame = CGRectMake(15+ APPWidth/mainScrV.contentOffset.x, titleBtn.marginY -10, 40, 8);

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
