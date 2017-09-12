//
//  SkinCell.h
//  LOL
//
//  Created by mac on 17/9/7.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SkinCell : UITableViewCell<UIScrollViewDelegate>

@property (nonatomic,retain) UILabel *titleLab;
@property (nonatomic,retain) UILabel *deciptionLab;
@property (nonatomic,retain) UIScrollView *cardScroV;
@property (nonatomic,retain) UIImageView *cardImgV;
@property (nonatomic,retain) UIImageView *heroImgV;
@property (nonatomic,retain) UILabel *leftLab;
@property (nonatomic,retain) UILabel *heroLab;
@property (nonatomic,retain) UILabel *tagLab;
@property (nonatomic,retain) UIImageView  *heroBGImgV;
@property (nonatomic,retain) UIImageView  *heroKuangImgV;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@end
