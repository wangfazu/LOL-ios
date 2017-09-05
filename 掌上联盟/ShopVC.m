//
//  ShopVC.m
//  LOL
//
//  Created by mac on 17/8/18.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ShopVC.h"

@interface ShopVC ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ShopVC
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];


}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.shopTV];
    
}
- (UITableView *)shopTV{
    if (!_shopTV) {
        _shopTV = [[UITableView alloc]initWithFrame:CGRectMake(10, 0, APPWidth -20, APPHeight) style:UITableViewStylePlain];
        _shopTV.delegate = self;
        _shopTV.dataSource = self;
        _shopTV.tableHeaderView = [[DT_LastHeadView alloc]init];
    }
    return _shopTV;
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

//    return APPWidth *0.68+60+10;
    return APPHeight /7.5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    shopCell *cell = [shopCell shopTableViewCellWith:tableView indexPath:indexPath];
    
    return cell;
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
