//
//  DT_HeroVC.h
//  LOL
//
//  Created by mac on 17/8/21.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "BaseForLOL.h"

@interface DT_HeroVC : BaseForLOL<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,retain) UITableView *lastTV;

@end
