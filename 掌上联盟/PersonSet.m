//
//  PersonSet.m
//  LOL
//
//  Created by mac on 17/8/21.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "PersonSet.h"

@interface PersonSet ()

@end

@implementation PersonSet
{
    UIImageView *bgImgV ;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //添加背景图片
    [self.view addSubview:[self bgView]];

    
}

- (UIView *)bgView{
    if (!bgImgV) {
        bgImgV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, APPWidth, APPHeight)];
        bgImgV.image = [UIImage imageNamed:@"twoDimension_view_background" ];
    }
    return bgImgV;
    
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
