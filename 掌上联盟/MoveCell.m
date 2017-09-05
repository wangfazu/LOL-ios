//
//  MoveCell.m
//  LOL
//
//  Created by mac on 17/9/5.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "MoveCell.h"

@implementation MoveCell
- (void)awakeFromNib {
    [super awakeFromNib];//0.75w   0.3736   top:35
}

+(instancetype)VersionTableViewCellWith:(UITableView *)tableView
                              indexPath:(NSIndexPath *)indexPath{
    MoveCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MoveCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MoveCell" owner:self options:nil]firstObject];
        [cell fzCreatHeroView:cell.bgV];

    }
    return cell;
    
}

- (void)fzCreatHeroView:(UIView *)bgv{
    for (int i =0; i<5; i++) {
        bgv = [[UIView alloc]init ];
        bgv.frame = CGRectMake((APPWidth *0.3736 +10)*i, 10, APPWidth *0.3736, APPWidth *0.3736*0.75);
        bgv.backgroundColor =[UIColor redColor];
        bgv.layer.cornerRadius = 5;
        bgv.clipsToBounds = YES;
        [self.heroScrV addSubview:bgv];
        
    }
}
- (UIView *)bgV{
    if (!_bgV) {
        _bgV = [[UIView alloc]init ];

    }

    return _bgV;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
