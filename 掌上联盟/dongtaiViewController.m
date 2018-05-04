//
//  dongtaiViewController.m
//  LOL
//
//  Created by 王发祖 on 2018/5/4.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "dongtaiViewController.h"

@interface dongtaiViewController ()

@end

@implementation dongtaiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavgationBarItemName:@"我的动态"];
    UIButton *backBtn;
    backBtn = [[UIButton alloc]initWithFrame:CGRectMake(12, 30, 15, 22.1)];
    [backBtn addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"nav_btn_back_tiny_normal"] forState:UIControlStateNormal];
    [self.titleImgV addSubview:backBtn];
    self.titleImgV.userInteractionEnabled = YES;
    [self.view addSubview:self.dongtaiTV];
}
- (UITableView *)dongtaiTV{
    if (!_dongtaiTV) {
        _dongtaiTV = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, APPWidth , APPHeight -64) style:UITableViewStylePlain];
        _dongtaiTV.delegate = self;
        _dongtaiTV.dataSource = self;
        //        _lastTV.tableHeaderView = [[DT_LastHeadView alloc]init];
        //        _videoTV.tableHeaderView = [[Hero_headView alloc]init];
        
    }
    
    return _dongtaiTV;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    //    return 2;
    //    //    return 1;
    
//    switch (section) {
//        case 0:
//            return 1;
//            break;
//        case 1:
//            return 1;
//            break;
//
//        default:
//            return 10;
//            break;
//    }
    return 138;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    switch (indexPath.section) {
//        case 0:
//            if (indexPath.row ==0) {
//                return APPWidth *0.35;
//            }else
//                return APPHeight /7.5;//BaseCell
//            break;
//        case 1:
//            //                if (indexPath.row ==0) {
//            return APPWidth/2.5*0.75+5;//BaseCell
//
//
//            break;
//        default:
//            return APPHeight /7.5;//BaseCell
//            break;
//    }
    
    return APPWidth *0.57+20+10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
   
    //    UITableViewCell *
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, APPWidth-10, 30)];
        lab.text = @"你最近在玩的是这个英雄！";
        lab.textColor = APPColor;
        [cell addSubview:lab];
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(5, lab.marginY, APPWidth -10, (APPWidth-10)*0.56)];
//        [btn setImage:[UIImage imageNamed:@"huifang"] forState:UIControlStateNormal];
        btn.layer.cornerRadius = 10;
        btn.clipsToBounds = YES;
        btn.tag = 300;
        [cell addSubview:btn];
    }
    UIButton *btn = [cell viewWithTag:300];
//    if (indexPath.row == 2) {
//        [btn setTitle:@"dongtaiTV" forState:UIControlStateNormal];
        
//        btn.backgroundColor = APPColor;
//        [btn sd_setImageWithURL:[NSURL URLWithString:@"http://ossweb-img.qq.com/images/lol/web201310/skin/big80000.jpg"] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"placeholder"]];
        NSString *urlStr = [NSString stringWithFormat:@"http://ossweb-img.qq.com/images/lol/web201310/skin/big%ld000.jpg",indexPath.row +1];
        [btn sd_setBackgroundImageWithURL:[NSURL URLWithString:urlStr] forState:UIControlStateNormal];
    
    


    return cell;
    
    
    
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return @"最近在玩：";
            break;
        case 1:
            return  @"今日赛事";
        default:
            return @"过去赛事";
            
            
    }
}
- (void)backClick{
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)initNetWork{
    
    NSString *urlString = @"http://qt.qq.com/php_cgi/news/php/varcache_getnews.php?id=12&page=0&plat=android&version=9750";
    /**
     *  对网址转码
     *
     *  @param NSString 。
     *   转换完毕后在发送网络请求
     *  @return 。
     */
    [[MyHttpRequesr alloc]getHttpRequest:urlString key:@"dongtai"];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getJsonObjectForNetWork5:) name:@"dongtai" object:nil];
    
}

- (void)getJsonObjectForNetWork5:(NSNotification *)notification{
    NSLog(@"%@",notification.userInfo[@"list"]);
    _jsonObject = notification.userInfo[@"list"];
    //在这里初始化界面
    [self.view addSubview:self.dongtaiTV];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    
    //    [mytableView reloadData];
    
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
