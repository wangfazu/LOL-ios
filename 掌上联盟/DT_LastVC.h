//
//  DT_LastVC.h
//  LOL
//
//  Created by mac on 17/8/21.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "BaseForLOL.h"

@interface DT_LastVC : BaseForLOL<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,retain) UITableView *lastTV;
@property (nonatomic,retain) NSArray *jsonObject;
@property (nonatomic,retain) NSString *urlStr;

@end
