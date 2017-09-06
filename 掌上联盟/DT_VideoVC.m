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
    // Do any additional setup after loading the view.
    _heroImgV = [[UIImageView alloc]initWithFrame:CGRectMake(APPWidth/2-28.5, 100, 57, 57)];
    _heroImgV.image = [UIImage imageNamed:@"personal_head_background"];
//    _heroImgV.backgroundColor =[UIColor grayColor];
    [self.view addSubview:_heroImgV];
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
