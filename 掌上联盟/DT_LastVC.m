//
//  DT_LastVC.m
//  LOL
//
//  Created by mac on 17/8/21.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "DT_LastVC.h"
#import "ZXVideoPlayer/ZXVideo.h"
#import "ZXVideoPlayerController.h"

#import "VideoPlayViewController.h"
#import <MediaPlayer/MediaPlayer.h>
@interface DT_LastVC ()
@property (nonatomic, strong) NSIndexPath *indexPath;

@end

@implementation DT_LastVC
{
    NSMutableArray *dataMuArr;
    NSInteger cellTag,cellType;  /*
                         1:baseCell
                         2:videoCell
                         3.PictureCell*/
    NSMutableDictionary *cellTagDic;


}


- (void)viewDidLoad {
    [super viewDidLoad];
//    [self preferredStatusBarStyle];
    [self initDataSourse];
}

- (void)initDataSourse{
    
    [self initNetWork];
//    dataMuArr = [[NSMutableArray alloc]init];
    cellTagDic = [[NSMutableDictionary alloc]init];
    
    [cellTagDic setObject:@"0" forKey:@"cellkey"];
    [cellTagDic setObject:@"1" forKey:@"cellkey"];
    [cellTagDic setObject:@"2" forKey:@"cellkey"];

    [dataMuArr addObject:cellTagDic];
    [dataMuArr addObject:cellTagDic];
    [dataMuArr addObject:cellTagDic];
    
    
    [dataMuArr addObject:@"0"];
    [dataMuArr addObject:@"1"];
    [dataMuArr addObject:@"2"];

    
    
}
- (UITableView *)lastTV{
    if (!_lastTV) {
        _lastTV = [[UITableView alloc]initWithFrame:CGRectMake(10, 0, APPWidth -20, APPHeight -64 -49) style:UITableViewStylePlain];
        _lastTV.delegate = self;
        _lastTV.dataSource = self;
        _lastTV.tableHeaderView = [[DT_LastHeadView alloc]init];
//        _lastTV.tableFooterView = [[DT_LastHeadView alloc]init];

    }
    
//    //刷新tableview 增加数据 或者请求数据
//    _lastTV.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        NSLog(@"调用了 表格 头刷新");
//
//
//        for (int i =0; i<1; i ++) {
////            [dataMuArr removeLastObject];
//
//        }
//        [_lastTV.mj_header endRefreshing];
//        [_lastTV reloadData];
//    }];
//
//    //刷新tableview 移除数据
//    _lastTV.mj_footer=[MJRefreshAutoFooter footerWithRefreshingBlock:^{
//        NSLog(@"调用了 表格 头刷新");
//        for (int i =0; i<3; i ++) {
////            [dataMuArr addObject:[NSString stringWithFormat:@"%d",i]];
//
//        }
//        [_lastTV.mj_footer endRefreshing];
//        [_lastTV reloadData];
//    }];
    return _lastTV;
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _jsonObject.count;
//    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

//    if ([dataMuArr[indexPath.row]isEqualToString:@"0"]) {
//        return APPHeight /7.5;//BaseCell
//    }else if ([dataMuArr[indexPath.row]isEqualToString:@"1"]){
//        return APPWidth *0.68;//VideoCell
//
//    }else{
//        return (APPWidth -20)*0.5265 +60;//PicCell
//
//    }

    return APPHeight /7.5;//BaseCell
 
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *ID = @"baseCell";
    static NSString *VideoID = @"videoCell";
    static NSString *PictureID = @"pictureCell";

    DT_BaseCell *baseCell = [tableView dequeueReusableCellWithIdentifier:ID];
    DT_VideoCell *videoCell =[tableView dequeueReusableCellWithIdentifier:VideoID];
    DT_PictureCell *pictureCell = [tableView dequeueReusableCellWithIdentifier:PictureID];

    if ([[_jsonObject[indexPath.row] objectForKey:@"newstypeid"]isEqualToString:@"ordinary"]) {
        if (!baseCell) {
            baseCell = [[DT_BaseCell new]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
            
        }

        baseCell.titLab.text  = [_jsonObject[indexPath.row] objectForKey:@"title"];
        baseCell.detilLab.text = [_jsonObject[indexPath.row] objectForKey:@"summary"];
        [baseCell.imgV sd_setImageWithURL:[NSURL URLWithString:[_jsonObject[indexPath.row] objectForKey:@"image_url_big"]]
                                      placeholderImage:[UIImage imageNamed:@"placeholder"]];
        baseCell.readNum.text = [NSString stringWithFormat:@"%@阅",[_jsonObject[indexPath.row] objectForKey:@"pv"]];
        baseCell.author.text = [_jsonObject[indexPath.row] objectForKey:@"author"];
        return baseCell;//BaseCell


    }else if ([dataMuArr[indexPath.row]isEqualToString:@"1"]){
        if (!videoCell) {
            videoCell = [[DT_VideoCell new]initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:VideoID];
            
        }
        return videoCell;//VideoCell
        
    }else{
        if (!pictureCell) {
            pictureCell = [[DT_PictureCell new]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:PictureID];
        }
        
        //        pictureCell.imageView.image = [UIImage imageNamed:@"4.jpg" ];
        
        return pictureCell;//PicCell
        
    }
    


    }


- (void)tapAction:(UITapGestureRecognizer *)sender{
  
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    BaseDetialVC *baseVc = [[BaseDetialVC alloc]init];
    //把网址穿到下一个细节界面
    _urlStr = [_jsonObject[indexPath.row] objectForKey:@"article_url"];
    baseVc.urlStr = _urlStr;
    [self.navigationController pushViewController:baseVc animated:YES];

    
    
    
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
    [[MyHttpRequesr alloc]getHttpRequest:urlString key:@"baseCell"];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getJsonObjectForNetWork4:) name:@"baseCell" object:nil];
    
}

- (void)getJsonObjectForNetWork4:(NSNotification *)notification{
    NSLog(@"%@",notification.userInfo[@"list"]);
    _jsonObject = notification.userInfo[@"list"];
    //在这里初始化界面
    [self.view addSubview:self.lastTV];

    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    
    //    [mytableView reloadData];
    
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
