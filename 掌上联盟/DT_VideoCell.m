//
//  DT_VideoCell.m
//  LOL
//
//  Created by mac on 17/8/23.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "DT_VideoCell.h"
#import "ZXVideoPlayerController.h"
#import "VideoPlayViewController.h"
@implementation DT_VideoCell
{
    ZXVideo *video;
    VideoPlayViewController *videoVc;
    ZXVideoPlayerController *zxVideoControler;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier ]) {
//        [self setup];

        [self addVideo];
    }
    return self;
}

- (void)addVideo{
    video = [[ZXVideo alloc] init];
    video.playUrl = @"http://baobab.wdjcdn.com/1451897812703c.mp4";
    video.title = @"Rollin'Wild 圆滚滚的";
    
    videoVc = [[VideoPlayViewController alloc] init];
    [[DT_LastVC new]addChildViewController:videoVc];
    videoVc.video = video;
    videoVc.hidesBottomBarWhenPushed = YES;
    videoVc.view.frame = CGRectMake(0, 0, APPWidth-20, (APPWidth -20)*0.5265 +40);
    [self addSubview:videoVc.view];
    [videoVc didMoveToParentViewController:[DT_LastVC new]];


}
- (void)setup{
    /*  在 cell 上面添加 图片，标题，简要说明*/
    //方法2:适用于帧数多的gif动画，在这个背景上面添加 登录 按钮
    NSData *localData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"login_quick_btn_normal" ofType:@"gif"]];
    _gifImageView = [[LLGifImageView alloc] initWithFrame:CGRectMake(0, 0, APPWidth , APPWidth *0.52) data:localData];
    [self addSubview:_gifImageView];
    [_gifImageView startGif];

}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    NSLog(@"you select this cell for video!");

    // Configure the view for the selected state
}

@end
