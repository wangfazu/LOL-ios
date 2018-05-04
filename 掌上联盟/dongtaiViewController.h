//
//  dongtaiViewController.h
//  LOL
//
//  Created by 王发祖 on 2018/5/4.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "BaseForLOL.h"

@interface dongtaiViewController : BaseForLOL<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,retain) UITableView *dongtaiTV;
@property (nonatomic,retain) NSArray *jsonObject;

@end
