//
//  DT_VideoCell.h
//  LOL
//
//  Created by mac on 17/8/23.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLGifImageView.h"
#import "LLGifView.h"

@interface DT_VideoCell : UITableViewCell
@property (nonatomic, retain) LLGifView *gifView;
@property (nonatomic, retain) LLGifImageView *gifImageView;
@end
