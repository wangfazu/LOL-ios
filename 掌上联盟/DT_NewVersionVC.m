//
//  DT_NewVersionVC.m
//  LOL
//
//  Created by mac on 17/8/21.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "DT_NewVersionVC.h"

@interface DT_NewVersionVC ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

@end

@implementation DT_NewVersionVC
{
    NSArray *jsonObject;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initDataSourse];
    

}

- (UITableView *)versionTV{
    if (!_versionTV) {
        _versionTV = [[UITableView alloc]initWithFrame:CGRectMake(10, 0, APPWidth -20, APPHeight-64-49 -49) style:UITableViewStylePlain];
        _versionTV.delegate = self;
        _versionTV.dataSource = self;
//        _versionTV.tableHeaderView = [[DT_LastHeadView alloc]init];
        
    }
    return _versionTV;
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;
}
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return 3;
//}





- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return APPHeight *0.2745;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

//    MoveCell *cell = [MoveCell VersionTableViewCellWith:tableView indexPath:indexPath];
    NSString *ID = @"cell";
    CardCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[CardCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        
    }

    
    
    for ( int i = 0; i<5; i++) {
        //整体卡片
        UIImageView *cardImgv = [cell viewWithTag:100+i];
        [cardImgv sd_setImageWithURL:[NSURL URLWithString: [[jsonObject[indexPath.row] objectForKey:@"cardlist"][i] objectForKey:@"hero_bg_img_url"]]
    placeholderImage:[UIImage imageNamed:@"placeholder"]];
        
        //卡片左上角
        cell.leftLab = [cell viewWithTag:300+i];
        NSString *hero_tag = [[jsonObject[0] objectForKey:@"cardlist"][0] objectForKey:@"hero_tag"];
        if ([hero_tag isEqualToString:@""]) {
            cell.leftLab.text = @"已拥有";
        }else{
            cell.leftLab.text = @"新英雄";
        }
        NSLog(@"%@",hero_tag);
        
        
        //头像
        cell.heroImgV = [cell viewWithTag:200+i];
        [cell.heroImgV sd_setImageWithURL:[NSURL URLWithString: [[jsonObject[indexPath.row] objectForKey:@"cardlist"][i] objectForKey:@"hero_head_img_url"]]
                         placeholderImage:[UIImage imageNamed:@"placeholder"]];
        
        //hero
        cell.heroLab = [cell viewWithTag:400+i];//hero_name   hero_nick
        NSString *hero_name = [[jsonObject[indexPath.row] objectForKey:@"cardlist"][i] objectForKey:@"hero_name"];
        NSString *hero_nick = [[jsonObject[indexPath.row] objectForKey:@"cardlist"][i] objectForKey:@"hero_nick"];
        cell.heroLab.text = [NSString stringWithFormat:@"%@ %@",hero_nick,hero_name];
        
        //hero_desc
        cell.tagLab = [cell viewWithTag:500+i];
        cell.tagLab.text = [[jsonObject[indexPath.row] objectForKey:@"cardlist"][i] objectForKey:@"hero_desc"];
        NSLog(@"%@",cell.tagLab.text);

    }
    return cell;
}


- (void)initDataSourse{
    
    NSString *urlString = @"http://qt.qq.com/lua/lol_news/recommend?cid=367&areaid=4&plat=android&version=9750";
    /**
     *  对网址转码
     *
     *  @param NSString 。
     *   转换完毕后在发送网络请求
     *  @return 。
     */
    [[MyHttpRequesr alloc]getHttpRequest:urlString key:@"card"];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getJsonObjectForNetWorkCard:) name:@"card" object:nil];
    
}

- (void)getJsonObjectForNetWorkCard:(NSNotification *)notification{
    NSLog(@"%@",notification.userInfo[@"list"]);
    jsonObject = notification.userInfo[@"list"];
    /*数据加载完成，开始加载UI*/
    [self.view addSubview:self.versionTV];

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
