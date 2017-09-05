//
//  DT_NewVersionVC.m
//  LOL
//
//  Created by mac on 17/8/21.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "DT_NewVersionVC.h"
#import "MoveCell.h"
@interface DT_NewVersionVC ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation DT_NewVersionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.versionTV];

}

- (UITableView *)versionTV{
    if (!_versionTV) {
        _versionTV = [[UITableView alloc]initWithFrame:CGRectMake(10, 0, APPWidth -20, APPHeight-64-49) style:UITableViewStylePlain];
        _versionTV.delegate = self;
        _versionTV.dataSource = self;
//        _versionTV.tableHeaderView = [[DT_LastHeadView alloc]init];
        
    }
    return _versionTV;
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}





- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *ID;
    if ([tableView dequeueReusableCellWithIdentifier:ID]) {
        return APPHeight /7.5;
    }
    return APPHeight *0.2734;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    MoveCell *cell = [MoveCell VersionTableViewCellWith:tableView indexPath:indexPath];
    
    
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
