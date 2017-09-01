//
//  findCell.h
//  LOL
//
//  Created by mac on 17/9/1.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface findCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UISwitch *swich1;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;

+(instancetype)TableViewCellWith:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath;


@end
