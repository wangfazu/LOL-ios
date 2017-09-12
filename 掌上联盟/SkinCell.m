//
//  SkinCell.m
//  LOL
//
//  Created by mac on 17/9/7.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "SkinCell.h"

@implementation SkinCell

- (void)awakeFromNib {
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier ]) {
        [self setup];
    }
    return self;
}

- (UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
        _titleLab.text = @"7.17版本改动：";
        _titleLab.font = [UIFont systemFontOfSize:14];
    }
    
    return _titleLab;
}

- (UILabel *)deciptionLab{
    if (!_deciptionLab) {
        _deciptionLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
        
    }
    _deciptionLab.textAlignment = NSTextAlignmentRight;
    _deciptionLab.font = [UIFont systemFontOfSize:12];
    _deciptionLab.textColor = [UIColor grayColor];
    _deciptionLab.text = @"已拥有的英雄有两个改动";
    return _deciptionLab;
}
- (void)setup{
    
    [self addSubview:self.titleLab];
    [self addSubview:self.deciptionLab];
    /*  在 cell 上面添加 图片，标题，简要说明*/
    _cardScroV = [[UIScrollView alloc]initWithFrame:CGRectMake(0, _titleLab.marginY-20, APPWidth-10 , APPHeight *0.2298)];
    _cardScroV.delegate = self;
    _cardScroV.contentSize = CGSizeMake(5*APPWidth*0.52 , 0);
    [self addSubview:_cardScroV];
    
    
    /*  */
    for (int i=0; i<5; i++) {
        _cardImgV = [[UIImageView alloc]init];
        _cardImgV.frame = CGRectMake(10 +(0.37*APPWidth +15)*i, 36, 0.37*APPWidth, 0.37*APPWidth *0.764);
        //        _cardImgV.image = [UIImage imageNamed:@"hero_detail_bg"];
        _cardImgV.backgroundColor = [UIColor grayColor];
        _cardImgV.layer.cornerRadius = 5;
        _cardImgV.clipsToBounds = YES;
        
        [_cardScroV addSubview:_cardImgV];
        _cardImgV.tag = 100+i;
    
        
        //头像
        _heroImgV = [[UIImageView alloc]initWithFrame:CGRectMake(10 +(0.37*APPWidth +15)*i+5, _cardImgV.height +5, _cardImgV.width *0.20,  _cardImgV.width *0.20)];
        
        _heroImgV.backgroundColor =[UIColor redColor];
        _heroImgV.layer.cornerRadius = _heroImgV.width/2;
        _heroImgV.clipsToBounds = YES;
        
        [_cardScroV addSubview:_heroImgV];
        _heroImgV.tag = 200+i;
        
        /*hero */
        _heroLab = [[UILabel alloc]initWithFrame:CGRectMake(_heroImgV.width+10, _cardImgV.height-22.5, _cardImgV.width , 15)];
        _heroLab.text = @"山丘之王 卡索";
        _heroLab.textAlignment = NSTextAlignmentLeft;
        _heroLab.font = [UIFont systemFontOfSize:12];
        _heroLab.textColor = [UIColor whiteColor];
        //        _heroLab.backgroundColor = [UIColor redColor];
        [_cardImgV addSubview:_heroLab];
        _heroLab.tag = 400+i;
        

        
    }
    

    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
