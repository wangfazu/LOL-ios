//
//  MoveCell.h
//  LOL
//
//  Created by mac on 17/9/5.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoveCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *changeLab;
@property (weak, nonatomic) IBOutlet UILabel *heroNumLab;
@property (weak, nonatomic) IBOutlet UIScrollView *heroScrV;
@property (nonatomic,retain) UIView *bgV;
+(instancetype)VersionTableViewCellWith:(UITableView *)tableView
                           indexPath:(NSIndexPath *)indexPath;
@end
