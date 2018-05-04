//
//  SheQuViewController.m
//  LOL
//
//  Created by 王发祖 on 2018/5/5.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "SheQuViewController.h"
//#import "<#header#>"
@interface SheQuViewController ()

@end

@implementation SheQuViewController
{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    for (int i = 0; i<3; i++) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(APPWidth/3*i, 44, APPWidth/3, 50)];
        btn.backgroundColor = RandomColor;
        btn.tag = 100+i;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    
    
    // Do any additional setup after loading the view.
}
- (void)btnClick:(UIButton *)btn{
    NSLog(@"~~~~%ld",btn.tag);
    
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
