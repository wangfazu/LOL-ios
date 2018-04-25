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
    ZXVideo *video;
    VideoPlayViewController *videoVc;
    ZXVideoPlayerController *zxVideoControler;
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
//        _lastTV.tableFooterView = [[DT_LastHeadView alloc]init];

    }
    
    //刷新tableview 增加数据 或者请求数据
//    _lastTV.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        NSLog(@"调用了 表格 头刷新");
//        
//
//        for (int i =0; i<1; i ++) {
//            [dataMuArr removeLastObject];
//            
//        }
//        [_lastTV.mj_header endRefreshing];
//        [_lastTV reloadData];
//    }];
//    
//    //刷新tableview 移除数据
//    _lastTV.mj_footer=[MJRefreshAutoFooter footerWithRefreshingBlock:^{
//        NSLog(@"调用了 表格 头刷新");
//        for (int i =0; i<5; i ++) {
//            [dataMuArr addObject:[NSString stringWithFormat:@"%d",i]];
//            
//        }
//        [_lastTV.mj_footer endRefreshing];
//        [_lastTV reloadData];
//    }];
    return _lastTV;
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return dataMuArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row %2 ==0) {
        return APPHeight /7.5;
        
    }else if (indexPath.row %3==0){
    
        return APPWidth *0.65;

    }
    return APPWidth *0.68;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *ID = @"baseCell";
    static NSString *VideoID = @"videoCell";
    static NSString *PictureID = @"pictureCell";

    DT_BaseCell *baseCell = [tableView dequeueReusableCellWithIdentifier:ID];
    DT_VideoCell *videoCell =[tableView dequeueReusableCellWithIdentifier:VideoID];
    DT_PictureCell *pictureCell = [tableView dequeueReusableCellWithIdentifier:PictureID];
    if (indexPath.row %2 ==0) {
        if (!baseCell) {
            baseCell = [[DT_BaseCell new]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];

        }
        baseCell.textLabel.text = [NSString stringWithFormat:@"Base:%ld1",indexPath.row];
        return baseCell;
    }else if (indexPath.row %3==0){
        if (!videoCell) {
            videoCell = [[DT_VideoCell new]initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:VideoID];
            
        }
//        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
//        videoCell.gifImageView.userInteractionEnabled = YES;
//        [videoCell.gifImageView addGestureRecognizer:tap];
//        videoCell.textLabel.text = [NSString stringWithFormat:@"Video：%ld",indexPath.row];
        video = [[ZXVideo alloc] init];
        video.playUrl = @"http://baobab.wdjcdn.com/1451897812703c.mp4";
        video.title = @"Rollin'Wild 圆滚滚的";
        
        videoVc = [[VideoPlayViewController alloc] init];
        videoVc.video = video;
        videoVc.hidesBottomBarWhenPushed = YES;
        videoVc.view.frame = CGRectMake(0, 0, APPWidth, APPWidth *0.5265);
        [self addChildViewController:videoVc];
        [videoCell addSubview:videoVc.view];
        
        return videoCell;
        
    }else{
        if (!pictureCell) {
            pictureCell = [[DT_PictureCell new]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:PictureID];
        }
//        pictureCell.imageView.image = [UIImage imageNamed:@"4.jpg" ];
        

        
    }

    return pictureCell;


}

- (void)tapAction:(UITapGestureRecognizer *)sender{
    
//            ZXVideo *video = [[ZXVideo alloc] init];
//            video.playUrl = @"http://baobab.wdjcdn.com/1451897812703c.mp4";
//            video.title = @"Rollin'Wild 圆滚滚的";
//    
//            VideoPlayViewController *vc = [[VideoPlayViewController alloc] init];
//            vc.video = video;
//            vc.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:[VideoPlayViewController new] animated:YES];
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row %3==0  ){
        [zxVideoControler pause];


    }
    
    
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
