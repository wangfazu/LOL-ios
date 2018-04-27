//
//  friendsCellTableViewCell.m
//  LOL
//
//  Created by 王发祖 on 2018/4/26.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "friendsCellTableViewCell.h"

@implementation friendsCellTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _headImgV.backgroundColor = RandomColor;
    
}
+(instancetype)TableViewCellWith:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath{
    friendsCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"fCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"friendsCellTableViewCell" owner:self options:nil]objectAtIndex:0];
    }
    
    
    
    return cell;
    
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier ]) {
        [self setup];
    }
    return self;
}

- (void)setup{
    /*  在 cell 上面添加 图片，标题，简要说明,作者*/
    _headImgV = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 80, 80)];
    _headImgV.layer.cornerRadius = 10;
    _headImgV.clipsToBounds = YES;
    _headImgV.backgroundColor = RandomColor;
    [self addSubview:_headImgV];
    
    _nameLab = [[UILabel alloc]initWithFrame:CGRectMake(_headImgV.marginX +20, 10, 120, 20)];
    _nameLab.textColor = RandomColor;
//    _nameLab.text = @"999";
    [self addSubview:_nameLab];
    
    _gameNameLab = [[UILabel alloc]initWithFrame:CGRectMake(_headImgV.marginX +20, _nameLab.marginY+30, 100, 20)];
    _gameNameLab.textColor = RandomColor;
//    _gameNameLab.text = @"0000";
    [self addSubview:_gameNameLab];
    
    _chatLab = [[UILabel alloc]initWithFrame:CGRectMake(APPWidth - 90, 20, 70, 30)];
    _chatLab.text = @"聊天";
    _chatLab.textColor = APPColor;
    [self addSubview:_chatLab];
    
    _statusLab = [[UILabel alloc]initWithFrame:CGRectMake(APPWidth - 90, _gameNameLab.orginY, 80, 30)];
    _statusLab.text = @"游戏中";
    _statusLab.textColor = APPColor;
    [self addSubview:_statusLab];
    
   
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
