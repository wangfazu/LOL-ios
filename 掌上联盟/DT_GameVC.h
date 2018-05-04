//
//  DT_GameVC.h
//  LOL
//
//  Created by mac on 17/8/21.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "BaseForLOL.h"

@interface DT_GameVC : BaseForLOL<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@property (nonatomic,retain) UITableView *gameTV;
@property (nonatomic,retain) UIScrollView *scroView;


@end
