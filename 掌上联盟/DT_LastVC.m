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
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.lastTV];
}

- (UITableView *)lastTV{
    if (!_lastTV) {
        _lastTV = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, APPWidth, APPHeight) style:UITableViewStylePlain];
        _lastTV.delegate = self;
        _lastTV.dataSource = self;
    }
    return _lastTV;
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *ID = @"cell";
    DT_BaseCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[DT_BaseCell new]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"guide_center_icon"];

    return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIImageView *imgv = [UIImageView alloc];
    imgv.image = [UIImage imageNamed:@"club_mem_bg"];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, APPWidth, 50)];
    view.backgroundColor = [UIColor blueColor];
    [view addSubview:imgv];
    return view;
    
    
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
