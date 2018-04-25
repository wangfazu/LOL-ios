//
//  YourVC.m
//  LOL
//
//  Created by mac on 17/8/31.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "YourVC.h"

@implementation YourVC
{
    UIButton *btn;
    UITextField *textF;
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
}
- (void)viewDidLoad{
    
    [self.view addSubview:[self btn]];
    [self.view addSubview:[self textF]];
    
}

-(UIButton *)btn{
    if (!btn) {
        [super viewDidLoad];
        self.view.backgroundColor = [UIColor whiteColor];
        btn = [UIButton new];
        btn.frame = CGRectMake(APPWidth/2-50, APPHeight/2, 100, 30);
        btn.backgroundColor = [UIColor redColor];
        [btn addTarget:self action:@selector(ceeatNewWord) forControlEvents:UIControlEventTouchUpInside];
    }
    return btn;

}

- (UITextField *)textF{
    if (!textF) {
        textF = [[UITextField alloc]initWithFrame:CGRectMake(APPWidth/2-100, APPHeight/2-50, 200, 40)];
        textF.placeholder = @"pease input text to go to home!";
        textF.textAlignment = NSTextAlignmentCenter;
    }
    return textF;
}
- (void)ceeatNewWord{
//    textF.text = @"please left baby!";
//    [btn setTitle:textF.text forState:UIControlStateNormal];
//
    NSLog(@"--%@--",textF.text);
    
    
    
    if (_delegate && [_delegate respondsToSelector:@selector(fzCreatView)]) {
        [_delegate fzCreatView];
        [self.navigationController popViewControllerAnimated:YES];

    };


}
@end
