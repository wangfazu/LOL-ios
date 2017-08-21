//
//  DT_BaseCell.m
//  LOL
//
//  Created by mac on 17/8/21.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "DT_BaseCell.h"

@implementation DT_BaseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier ]) {
        [self setup];
    }
    return self;
}

- (void)setup{
    
    UIImageView *imgV =[ UIImageView new];
    imgV.frame = CGRectMake(10, 10, 70, 70);
    imgV.image = [UIImage imageNamed:@"guide_center_icon"];
    [self addSubview:imgV];
    
}





- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
