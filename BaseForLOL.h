//
//  BaseForLOL.h
//  掌上联盟
//
//  Created by mac on 17/8/18.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseForLOL : UIViewController
@property(nonatomic,retain)UIImageView *titleImgV;
@property(nonatomic,retain)UILabel *lab;
@property(nonatomic,retain)UIButton *backBtn;

- (void)setNavgationBarItemName:(NSString *)setString;
- (void)setButtonForBackNavgation;
- (void)setRightBtnForNavgationWithTitle:(NSString *)btnName btnImage:(NSString *)btnImageName;
- (void)setTabBarWithImgNomal:(NSString *)img1 imgSelected:(NSString *)img2 tabBarItem:(NSString *) item;
- (void)LOLaddChildViewControler:(UIViewController *)ViewController MultipleWidth:(int)Multiple;
- (void)LOLaddChildViewControler:(UIViewController *)ViewController MultipleHeigh:(int)Multiple;
- (void)backClick:(UIButton *)btn;
@end
