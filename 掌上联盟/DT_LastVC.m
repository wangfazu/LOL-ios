//
//  DT_LastVC.m
//  LOL
//
//  Created by mac on 17/8/21.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "DT_LastVC.h"

@interface DT_LastVC ()

@end

@implementation DT_LastVC
{
    NSMutableArray *dataMuArr;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self preferredStatusBarStyle];
    [self initDataSourse];
    [self.view addSubview:self.lastTV];
}

- (void)initDataSourse{
    
    dataMuArr = [[NSMutableArray alloc]init];
    [dataMuArr addObject:@"666"];
    [dataMuArr addObject:@"666"];
    [dataMuArr addObject:@"666"];
    
}
- (UITableView *)lastTV{
    if (!_lastTV) {
        _lastTV = [[UITableView alloc]initWithFrame:CGRectMake(10, 0, APPWidth -20, APPHeight -64 -49) style:UITableViewStylePlain];
        _lastTV.delegate = self;
        _lastTV.dataSource = self;
        _lastTV.tableHeaderView = [[DT_LastHeadView alloc]init];
        _lastTV.tableFooterView = [[DT_LastHeadView alloc]init];

    }
    
    //刷新tableview 增加数据 或者请求数据
    _lastTV.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        NSLog(@"调用了 表格 头刷新");
        
        for (int i =0; i<5; i ++) {
            [dataMuArr addObject:[NSString stringWithFormat:@"%d",i]];
            
        }
        [_lastTV.mj_header endRefreshing];
        [_lastTV reloadData];
    }];
    
    //刷新tableview 移除数据
    _lastTV.mj_footer=[MJRefreshAutoFooter footerWithRefreshingBlock:^{
        NSLog(@"调用了 表格 头刷新");
        
        for (int i =0; i<1; i ++) {
            [dataMuArr removeLastObject];
            
        }
        [_lastTV.mj_footer endRefreshing];
        [_lastTV reloadData];
    }];
    return _lastTV;
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return dataMuArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *ID;
    if ([tableView dequeueReusableCellWithIdentifier:ID]) {
        return APPHeight /7.5;
    }
    return APPHeight /7.5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *ID = @"baseCell";
    DT_BaseCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[DT_BaseCell new]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld1",indexPath.row];


    return cell;
}

#pragma mark - Navigation
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
