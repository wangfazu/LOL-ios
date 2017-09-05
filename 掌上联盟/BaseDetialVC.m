//
//  BaseDetialVC.m
//  LOL
//
//  Created by mac on 17/9/5.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "BaseDetialVC.h"

@interface BaseDetialVC ()

@end

@implementation BaseDetialVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor grayColor];
    [self setNavgationBarItemName:@"0.0"];
    [self setButtonForBackNavgation];
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
