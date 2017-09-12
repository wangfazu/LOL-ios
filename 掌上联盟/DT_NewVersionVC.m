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
    NSArray *baseJsonObj;
    NSInteger netTag;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initDataSourse];
    [_versionTV reloadData];

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

#pragma mark - TableviewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            if (indexPath.row ==0) {
                return APPHeight *0.25;
            }else
                return APPHeight /7.5;//BaseCell
            break;
        case 1:
            if (indexPath.row ==0) {
                return APPHeight *0.21;
            }else
                return APPHeight /7.5;//BaseCell
            break;
        default:
            return APPHeight /7.5;//BaseCell
            break;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 30;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, APPWidth, 30)];
    [view addSubview:self.titleLab];
    [view addSubview:self.deciptionLab];
    switch (section) {
        case 0:
            _titleLab.text = [jsonObject[0] objectForKey:@"change_hero_ver" ];

            break;
        case 1:
            _titleLab.text = [jsonObject[1] objectForKey:@"change_skin_ver" ];
            
            break;
       
        default:
            _titleLab.text = [jsonObject[section] objectForKey:@"col_name" ];

            break;
    }

    return view;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *ID = @"cell",
             *BID = @"baseCell",
             *SkinID = @"skinCell";
    
    CardCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    DT_BaseCell *bCell = [tableView dequeueReusableCellWithIdentifier:BID];
    SkinCell *sCell = [tableView dequeueReusableCellWithIdentifier:SkinID];
    
    switch (indexPath.section) {
        case 0:
            if (indexPath.row ==0) {
                if (!cell) {
                    cell = [[CardCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
                    
                }

                [self fzGetCardData:indexPath cardCell:cell];
                return cell;
                break;
            }
        case 1:
            if (indexPath.row ==0) {
                if (!sCell) {
                    sCell = [[SkinCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SkinID];
                    
                }
                [self fzGetSkinData:indexPath skinCell:sCell];
                return sCell;
                break;

            }
        default:
            if (!bCell) {
                bCell = [[DT_BaseCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:BID];
                
            }
            [self fzGetBaseData:indexPath skinCell:bCell];

            return bCell;
            break;
    }
    /*第一行：卡片英雄，第4行：皮肤介绍，其余的胃基础的cell展示*/
  /*  switch (indexPath.row) {
        case 0:
            if (!cell) {
                cell = [[CardCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
                
            }
            [self fzGetCardData:indexPath cardCell:cell];
            return cell;


            break;
        case 4:
            if (!sCell) {
                sCell = [[SkinCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SkinID];
                
            }
            
            return sCell;
            break;
            
        default:
            if (!bCell) {
                bCell = [[DT_BaseCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:BID];
                
            }
            
            return bCell;
            break;
    }
    
*/

}

#pragma mark - TableViewDataSourse -> cell加载网络数据

- (void)fzGetCardData:(NSIndexPath*)indexPath cardCell:(CardCell *)cell{
    for ( int i = 0; i<5; i++) {

        //整体卡片
        UIImageView *cardImgv = [cell viewWithTag:100+i];
        [cardImgv sd_setImageWithURL:[NSURL URLWithString: [[jsonObject[0] objectForKey:@"cardlist"][i] objectForKey:@"hero_bg_img_url"]]
                    placeholderImage:[UIImage imageNamed:@"placeholder"]];
        
        //卡片左上角
        cell.leftLab = [cell viewWithTag:300+i];
        NSString *hero_tag = [[jsonObject[0] objectForKey:@"cardlist"][0] objectForKey:@"hero_tag"];
        if ([hero_tag isEqualToString:@" "]) {
            cell.leftLab.text = @"已拥有";
            NSLog(@"%@",hero_tag);
        }
        
        //头像
        cell.heroImgV = [cell viewWithTag:200+i];
        [cell.heroImgV sd_setImageWithURL:[NSURL URLWithString: [[jsonObject[0] objectForKey:@"cardlist"][i] objectForKey:@"hero_head_img_url"]]
                         placeholderImage:[UIImage imageNamed:@"placeholder"]];
        
        //hero
        cell.heroLab = [cell viewWithTag:400+i];//hero_name   hero_nick
        NSString *hero_name = [[jsonObject[0] objectForKey:@"cardlist"][i] objectForKey:@"hero_name"];
        NSString *hero_nick = [[jsonObject[0] objectForKey:@"cardlist"][i] objectForKey:@"hero_nick"];
        cell.heroLab.text = [NSString stringWithFormat:@"%@ %@",hero_nick,hero_name];
        
        //hero_desc
        cell.tagLab = [cell viewWithTag:500+i];
        cell.tagLab.text = [[jsonObject[0] objectForKey:@"cardlist"][i] objectForKey:@"hero_desc"];
        NSLog(@"%@",cell.tagLab.text);
        
    }
    
    
}

- (void)fzGetSkinData:(NSIndexPath*)indexPath skinCell:(SkinCell *)cell{
    for ( int i = 0; i<5; i++) {
        
        //整体卡片
        UIImageView *cardImgv = [cell viewWithTag:100+i];
        [cardImgv sd_setImageWithURL:[NSURL URLWithString: [[jsonObject[1] objectForKey:@"cardlist"][i] objectForKey:@"skin_pic_url"]]
                    placeholderImage:[UIImage imageNamed:@"placeholder"]];
        
        
        //头像
        cell.heroImgV = [cell viewWithTag:200+i];
        [cell.heroImgV sd_setImageWithURL:[NSURL URLWithString: [[jsonObject[1] objectForKey:@"cardlist"][i] objectForKey:@"hero_head_img_url"]]
                         placeholderImage:[UIImage imageNamed:@"placeholder"]];
        
        //hero
        cell.heroLab = [cell viewWithTag:400+i];//hero_name   hero_nick
        NSString *hero_name = [[jsonObject[1] objectForKey:@"cardlist"][i] objectForKey:@"hero_name"];
        NSString *hero_nick = [[jsonObject[1] objectForKey:@"cardlist"][i] objectForKey:@"hero_nick"];
        cell.heroLab.text = [NSString stringWithFormat:@"%@ %@",hero_nick,hero_name];
        

        
    }
    
}

- (void)fzGetBaseData:(NSIndexPath*)indexPath skinCell:(DT_BaseCell *)baseCell{
    
    baseCell.titLab.text  = [baseJsonObj[indexPath.row] objectForKey:@"title"];
    baseCell.detilLab.text = [baseJsonObj[indexPath.row] objectForKey:@"summary"];
    [baseCell.imgV sd_setImageWithURL:[NSURL URLWithString:[baseJsonObj[indexPath.row] objectForKey:@"image_url_big"]]
                     placeholderImage:[UIImage imageNamed:@"placeholder"]];
    baseCell.readNum.text = [NSString stringWithFormat:@"%@阅",[baseJsonObj[indexPath.row] objectForKey:@"pv"]];
    baseCell.author.text = [baseJsonObj[indexPath.row] objectForKey:@"author"];
    
    /* 线程*/
    /*    // 创建
     NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(getJsonObjectForNetWorkCard:) object:nil];
     
     // 启动
     [thread start];
     //自启动
     [NSThread detachNewThreadSelector:@selector(getJsonObjectForNetWorkBase:) toTarget:self withObject:nil];
     
     */
}

#pragma mark - 请求网络数据

- (void)initDataSourse{
    
    NSString *urlString = @"http://qt.qq.com/lua/lol_news/recommend?cid=367&areaid=4&plat=android&version=9750";
    NSString *baseString = @"http://qt.qq.com/php_cgi/news/php/varcache_getnews.php?id=367&page=0&plat=android&version=9750";
    /**
     *  对网址转码
     *
     *  @param NSString 。
     *   转换完毕后在发送网络请求
     *  @return 。
     */
    [[MyHttpRequesr alloc]getHttpRequest:urlString key:@"card"];
    [[MyHttpRequesr alloc]getHttpRequest:baseString key:@"base"];

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getJsonObjectForNetWorkCard:) name:@"card" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getJsonObjectForNetWorkBase:) name:@"base" object:nil];
    [self.view addSubview:self.versionTV];


}

- (void)getJsonObjectForNetWorkCard:(NSNotification *)notification{
    NSLog(@"%@",notification.userInfo[@"list"]);
    jsonObject = notification.userInfo[@"list"];
    /*数据加载完成，开始加载UI*/

    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

- (void)getJsonObjectForNetWorkBase:(NSNotification *)notification{
    NSLog(@"%@",notification.userInfo[@"list"]);
    baseJsonObj = notification.userInfo[@"list"];
    /*数据加载完成，开始加载UI*/

    [[NSNotificationCenter defaultCenter] removeObserver:self];


}

#pragma mark -  懒加载

- (UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, APPWidth*2/5, 20)];

    }//change_hero_ver
    _titleLab.font = [UIFont systemFontOfSize:14];
    return _titleLab;
}

- (UILabel *)deciptionLab{
    if (!_deciptionLab) {
        _deciptionLab = [[UILabel alloc]initWithFrame:CGRectMake(_titleLab.marginX +10, 10, APPWidth*2.5/5-10, 20)];
        
    }
    _deciptionLab.textAlignment = NSTextAlignmentRight;
    _deciptionLab.font = [UIFont systemFontOfSize:12];
    _deciptionLab.textColor = [UIColor grayColor];
    return _deciptionLab;
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
