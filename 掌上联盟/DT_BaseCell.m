//
//  DT_BaseCell.m
//  LOL
//
//  Created by mac on 17/8/21.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "DT_BaseCell.h"

@implementation DT_BaseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier ]) {
        [self setup];
    }
    return self;
}

- (void)setup{
    /*  在 cell 上面添加 图片，标题，简要说明,作者*/
    [self addSubview:self.imgV];
    [self addSubview:self.titLab];
    [self addSubview:self.detilLab];
    [self addSubview:self.readNum];
    [self addSubview:self.author];
    
}
- (UIImageView *)imgV{
    if (!_imgV) {
        _imgV = [[UIImageView alloc]initWithFrame:CGRectMake(7.5, 10, (APPHeight /7.5 - 20) *1.26, APPHeight /7.5 - 20)];
        _imgV.image = [UIImage imageNamed:@"guide_center_icon"];
        _imgV.layer.cornerRadius = 5;
        _imgV.clipsToBounds = YES;
//        _imgV.backgroundColor =[UIColor redColor];
    }
    return _imgV;
}

- (UILabel *)titLab{
    if (!_titLab) {
        _titLab = [UILabel new];
        _titLab.frame = CGRectMake(_imgV.marginX +10, 10, APPWidth -_imgV.marginX-30, 20);
        _titLab.text = @"无限活力再次来袭";
        _titLab.font = [UIFont systemFontOfSize:12 weight:1];
        _titLab.numberOfLines = 0;
//        _titLab.backgroundColor = [UIColor redColor];
    }
    
    return _titLab;
}

- (UILabel *)detilLab{
    if (!_detilLab) {
        _detilLab = [UILabel new];
        _detilLab.frame = CGRectMake(_imgV.marginX +10, _titLab.marginY +5 , APPWidth -_imgV.marginX-10-20, _imgV.height/2.3);
        _detilLab.text = @"此次的大乱斗在保持原味的基础上，增加了随机分配角色的驾乘奖励";
        _detilLab.font = [UIFont systemFontOfSize:10 ];
        _detilLab.textColor = UIColorFromRGB(0xaaaaaa);
//        _detilLab.backgroundColor = [UIColor grayColor];
        _detilLab.numberOfLines = 0;
    }
    
    return _detilLab;
}

- (UILabel *)readNum{
    if (!_readNum) {
        _readNum = [UILabel new];
        _readNum.frame = CGRectMake(_imgV.marginX +10, _detilLab.marginY, APPWidth -_imgV.marginY-10, 20);
        NSInteger aint = 10;
        _readNum.text = [NSString stringWithFormat:@"%ld阅",(long)aint];
        _readNum.textColor = APPColor;
        _readNum.font = [UIFont systemFontOfSize:11];
//        _readNum.backgroundColor = [UIColor redColor];
    }
    
    return _readNum;
}

- (UILabel *)author{
    if (!_author) {
        _author = [[UILabel alloc]initWithFrame:CGRectMake(APPWidth -100-20, _readNum.orginY, 100, 20)];
        _author.textAlignment = NSTextAlignmentRight;
        _author.font = [UIFont systemFontOfSize:11];
        _author.textColor = APPColor;
    }
    return _author;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
