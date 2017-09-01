//
//  MineCell.h
//  LOL
//
//  Created by mac on 17/9/1.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MineCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *img1;
@property (weak, nonatomic) IBOutlet UIImageView *img2;
@property (weak, nonatomic) IBOutlet UIImageView *img3;

/*2*/
@property (weak, nonatomic) IBOutlet UIImageView *imgB;
@property (weak, nonatomic) IBOutlet UIImageView *imgA;
@property (weak, nonatomic) IBOutlet UIImageView *imgC;
@property (weak, nonatomic) IBOutlet UIImageView *imgD;
@property (weak, nonatomic) IBOutlet UIImageView *imgE;
@property (weak, nonatomic) IBOutlet UIImageView *imgF;

/*3*/
@property (weak, nonatomic) IBOutlet UIImageView *im1;

@property (weak, nonatomic) IBOutlet UIImageView *im2;

@property (weak, nonatomic) IBOutlet UIImageView *im3;
@property (weak, nonatomic) IBOutlet UIImageView *im4;
+(instancetype)TableViewCellWith:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath;

- (void)fzGetDataSourseForCell;
@end
