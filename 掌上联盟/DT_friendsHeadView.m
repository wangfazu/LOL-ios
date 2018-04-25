//
//  DT_friendsHeadView.m
//  LOL
//
//  Created by 王发祖 on 2018/4/25.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "DT_friendsHeadView.h"

@implementation DT_friendsHeadView
{
}
BOOL isDeleteFriends = YES;
BOOL isDeleteSheQu = YES;
BOOL isDeleteShowLove = YES;


- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self initDataSourse];
        self.frame = CGRectMake(0, 0, APPWidth, 50);
        //添加一个scrollView；
//        self.backgroundColor = [UIColor redColor];
    }
    return self;
    
}
- (void)initDataSourse{
    _activeBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, APPWidth/2 -20, 30)];
    [_activeBtn setTitle:@"好友聊天" forState:UIControlStateNormal];
    [_activeBtn setBackgroundColor:[UIColor blueColor]];
    [_activeBtn addTarget:self action:@selector(friendsClick)
forControlEvents:UIControlEventTouchUpInside];
    [_activeBtn setTitleColor:APPColor forState:UIControlStateNormal];
    
    [self addSubview:_activeBtn];

    _nearBtn = [[UIButton alloc]initWithFrame:CGRectMake(10 +_activeBtn.marginX, 10, APPWidth/4 -10, 30)];
    [_nearBtn setTitle:@"社区" forState:UIControlStateNormal];
    [_nearBtn setBackgroundColor:[UIColor blackColor]];
    [_nearBtn setTitleColor:APPColor forState:UIControlStateNormal];

    [_nearBtn addTarget:self action:@selector(sheQuClick) forControlEvents:UIControlEventTouchUpInside];

    [self addSubview:_nearBtn];
    
    _showLoveBtn = [[UIButton alloc]initWithFrame:CGRectMake(_nearBtn.marginX +10, 10, APPWidth/4 -10, 30)];
    [_showLoveBtn setTitle:@"秀恩爱" forState:UIControlStateNormal];
    [_showLoveBtn setTitleColor:APPColor forState:UIControlStateNormal];
    [_showLoveBtn setBackgroundColor:[UIColor orangeColor]];
    [_showLoveBtn addTarget:self action:@selector(showLoveClick) forControlEvents:UIControlEventTouchUpInside];

    [self addSubview:_showLoveBtn];
    
    ///
    NSArray * array = [NSArray arrayWithObjects:@"默认",@"销量",@"价格",@"时间", nil];
    for (int i = 0; i<4; i ++) {
        UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(80*i, 0, 80, 40)];
        [button setTitle:[array objectAtIndex:i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        [button.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [button.layer setBorderWidth:0.3];
        button.userInteractionEnabled = YES;
        [button addTarget:self action:@selector(buttonSelected:) forControlEvents:UIControlEventTouchUpInside];
        [button setBackgroundColor:[UIColor whiteColor]];
        [button setTag:i];
//        [self addSubview:button];
        
        
    }

}
- (void)buttonSelected:(UIButton*)sender{
        if (_tmpBtn == nil){
            sender.selected = YES;
            _tmpBtn = sender;
        }
        else if (_tmpBtn !=nil && _tmpBtn == sender){
            sender.selected = YES;
    
        }
        else if (_tmpBtn!= sender && _tmpBtn!=nil){
            _tmpBtn.selected = NO;
            sender.selected = YES;
            _tmpBtn = sender;
        }
    [_tmpBtn setBackgroundColor:[UIColor clearColor]];
    NSLog(@"%@",_tmpBtn.titleLabel.text);
}
- (void)friendsClick{
//    NSLog(@"")
    if (isDeleteFriends == YES) {
        [_activeBtn setBackgroundColor:[UIColor clearColor]];
        isDeleteFriends = NO;
    }else{
        [_activeBtn setBackgroundColor:[UIColor blueColor]];

        isDeleteFriends = YES;

    }
}
- (void)sheQuClick{
    //    NSLog(@"")
    if (isDeleteSheQu == YES) {
        [_nearBtn setBackgroundColor:[UIColor clearColor]];
        isDeleteSheQu = NO;
    }else{
        [_nearBtn setBackgroundColor:[UIColor blackColor]];
        
        isDeleteSheQu = YES;
        
    }
}
- (void)showLoveClick{
    //    NSLog(@"")
    if (isDeleteShowLove == YES) {
        [_showLoveBtn setBackgroundColor:[UIColor clearColor]];
        isDeleteShowLove = NO;
    }else{
        [_showLoveBtn setBackgroundColor:[UIColor orangeColor]];
        
        isDeleteShowLove = YES;
        
    }
}


///
//-（void）buttonSelected:(UIButton*)sender{
//    if (_tmpBtn == nil){
//        sender.selected = YES;
//        _tmpBtn = sender;
//    }
//    else if (_tmpBtn !=nil && _tmpBtn == sender){
//        sender.selected = YES;
//
//    }
//    else if (_tmpBtn!= btn && _tmpBtn!=nil){
//        _tmpBtn.selected = NO;
//        sender.selected = YES;
//        _tmpBtn = btn;
//    }
//
//
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
