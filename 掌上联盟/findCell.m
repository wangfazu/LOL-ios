//
//  findCell.m
//  LOL
//
//  Created by mac on 17/9/1.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "findCell.h"

@implementation findCell
+(instancetype)TableViewCellWith:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath{
    findCell *cell = [tableView dequeueReusableCellWithIdentifier:@"findCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"findCell" owner:self options:nil]objectAtIndex:0];
    }

    
    
    return cell;
    
    
}



- (void)awakeFromNib {
    [super awakeFromNib];
    self.frame= CGRectMake(0, 0, APPWidth, 30);

    _nameLab.frame = CGRectMake(10, 10, APPWidth/2, 30);
    _nameLab.backgroundColor = [UIColor redColor];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
