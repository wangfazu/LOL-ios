//
//  FrendsVC.h
//  掌上联盟
//
//  Created by mac on 17/8/18.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "BaseForLOL.h"

@interface FrendsVC : BaseForLOL<UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,retain) UITableView *friendsTV;
@end
