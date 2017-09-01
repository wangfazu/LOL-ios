//
//  FindVC.m
//  LOL
//
//  Created by mac on 17/8/18.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "FindVC.h"
#import "findCell.h"
@interface FindVC ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,retain) UITableView *lastTV;
@end

@implementation FindVC
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

}


- (void)viewDidLoad {
    [super viewDidLoad];
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
    NSString *ID;
    if ([tableView dequeueReusableCellWithIdentifier:ID]) {
        return APPHeight /7.5;
    }
    return APPHeight /7.5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    

    findCell *cell = [findCell TableViewCellWith:tableView indexPath:indexPath];
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
