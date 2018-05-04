//
//  MineVC.m
//  LOL
//
//  Created by mac on 17/8/18.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "MineVC.h"
#import "MineCell.h"
#import "mineHeadView.h"
@interface MineVC ()<yourDelegate>

@end

@implementation MineVC{
    UIButton *bnt;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];


}


- (void)viewDidLoad {
    [super viewDidLoad];
//    YourVC *yvc = [[YourVC alloc]init];
//    [self returnChooseDay:@"1"];
//
//    yvc.delegate = self;
    [self.view addSubview:self.lastTV];


}


- (UITableView *)lastTV{
    if (!_lastTV) {
        _lastTV = [[UITableView alloc]initWithFrame:CGRectMake(10, 0, APPWidth -20, APPHeight) style:UITableViewStylePlain];
        _lastTV.delegate = self;
        _lastTV.dataSource = self;
        _lastTV.tableHeaderView = [[mineHeadView alloc]init];
    }
    return _lastTV;
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
//    return APPHeight/6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    //    UITableViewCell *
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        UIImageView *imgV = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 80, 80)];
        imgV.layer.cornerRadius = 40;
        imgV.clipsToBounds = YES;
        imgV.tag = 199;
        imgV.backgroundColor  = RandomColor;
        [cell addSubview:imgV];
        
        UILabel  *resultLab = [[UILabel alloc]initWithFrame:CGRectMake(imgV.marginX+10, 10, 40, 20)];
        resultLab.text = @"胜利";
        resultLab.textColor = APPColor;
        [cell addSubview:resultLab];
        
        UILabel *ccLab = [[UILabel alloc]initWithFrame:CGRectMake(resultLab.marginX+10, 10, 100, 20)];
        ccLab.textColor = [UIColor blackColor];
        ccLab.text = @"6 / 6 / 6";
        ccLab.font = [UIFont systemFontOfSize:17 weight:2];
        [cell addSubview:ccLab];
        
        UILabel *modelLab = [[UILabel alloc]initWithFrame:CGRectMake(imgV.marginX +10, resultLab.marginY+10, 100, 30)];
        modelLab.textColor = UIColorFromRGB(0xc9c9c9);
        modelLab.text = @"排位模式";
        modelLab.font = [UIFont systemFontOfSize:20 weight:2];
        [cell addSubview:modelLab];
        
        UILabel *timeLab = [[UILabel alloc]initWithFrame:CGRectMake(APPWidth-150, cell.width/2 -20, 100, 40)];
        timeLab.textColor = UIColorFromRGB(0xadadad);
        timeLab.text = @"04-17 20:20";
        [cell addSubview:timeLab];
    }
    UIImageView *headImagV = [cell viewWithTag:199];
    NSString *urlStr = [NSString stringWithFormat:@"http://ossweb-img.qq.com/images/lol/web201310/skin/big%ld000.jpg",indexPath.row+1 ];
    [headImagV sd_setImageWithURL:[NSURL URLWithString:urlStr]];

    
    return cell;
}







- (void)returnChooseDay:(id)myChooseDayView{
    bnt = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, APPWidth, APPHeight)];
    bnt.backgroundColor = [UIColor grayColor];
    [self.view addSubview:bnt];
    [bnt addTarget:self action:@selector(fzGoToNewWord) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)fzGoToNewWord{
    
    [self.navigationController pushViewController:[YourVC new] animated:YES];
}

- (void)fzCreatView{
    
    bnt.backgroundColor = [UIColor redColor];
    
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
