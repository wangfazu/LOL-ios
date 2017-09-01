//
//  MineVC.m
//  LOL
//
//  Created by mac on 17/8/18.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "MineVC.h"
#import "MineCell.h"
@interface MineVC ()<yourDelegate>

@end

@implementation MineVC{
    UIButton *bnt;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];


}


- (void)viewDidLoad {
    [super viewDidLoad];
//    YourVC *yvc = [[YourVC alloc]init];
//    [self returnChooseDay:@"1"];
//
//    yvc.delegate = self;
    [self.view addSubview:self.lastTV];


}


- (UITableView *)lastTV{
    if (!_lastTV) {
        _lastTV = [[UITableView alloc]initWithFrame:CGRectMake(10, 0, APPWidth -20, APPHeight) style:UITableViewStylePlain];
        _lastTV.delegate = self;
        _lastTV.dataSource = self;
        _lastTV.tableHeaderView = [[DT_LastHeadView alloc]init];
    }
    return _lastTV;
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return APPHeight *0.391;
//    return APPHeight/6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MineCell *cell = [MineCell TableViewCellWith:tableView indexPath:indexPath];

    
    return cell;
}







- (void)returnChooseDay:(id)myChooseDayView{
    bnt = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, APPWidth, APPHeight)];
    bnt.backgroundColor = [UIColor grayColor];
    [self.view addSubview:bnt];
    [bnt addTarget:self action:@selector(fzGoToNewWord) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)fzGoToNewWord{
    
    [self.navigationController pushViewController:[YourVC new] animated:YES];
}

- (void)fzCreatView{
    
    bnt.backgroundColor = [UIColor redColor];
    
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
