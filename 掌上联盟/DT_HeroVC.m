
//
//  DT_HeroVC.m
//  LOL
//
//  Created by mac on 17/8/21.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "DT_HeroVC.h"
#import "Hero+headView.h"
@interface DT_HeroVC ()

@end

@implementation DT_HeroVC
{
    UILabel *lineLab;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view
//    .backgroundColor = [UIColor redColor];
    // Do any additional setup after loading the view.
//    NSArray *tArr = [[NSArray alloc]initWithObjects:@"全部英雄",@"新符文",@"物品",@"资料",@"LOL宇宙", nil];
//    for (int i =0; i<4; i++) {
//        CGFloat btnX =  20 + APPWidth/4*i;
//        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(btnX, 20, APPWidth/8, APPWidth/8)];
//        [btn setBackgroundColor:RandomColor];
//        btn.layer.cornerRadius = 10;
//        btn.clipsToBounds = YES;
//        [self.view addSubview:btn];
////        NSLog(@"%F",btnX);
//        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(btnX, btn.marginY + 10, APPWidth/7, APPWidth/7)];
//        lab.textColor = APPColor;
//        lab.text = tArr[i];
//        lab.font =  [UIFont systemFontOfSize:13];
//        lab.textAlignment = NSTextAlignmentCenter;
//        [self.view addSubview:lab];
//
//        lineLab = [[UILabel alloc]initWithFrame:CGRectMake(0, lab.marginY+5, APPWidth, 5)];
//        lineLab.backgroundColor = [UIColor grayColor];
//        [self.view addSubview:lineLab];
//    }
    [self.view addSubview:self.lastTV];
}
- (void)initDataSourse{
    
//    [self initNetWork];
//    //    dataMuArr = [[NSMutableArray alloc]init];
//    cellTagDic = [[NSMutableDictionary alloc]init];
//
//    [cellTagDic setObject:@"0" forKey:@"cellkey"];
//    [cellTagDic setObject:@"1" forKey:@"cellkey"];
//    [cellTagDic setObject:@"2" forKey:@"cellkey"];
//
//    [dataMuArr addObject:cellTagDic];
//    [dataMuArr addObject:cellTagDic];
//    [dataMuArr addObject:cellTagDic];
//
//
//    [dataMuArr addObject:@"0"];
//    [dataMuArr addObject:@"1"];
//    [dataMuArr addObject:@"2"];
    
    
    
}
- (UITableView *)lastTV{
    if (!_lastTV) {
        _lastTV = [[UITableView alloc]initWithFrame:CGRectMake(10, 0, APPWidth -20, APPHeight -64 -49) style:UITableViewStylePlain];
        _lastTV.delegate = self;
        _lastTV.dataSource = self;
//        _lastTV.tableHeaderView = [[DT_LastHeadView alloc]init];
                _lastTV.tableHeaderView = [[Hero_headView alloc]init];
        
    }

    return _lastTV;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
    //    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
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
                
//                [self fzGetCardData:indexPath cardCell:cell];
                return cell;
                break;
            }
        case 1:
            if (indexPath.row ==0) {
                if (!sCell) {
                    sCell = [[SkinCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SkinID];
                    
                }
//                [self fzGetSkinData:indexPath skinCell:sCell];
                return sCell;
                break;
                
            }
        default:
            if (!bCell) {
                bCell = [[DT_BaseCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:BID];
                
            }
//            [self fzGetBaseData:indexPath skinCell:bCell];
            
            return bCell;
            break;
    }
    
    
}
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//
//}

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
