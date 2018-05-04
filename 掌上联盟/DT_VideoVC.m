//
//  DT_VideoVC.m
//  LOL
//
//  Created by mac on 17/8/21.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "DT_VideoVC.h"

@interface DT_VideoVC ()
@property (nonatomic,retain) UIImageView *heroImgV;
@end

@implementation DT_VideoVC

- (void)viewDidLoad {
    [super viewDidLoad];
//    // Do any additional setup after loading the view.
//    _heroImgV = [[UIImageView alloc]initWithFrame:CGRectMake(APPWidth/2-28.5, 100, 57, 57)];
//    _heroImgV.image = [UIImage imageNamed:@"personal_head_background"];
////    _heroImgV.backgroundColor =[UIColor grayColor];
//    [self.view addSubview:_heroImgV];
    [self.view addSubview:self.videoTV];

    
}
- (UITableView *)videoTV{
    if (!_videoTV) {
        _videoTV = [[UITableView alloc]initWithFrame:CGRectMake(5, 0, APPWidth -10, APPHeight -64 -49) style:UITableViewStylePlain];
        _videoTV.delegate = self;
        _videoTV.dataSource = self;
        //        _lastTV.tableHeaderView = [[DT_LastHeadView alloc]init];
//        _videoTV.tableHeaderView = [[Hero_headView alloc]init];
        
    }
    
    return _videoTV;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
    //    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    switch (indexPath.section) {
//        case 0:
//            if (indexPath.row ==0) {
//                return APPHeight *0.25;
//            }else
//                return APPHeight /7.5;//BaseCell
//            break;
//        case 1:
//            if (indexPath.row ==0) {
//                return APPHeight *0.21;
//            }else
//                return APPHeight /7.5;//BaseCell
//            break;
//        default:
//            return APPHeight /7.5;//BaseCell
//            break;
//    }

    return APPWidth *0.7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    NSString *ID = @"cell",
//    *BID = @"baseCell",
//    *SkinID = @"skinCell";
    
//    CardCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
//    DT_BaseCell *bCell = [tableView dequeueReusableCellWithIdentifier:BID];
//    SkinCell *sCell = [tableView dequeueReusableCellWithIdentifier:SkinID];
    DT_VideoCell *vCell = [tableView dequeueReusableCellWithIdentifier:@"vCell"];
    if (!vCell) {
        vCell = [[DT_VideoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"vCell"];
        vCell.layer.cornerRadius = 10;
        vCell.clipsToBounds = YES;
    }
//    vCell.zxVideo
//    video.playUrl = @"http://baobab.wdjcdn.com/1451897812703c.mp4";
//    video.title = @"Rollin'Wild 圆滚滚的";
    
    return vCell;
    
    
    
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
