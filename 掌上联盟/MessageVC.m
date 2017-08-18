//
//  MessageVC.m
//  掌上联盟
//
//  Created by mac on 17/8/18.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "MessageVC.h"

@interface MessageVC ()

@end

@implementation MessageVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setTabBarWithImgNomal:@"tab_icon_news_normal" imgSelected:@"tab_icon_news_press" tabBarItem:@"资讯"];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"资讯";
    // Do any additional setup after loading the view.
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
