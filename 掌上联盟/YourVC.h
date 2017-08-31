//
//  YourVC.h
//  LOL
//
//  Created by mac on 17/8/31.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "BaseForLOL.h"
//@protocol DT_YUFooterViewDelegate <NSObject>
//
//- (void)didClickedButton;
//
//@end

@protocol yourDelegate <NSObject>

- (void)fzCreatView;
@end

@interface YourVC : BaseForLOL

@property (assign,nonatomic) id<yourDelegate> delegate;

@end
