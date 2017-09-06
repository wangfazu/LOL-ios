//
//  CardCell.m
//  LOL
//
//  Created by mac on 17/9/6.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "CardCell.h"

@implementation CardCell

//- (void)awakeFromNib {
//    // Initialization code
//}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier ]) {
        [self setup];
    }
    return self;
    
}

- (void)setup{
    [self addSubview:self.titleLab];
    [self addSubview:self.deciptionLab];
    [self cardImageViewSetUp]; //加载卡片

}

- (UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, APPWidth*2/5, 20)];
        _titleLab.text = @"7.17版本改动：";
        _titleLab.font = [UIFont systemFontOfSize:14];
    }
    
    return _titleLab;
}

- (UILabel *)deciptionLab{
    if (!_deciptionLab) {
        _deciptionLab = [[UILabel alloc]initWithFrame:CGRectMake(_titleLab.marginX +10, 10, APPWidth*2.5/5-10, 20)];
        
    }
    _deciptionLab.textAlignment = NSTextAlignmentRight;
    _deciptionLab.font = [UIFont systemFontOfSize:12];
    _deciptionLab.textColor = [UIColor grayColor];
    _deciptionLab.text = @"已拥有的英雄有两个改动";
    return _deciptionLab;
}

- (void)cardImageViewSetUp{
    _cardScroV = [[UIScrollView alloc]initWithFrame:CGRectMake(0, _titleLab.marginY, APPWidth-10 , APPHeight *0.2298)];
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
        


        /* 左上角lab*/
        _leftLab = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, _cardImgV.width *0.33, 15)];
        _leftLab.text = @"新英雄";
        _leftLab.textColor = [UIColor whiteColor];
        _leftLab.font = [UIFont systemFontOfSize:12];
        [_cardImgV addSubview:_leftLab];
        _leftLab.tag = 300+i;
        
        
        //头像边框
        _heroImgV = [[UIImageView alloc]initWithFrame:CGRectMake(10 +_cardImgV.width/2-_cardImgV.width *0.33/2+(0.37*APPWidth +15)*i, 15, _cardImgV.width *0.33,  _cardImgV.width *0.33)];
        
        _heroImgV.image = [UIImage imageNamed:@"personal_head_background"];
                _heroImgV.backgroundColor =[UIColor redColor];
        _heroImgV.layer.cornerRadius = _cardImgV.width *0.33/2;
        _heroImgV.clipsToBounds = YES;
        _heroImgV.layer.shadowColor = [UIColor whiteColor].CGColor;//阴影颜色
        _heroImgV.layer.shadowRadius = 2;
        [_cardScroV addSubview:_heroImgV];
        _heroImgV.tag = 200+i;
        
        /*hero */
        _heroLab = [[UILabel alloc]initWithFrame:CGRectMake(0, _heroImgV.width/2+10, _cardImgV.width , 15)];
        _heroLab.text = @"山丘之王 卡索";
        _heroLab.textAlignment = NSTextAlignmentCenter;
        _heroLab.font = [UIFont systemFontOfSize:14];
        _heroLab.textColor = [UIColor whiteColor];
//        _heroLab.backgroundColor = [UIColor redColor];
        [_cardImgV addSubview:_heroLab];
        _heroLab.tag = 400+i;

        
        
        /* hero 说明*/
        _tagLab = [[UILabel alloc]initWithFrame:CGRectMake(0, _heroLab.marginY+10, _cardImgV.width, 15)];
        _tagLab.textAlignment = NSTextAlignmentCenter;
        _tagLab.font = [UIFont systemFontOfSize:14];
        _tagLab.textColor = [UIColor whiteColor];
        _tagLab.text = @"战士，坦克";
        [_cardImgV addSubview:_tagLab];
        _tagLab.tag = 500+i;

    }

    
}





/*


- (UIScrollView *)cardScroV{
    if (!_cardScroV) {
        _cardScroV = [[UIScrollView alloc]initWithFrame:CGRectMake(0, _titleLab.marginY, APPWidth-10 , APPHeight *0.2298)];
        _cardScroV.delegate = self;
        _cardScroV.contentSize = CGSizeMake(5*APPWidth*0.52 , 0);
    }
    return _cardScroV;
}

- (void)cardImageViewSetUp{

    for (int i =0; i<5; i++) {
        //
 
        


        //
        _cardImgV = [[UIImageView alloc]init];
        _cardImgV.frame = CGRectMake(10 +(0.37*APPWidth +15)*i, 36, 0.37*APPWidth, 0.37*APPWidth *0.764);
//        _cardImgV.image = [UIImage imageNamed:@"hero_detail_bg"];
        _cardImgV.backgroundColor = [UIColor grayColor];
        _cardImgV.layer.cornerRadius = 5;
        _cardImgV.clipsToBounds = YES;

        [_cardScroV addSubview:_cardImgV];
        
        //头像边框
//        _heroImgV = [[UIImageView alloc]initWithFrame:CGRectMake(10 +_cardImgV.width/2-_cardImgV.width *0.33/2+(0.37*APPWidth +15)*i, 15, _cardImgV.width *0.33,  _cardImgV.width *0.33)];
        
        _heroImgV = [[UIImageView alloc]init];
        CGFloat imgWith = _cardImgV.width *0.33;
        _heroImgV.frame = CGRectMake(10, 0, imgWith, imgWith);
        _heroImgV.image = [UIImage imageNamed:@"personal_head_background"];
//        _heroImgV.backgroundColor =[UIColor grayColor];
        _heroImgV.layer.shadowColor = [UIColor whiteColor].CGColor;//阴影颜色
        _heroImgV.layer.shadowRadius = 2;


        [_cardScroV addSubview:_heroImgV];
        
        //
        _heroLab = [[UILabel alloc]initWithFrame:CGRectMake(_cardImgV.width/2-30, 30, 60, 15)];
        _heroLab.text = @"new hero";
        _heroLab.font = [UIFont systemFontOfSize:14];
        _heroLab.textColor = [UIColor whiteColor];
        [_cardImgV addSubview:_heroLab];

    }


    
    
}

*/
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
