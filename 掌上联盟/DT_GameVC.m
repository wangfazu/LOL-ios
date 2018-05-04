//
//  DT_GameVC.m
//  LOL
//
//  Created by mac on 17/8/21.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "DT_GameVC.h"

@interface DT_GameVC ()

@end

@implementation DT_GameVC

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view
//    .backgroundColor = [UIColor greenColor];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.gameTV];
}
- (UITableView *)gameTV{
    if (!_gameTV) {
        _gameTV = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, APPWidth , APPHeight -64 -49) style:UITableViewStylePlain];
        _gameTV.delegate = self;
        _gameTV.dataSource = self;
        //        _lastTV.tableHeaderView = [[DT_LastHeadView alloc]init];
        //        _videoTV.tableHeaderView = [[Hero_headView alloc]init];
        
    }
    
    return _gameTV;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
//    return 2;
//    //    return 1;

    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 1;
            break;
            
        default:
            return 10;
            break;
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
 
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
        switch (indexPath.section) {
            case 0:
                if (indexPath.row ==0) {
                    return APPWidth *0.35;
                }else
                    return APPHeight /7.5;//BaseCell
                break;
            case 1:
//                if (indexPath.row ==0) {
                    return APPHeight /7.3;//BaseCell
                
                
                break;
            default:
                return APPHeight /7.5;//BaseCell
                break;
        }
    
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
//    if (!vCell) {
//        vCell = [[DT_VideoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"vCell"];
//        vCell.layer.cornerRadius = 10;
//        vCell.clipsToBounds = YES;
//    }
    //    vCell.zxVideo
    //    video.playUrl = @"http://baobab.wdjcdn.com/1451897812703c.mp4";
    //    video.title = @"Rollin'Wild 圆滚滚的";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    DT_BaseCell *bCell  = [tableView dequeueReusableCellWithIdentifier:@"bcell"];
    UITableViewCell *cardCell = [tableView dequeueReusableCellWithIdentifier:@"ccell"];

//    UITableViewCell *
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(5, 0, APPWidth -10, (APPWidth-10)*0.35)];
        [btn setImage:[UIImage imageNamed:@"huifang"] forState:UIControlStateNormal];
        btn.layer.cornerRadius = 10;
        btn.clipsToBounds = YES;
        [cell addSubview:btn];
    }
    
    if (!bCell) {
        bCell = [[DT_BaseCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"bcell"];
    }
    if (!cardCell) {
        cardCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ccell"];
        _scroView = [[UIScrollView alloc]initWithFrame:CGRectMake(5, 0, APPWidth, APPHeight/7.5)];
        _scroView.delegate = self;
        _scroView.contentSize = CGSizeMake(6*(APPWidth/2.5+10) , 0);
        [cardCell addSubview:_scroView];
//        NSArray *arr = [@"sai"]
        for (int i= 0; i<6; i++) {
            UIImageView *imgv = [[UIImageView alloc]initWithFrame:CGRectMake((APPWidth/2.5+10)*i, 5, APPWidth/2.5, APPHeight/8)];
            imgv.backgroundColor = RandomColor;
            imgv.layer.cornerRadius = 8;
            imgv.clipsToBounds = YES;
            [imgv setImage:[UIImage imageNamed:[NSString stringWithFormat:@"sai%d",i+1]]];
            [_scroView addSubview:imgv];
        }
        
//        cardCell.backgroundColor = APPColor;
    }
    
    if (indexPath.section == 0 ) {
        return cell;

    }
    if (indexPath.section == 1) {
//        if (indexPath.row == 0) {
            return cardCell;
//        }else{
//            return bCell;
//        }
        
    }
    return bCell;
    
    
    
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return @"正在回放";
            break;
        case 1:
           return  @"今日赛事";
            default:
            return @"过去赛事";
            
       
    }
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
