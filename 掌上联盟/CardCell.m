//
//  CardCell.m
//  LOL
//
//  Created by mac on 17/9/6.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "CardCell.h"

@implementation CardCell
{
    
    NSArray *jsonObject;

}
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
        
        //头像白色背景
        _heroBGImgV = [[UIImageView alloc]initWithFrame:CGRectMake(10-2 +_cardImgV.width/2-_cardImgV.width *0.33/2+(0.37*APPWidth +15)*i, 15-2, _cardImgV.width *0.33+4,  _cardImgV.width *0.33+4)];
        
        _heroBGImgV.backgroundColor =[UIColor whiteColor];
        _heroBGImgV.layer.cornerRadius = _cardImgV.width *0.33/2;
        _heroBGImgV.clipsToBounds = YES;
//        _heroBGImgV.layer.shadowColor = [UIColor whiteColor].CGColor;//阴影颜色
//        _heroBGImgV.layer.shadowRadius = 2;
        [_cardScroV addSubview:_heroBGImgV];
        _heroBGImgV.tag = 600+i;
        
        //头像边框
        _heroKuangImgV = [[UIImageView alloc]initWithFrame:CGRectMake(10-1.5 +_cardImgV.width/2-_cardImgV.width *0.33/2+(0.37*APPWidth +15)*i, 15-1.5, _cardImgV.width *0.33+3,  _cardImgV.width *0.33+3)];
        _heroKuangImgV.image = [UIImage imageNamed:@"personal_head_background"];
        _heroKuangImgV.backgroundColor =[UIColor whiteColor];
        _heroKuangImgV.layer.cornerRadius = _cardImgV.width *0.33/2;
        _heroKuangImgV.clipsToBounds = YES;
        [_cardScroV addSubview:_heroKuangImgV];
        
        //头像
        _heroImgV = [[UIImageView alloc]initWithFrame:CGRectMake(10 +_cardImgV.width/2-_cardImgV.width *0.33/2+(0.37*APPWidth +15)*i, 15, _cardImgV.width *0.33,  _cardImgV.width *0.33)];
        
                _heroImgV.backgroundColor =[UIColor redColor];
        _heroImgV.layer.cornerRadius = _cardImgV.width *0.33/2;
        _heroImgV.clipsToBounds = YES;

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


- (void)fzGetData:(NSIndexPath*)indexPath cardCell:(CardCell *)cell{

    for ( int i = 0; i<5; i++) {
        //整体卡片
        UIImageView *cardImgv = [cell viewWithTag:100+i];
        [cardImgv sd_setImageWithURL:[NSURL URLWithString: [[jsonObject[indexPath.row] objectForKey:@"cardlist"][i] objectForKey:@"hero_bg_img_url"]]
                    placeholderImage:[UIImage imageNamed:@"placeholder"]];
        
        //卡片左上角
        cell.leftLab = [cell viewWithTag:300+i];
        NSString *hero_tag = [[jsonObject[0] objectForKey:@"cardlist"][0] objectForKey:@"hero_tag"];
        if ([hero_tag isEqualToString:@" "]) {
            cell.leftLab.text = @"已拥有";
            
            
            NSLog(@"%@",hero_tag);
        }
        
        //头像
        cell.heroImgV = [cell viewWithTag:200+i];
        [cell.heroImgV sd_setImageWithURL:[NSURL URLWithString: [[jsonObject[indexPath.row] objectForKey:@"cardlist"][i] objectForKey:@"hero_head_img_url"]]
                         placeholderImage:[UIImage imageNamed:@"placeholder"]];
        
        //hero
        cell.heroLab = [cell viewWithTag:400+i];//hero_name   hero_nick
        NSString *hero_name = [[jsonObject[indexPath.row] objectForKey:@"cardlist"][i] objectForKey:@"hero_name"];
        NSString *hero_nick = [[jsonObject[indexPath.row] objectForKey:@"cardlist"][i] objectForKey:@"hero_nick"];
        cell.heroLab.text = [NSString stringWithFormat:@"%@ %@",hero_nick,hero_name];
        
        //hero_desc
        cell.tagLab = [cell viewWithTag:500+i];
        cell.tagLab.text = [[jsonObject[indexPath.row] objectForKey:@"cardlist"][i] objectForKey:@"hero_desc"];
        NSLog(@"%@",cell.tagLab.text);
        
    }
}

- (void)initDataSourse{
    
    NSString *urlString = @"http://qt.qq.com/lua/lol_news/recommend?cid=367&areaid=4&plat=android&version=9750";
    /**
     *  对网址转码
     *
     *  @param NSString 。
     *   转换完毕后在发送网络请求
     *  @return 。
     */
    [[MyHttpRequesr alloc]getHttpRequest:urlString key:@"card"];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getJsonObjectForNetWorkCard:) name:@"card" object:nil];
    
}

- (void)getJsonObjectForNetWorkCard:(NSNotification *)notification{
    NSLog(@"%@",notification.userInfo[@"list"]);
    jsonObject = notification.userInfo[@"list"];
    /*数据加载完成，开始加载UI*/
//    [self.view addSubview:self.versionTV];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    
    //    [mytableView reloadData];
    
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
