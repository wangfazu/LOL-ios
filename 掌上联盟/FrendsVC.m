//
//  FrendsVC.m
//  掌上联盟
//
//  Created by mac on 17/8/18.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "FrendsVC.h"

@interface FrendsVC ()

@end

@implementation FrendsVC


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    self.navigationController.navigationBarHidden = NO;


}

- (void)viewDidLoad {
    [super viewDidLoad];
    //加上 搜索栏
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 35)];//allocate titleView
    UIColor *color =  self.navigationController.navigationBar.barTintColor;
    
    [titleView setBackgroundColor:color];

//    titleView.backgroundColor = [UIColor redColor];
    UISearchBar *searchBar = [[UISearchBar alloc] init];
    
    searchBar.delegate = self;
    searchBar.frame = CGRectMake(0, 0, 200, 35);
    searchBar.backgroundColor = color;
    searchBar.layer.cornerRadius = 18;
    searchBar.layer.masksToBounds = YES;
    [searchBar.layer setBorderWidth:8];
    [searchBar.layer setBorderColor:[UIColor whiteColor].CGColor];  //设置边框为白色
    
    searchBar.placeholder = @"搜索你想要的";
    [titleView addSubview:searchBar];
    
    //Set to titleView
    [self.navigationItem.titleView sizeToFit];
    [self.view addSubview:titleView];
//    self.navigationItem.titleView = titleView;


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
