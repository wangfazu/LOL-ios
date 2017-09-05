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

//    self.view.backgroundColor = [UIColor whiteColor];
    [self baseSetNav];
    [self.view addSubview:self.bkBtn];
    [self FZTouchEvent];
    [self initUI];
}

- (void)initUI{
     /*展示网页上面的东西，带有文字标识符号的都可以，直接结果这哥俩转化*/
    /* NSString * htmlString = @"<html><body> Some html string \n <font size=\"13\" color=\"red\">This is some text!</font> </body></html>";
     NSAttributedString * attrStr = [[NSAttributedString alloc] initWithData:[htmlString dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
     UILabel * myLabel = [[UILabel alloc] initWithFrame:self.view.bounds];
     myLabel.attributedText = attrStr;
     [self.view addSubview:myLabel];*/
    UIWebView *web=[[UIWebView alloc]initWithFrame:CGRectMake(0, 64, APPWidth, APPHeight-64 -49)];
    web.backgroundColor = [UIColor whiteColor];
    //加载网页
    NSURL *url=[NSURL URLWithString:_urlStr];
    
    NSURLRequest *req=[NSURLRequest requestWithURL:url];
    [web loadRequest:req];
    
    [self.view addSubview:web];
    
}

- (void)baseSetNav{
    [super setNavgationBarItemName:@""];
    self.titleImgV.backgroundColor = [UIColor whiteColor];
    self.titleImgV.image = [UIImage imageNamed:@""];
    
}

- (UIButton *)bkBtn{
    if (!_bkBtn) {
        _bkBtn = [[UIButton alloc]initWithFrame:CGRectMake(12, 30, 15, 22.1)];

        [_bkBtn setBackgroundImage:[UIImage imageNamed:@"nav_btn_back_tiny_normal"] forState:UIControlStateNormal];
        [self.titleImgV addSubview:_bkBtn];
    }
    return _bkBtn;
}
#pragma mark - 点击事件，管理！！！
- (void)FZTouchEvent{
    [_bkBtn addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];//返回上一个界面
    
}

- (void)backClick{
    [self.navigationController popViewControllerAnimated:YES];
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
