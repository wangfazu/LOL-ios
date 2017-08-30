//
//  VideoPlayViewController.m
//  ZXVideoPlayer
//
/*
 锦戏
 来到锦城演了一出戏，可惜我不是男主角，你也不在这里！
 
 关于锦城的回忆
 没有太多的记忆
 只有那打不完的RPG
 那年考试三百多分
 不知将要何去何从
 无耐之下选了锦城
 不料进去了大学的校门
 一四年的八月二十六号
 我们一起来到这里报道
 爸爸妈妈还在耳边唠叨
 学长已经把学妹进行了骚扰
 一万七千九百八的学费
 不想就这样被自己浪费
 慢慢地觉得自己活着很累
 
 看到别人撩妹
 看到别人喝醉
 看到别人入睡
 看到别人憔悴
 看到别人心碎
 看到别人把知识点使劲地背
 召唤师的峡谷
 多少人曾迷路
 有人练着手速
 有人变得很酷
 有人变得好赌
 有人装作糊涂
 有人变得孤独
 有人缺已成熟
 有人带着妹子来到杏岛住
 有人想要重回自己的故土
 有人变得出色
 有人变得好色
 有人却很快乐
 我只想说成都的天气真的好热
 
 
 没有西南交大夜市的繁华
 没有电子科大电竞的网吧
 还不如去看成都学院校外的喇叭花
 
 五千万的设备
 听着都很心累
 
 锦城就是这样
 学校给你希望
 老师对你期望
 家长对你盼望
 考试你在张望
 大家对你失望
 最终只剩绝望
 课前没有预习
 上课没有自习
 下课没有温习
 考前没有复习

 
 
 
 
*/
//  Created by Shawn on 16/4/29.
//  Copyright © 2016年 Shawn. All rights reserved.
//

#import "VideoPlayViewController.h"
#import "ZXVideoPlayerController.h"
#import "ZXVideo.h"

@interface VideoPlayViewController ()

@property (nonatomic, strong) ZXVideoPlayerController *videoController;

@end

@implementation VideoPlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    self.view.backgroundColor = [UIColor clearColor];
    [self playVideo];
}

- (void)playVideo
{
    if (!self.videoController) {
        self.videoController = [[ZXVideoPlayerController alloc] initWithFrame:CGRectMake(0, 0, kZXVideoPlayerOriginalWidth, APPWidth*0.68)];
        
        __weak typeof(self) weakSelf = self;
        self.videoController.videoPlayerGoBackBlock = ^{
            __strong typeof(self) strongSelf = weakSelf;
            

            
            [strongSelf.navigationController popViewControllerAnimated:YES];
            [strongSelf.navigationController setNavigationBarHidden:NO animated:YES];
            
            [[NSUserDefaults standardUserDefaults] setObject:@0 forKey:@"ZXVideoPlayer_DidLockScreen"];
            
            strongSelf.videoController = nil;
        };
        
        self.videoController.videoPlayerWillChangeToOriginalScreenModeBlock = ^(){
            NSLog(@"切换为竖屏模式");
        };
        self.videoController.videoPlayerWillChangeToFullScreenModeBlock = ^(){
            NSLog(@"切换为全屏模式");
        };
        
        [self.videoController showInView:self.view];
    }
    
    self.videoController.video = self.video;
}

@end
