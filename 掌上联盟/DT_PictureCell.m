//
//  DT_PictureCell.m
//  LOL
//
//  Created by mac on 17/8/23.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "DT_PictureCell.h"

@implementation DT_PictureCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier ]) {
        [self setup];
    }
    return self;
}

- (void)setup{
    /*  在 cell 上面添加 图片，标题，简要说明*/
    [self addSubview:self.title];
    [self addSubview:self.detiLab];
    [self addSubview:self.bigImgV];
    [self addSubview:self.topImgV];
    [self addSubview:self.underImgV];
    [self addSubview:self.readNum];
}
- (UILabel *)title{
    if (!_title) {
        _title = [UILabel new];
        _title.frame = CGRectMake(10, 10, APPWidth -20, 20);
    }
    _title.text = @"青春美少女，迦纳COS";
    _title.font = [UIFont systemFontOfSize:16];
    return _title;
}
- (UILabel *)detiLab{
    if (!_detiLab) {
        _detiLab = [UILabel new];
    }
    _detiLab.frame = CGRectMake(10, _detiLab.marginY +10, APPWidth - 20, 14);
    _detiLab.textColor = UIColorFromRGB(0xababab);
    _detiLab.font = [UIFont systemFontOfSize:13];
    _detiLab.text = @"真理之意，与我同在！";
    return _detiLab;
}
- (UIImageView *)bigImgV{
    if (!_bigImgV) {
        _bigImgV = [UIImageView new];
    }
    _bigImgV.frame = CGRectMake(10, _detiLab.marginY +15, (APPWidth -20) *0.76, _bigImgV.width *0.48);

    _bigImgV.image = [UIImage imageNamed:@"jiana"];
    return _bigImgV;
}
- (UIImageView *)topImgV{
    if (!_topImgV) {
        _topImgV = [UIImageView new];
    }
    _topImgV.frame = CGRectMake(_bigImgV.marginX +5, _bigImgV.orginY, (APPWidth -20) *0.176, (APPWidth -20) *0.176);
    _topImgV.image = [UIImage imageNamed:@"jiana2"];

    return _topImgV;
}
- (UIImageView *)underImgV{//690   526    120
    if (!_underImgV) {
        _underImgV = [UIImageView new];

    }
    _underImgV.frame = CGRectMake(_bigImgV.marginX +5, _topImgV.marginY +5, (APPWidth -20) *0.176, (APPWidth -20) *0.176);
    _underImgV.image = [UIImage imageNamed:@"jiana2"];
    return _underImgV;
}

- (UILabel *)readNum{
    if (!_readNum) {
        _readNum = [UILabel new];
        
    }
    _readNum.frame = CGRectMake(10, _bigImgV.marginY +15, APPWidth -200, 15);
    _readNum.text = @"38.8W 阅";
    _readNum.textColor = APPColor;
    _readNum.font = [UIFont systemFontOfSize:12];
    return _readNum;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
