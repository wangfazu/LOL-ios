//
//  MineCell.m
//  LOL
//
//  Created by mac on 17/9/1.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "MineCell.h"

@implementation MineCell

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
    _img1.backgroundColor = [UIColor redColor];
    _img2.backgroundColor = [UIColor redColor];
    _img3.backgroundColor = [UIColor redColor];
    _img1.layer.cornerRadius = 10;
    _img1.clipsToBounds = YES;
    _img2.layer.cornerRadius = 10;
    _img2.clipsToBounds = YES;
    _img3.layer.cornerRadius = 10;
    _img3.clipsToBounds = YES;
    /*222*/
    _imgA.backgroundColor = [UIColor redColor];
    _imgB.backgroundColor = [UIColor redColor];
    _imgC.backgroundColor = [UIColor redColor];
    _imgD.backgroundColor = [UIColor redColor];
    _imgE.backgroundColor = [UIColor redColor];
    _imgF.backgroundColor = [UIColor redColor];
    
    /*3*/
    _im1.backgroundColor = [UIColor redColor];
    _im2.backgroundColor = [UIColor redColor];
    _im3.backgroundColor = [UIColor redColor];
    _im4.backgroundColor = [UIColor redColor];



}


+(instancetype)TableViewCellWith:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath{
    MineCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MineCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MineCell" owner:self options:nil]objectAtIndex:0];
    }
    
    
    
    return cell;
    
}

- (void)fzGetDataSourseForCell{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
