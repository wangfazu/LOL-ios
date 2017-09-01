//
//  shopCell.m
//  LOL
//
//  Created by mac on 17/9/1.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "shopCell.h"

@implementation shopCell

- (void)awakeFromNib {

    [super awakeFromNib];
}

+(instancetype)shopTableViewCellWith:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath{
    shopCell *cell = [tableView dequeueReusableCellWithIdentifier:@"shopCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"shopCell" owner:self options:nil]objectAtIndex:1];
    }
//    cell.img1.image = [UIImage imageNamed:@"1.jpg"];
//    cell.img2.image = [UIImage imageNamed:@"1.jpg"];
//    cell.img3.image = [UIImage imageNamed:@"1.jpg"];

    return cell;
    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
