//
//  DT_BaseCell.h
//  LOL
//
//  Created by mac on 17/8/21.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DT_BaseCell : UITableViewCell
@property (nonatomic,retain) UIImageView *imgV;
@property (nonatomic,retain) UILabel *titLab;
@property (nonatomic,retain) UILabel *detilLab;
@property (nonatomic,retain) UILabel *readNum;
@property (nonatomic,retain) UILabel *author;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
@end
