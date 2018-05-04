//
//  FindVC.m
//  LOL
//
//  Created by mac on 17/8/18.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "FindVC.h"
#import "findCell.h"
#import "Find_headview.h"
#import "FindDescViewController.h"
@interface FindVC ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,retain) UITableView *lastTV;
@end

@implementation FindVC
{
    NSArray *arry;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

}


- (void)viewDidLoad {
    [super viewDidLoad];
        arry = [NSArray arrayWithObjects:@"最新电竞资讯",@"比赛", @"对战成绩",@"游戏解说",@"战队信息",@"英雄资料",@"召唤师查询",@"附近玩家",@"LOL宇宙",@"对战助手",@"附近网吧特权",@"游戏资料",@"英雄时刻",@"壁纸",@"粉丝俱乐部",nil];
    [self.view addSubview:self.lastTV];
}

- (UITableView *)lastTV{
    if (!_lastTV) {
        _lastTV = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, APPWidth , APPHeight) style:UITableViewStylePlain];
        _lastTV.delegate = self;
        _lastTV.dataSource = self;
        _lastTV.tableHeaderView = [[Find_headview alloc]init];
    }
    return _lastTV;
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return arry.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSString *ID;
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    //    UITableViewCell *
    //最新电竞资讯，其中包含比赛、对战成绩、游戏解说、战队信息、英雄资料、召唤师查询、附近玩家、LOL宇宙、对战助手、附近网吧特权、游戏资料、英雄时刻、壁纸、粉丝俱乐部

    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        UILabel *modelLab = [[UILabel alloc]initWithFrame:CGRectMake(80 +10, 15, 150, 30)];
        modelLab.textColor = APPColor;
        modelLab.text = @"排位模式";
        modelLab.tag = 1001;
        modelLab.font = [UIFont systemFontOfSize:20 weight:2];
        [cell addSubview:modelLab];
    }
    UILabel *name = [cell viewWithTag:1001];
    name.text = arry[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    FindDescViewController *vc = [FindDescViewController new];
    vc.nameStr = arry[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
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
