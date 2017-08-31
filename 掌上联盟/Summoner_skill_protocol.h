//
//  Summoner_skill_protocol.h
//  LOL
//
//  Created by mac on 17/8/31.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Summoner_skill_protocol <NSObject>
@required//必须
-(void)returnChooseDay:(id)myChooseDayView;
@optional//可选
-(void)hideThisView;
-(void) changeDateFormatter:(NSString*)formatString;


@end
