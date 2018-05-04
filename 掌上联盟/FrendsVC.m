//
//  FrendsVC.m
//  掌上联盟
//
//  Created by mac on 17/8/18.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "FrendsVC.h"
#import "DT_friendsHeadView.h"
#import "friendsCellTableViewCell.h"
#import "SheQuViewController.h"
@interface FrendsVC ()

@end

@implementation FrendsVC
{
    NSMutableArray *dataArr;
    NSMutableArray *dataForGameArrr;
}
- (UITableView *)friendsTV{
    if (!_friendsTV) {
        _friendsTV = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, APPWidth , APPHeight -64 ) style:UITableViewStylePlain];
        _friendsTV.delegate = self;
        _friendsTV.dataSource = self;
        _friendsTV.tableHeaderView = [[DT_friendsHeadView alloc]init];
        //        _lastTV.tableFooterView = [[DT_LastHeadView alloc]init];
        
    }
    return _friendsTV;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    self.navigationController.navigationBarHidden = NO;
    [self setNavgationBarItemName:@"好友"];


}

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载数据
    dataArr = [[NSMutableArray alloc]init];
    dataForGameArrr = [[NSMutableArray alloc]init];
    for (int i=0; i<10; i++) {
        [dataArr addObject:@"岳林-最强黑铁"];
        [dataForGameArrr addObject:@"老鼠精"];
    }
    //加上 搜索栏
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, APPWidth, 35)];//allocate titleView
    UIColor *color =  self.navigationController.navigationBar.barTintColor;
    
    [titleView setBackgroundColor:color];

//    titleView.backgroundColor = [UIColor redColor];
    UISearchBar *searchBar = [[UISearchBar alloc] init];
    
    searchBar.delegate = self;
    searchBar.frame = CGRectMake(0, 0, APPWidth, 35);
    searchBar.backgroundColor = color;
    searchBar.layer.cornerRadius = 18;
    searchBar.layer.masksToBounds = YES;
    [searchBar.layer setBorderWidth:8];
    [searchBar.layer setBorderColor:[UIColor whiteColor].CGColor];  //设置边框为白色
    
    searchBar.placeholder = @"搜索并添加好友...";
    [titleView addSubview:searchBar];
    
    //Set to titleView
    [self.navigationItem.titleView sizeToFit];
    [self.view addSubview:titleView];
//    self.navigationItem.titleView = titleView;

    [self.view addSubview:self.friendsTV];

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return dataArr.count;

    }else{
        return dataForGameArrr.count;
    }
    //    return 1;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    UIView *view = [UIView new];
    view.frame = CGRectMake(0, 0, APPWidth, 30);
    view.backgroundColor = [UIColor blackColor];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, APPWidth, 30)];
    btn.tag = section;
    [btn addTarget:self action:@selector(sectionClick:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn];
    
    //
    UILabel *frienLab   = [[UILabel alloc]initWithFrame:CGRectMake(20, 5, 100, 20)];
    if (section == 0) {
        frienLab.text = @"掌盟好友";

    }else{
        frienLab.text = @"游戏好友";

    }
    frienLab.textColor = APPColor;
    [btn addSubview:frienLab];
    

    return view;
}
- (void)sectionClick:(UIButton * )btn{

    
    switch (btn.tag) {
        case 0:
            if (dataArr.count == 0) {
                for (int i=0; i<10; i++) {
                    [dataArr addObject:@"0"];
                    [_friendsTV reloadData];
                }
            }else{
                [dataArr removeAllObjects];
                [_friendsTV reloadData];
                
            }

            NSLog(@"第一区");
            break;
        case 1:
            if (dataForGameArrr.count == 0) {
                for (int i=0; i<10; i++) {
                    [dataForGameArrr addObject:@"0"];
                    [_friendsTV reloadData];
                }
            }else{
                [dataForGameArrr removeAllObjects];
                [_friendsTV reloadData];
                
            }
            NSLog(@"第2区");
            break;
            
        
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    

    
    return 100;//BaseCell
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    static NSString *ID = @"baseCell";
//    static NSString *VideoID = @"videoCell";
//    static NSString *PictureID = @"pictureCell";
//
//    DT_BaseCell *baseCell = [tableView dequeueReusableCellWithIdentifier:ID];
//    DT_VideoCell *videoCell =[tableView dequeueReusableCellWithIdentifier:VideoID];
//    DT_PictureCell *pictureCell = [tableView dequeueReusableCellWithIdentifier:PictureID];
    friendsCellTableViewCell *fCell = [tableView dequeueReusableCellWithIdentifier:@"fCell"];
    if (!fCell) {
        fCell = [[friendsCellTableViewCell new]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"fCell"];
    }
    fCell.nameLab.textColor = RandomColor;
    fCell.nameLab.text = @"岳林-最强黑铁";
    fCell.gameNameLab.text = @"蛇皮";


        return fCell;//BaseCell
        
        
    
    
    
    
}


- (void)tapAction:(UITapGestureRecognizer *)sender{
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
//    BaseDetialVC *baseVc = [[BaseDetialVC alloc]init];
    //把网址穿到下一个细节界面
//    _urlStr = [_jsonObject[indexPath.row] objectForKey:@"article_url"];
//    baseVc.urlStr = _urlStr;
//    [self.navigationController pushViewController:baseVc animated:YES];
    NSLog(@"点击成功！");
    
    
    
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
