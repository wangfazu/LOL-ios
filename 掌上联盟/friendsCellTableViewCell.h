//
//  friendsCellTableViewCell.h
//  LOL
//
//  Created by 王发祖 on 2018/4/26.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface friendsCellTableViewCell : UITableViewCell
@property (nonatomic,retain)  UIImageView *headImgV;
@property (nonatomic,retain)  UILabel *nameLab;
@property (nonatomic,retain)  UILabel *gameNameLab;
@property (nonatomic,retain)  UILabel *chatLab;
@property (nonatomic,retain)  UILabel *statusLab;

+(instancetype)TableViewCellWith:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath;
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
@end
