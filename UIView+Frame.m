//
//  UIView+Frame.m
//  点家慧2.0
//
//  Created by app on 17/5/10.
//  Copyright © 2017年 inwhoop.com. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

- (CGFloat)marginX //距离当前对象的 X轴，多少距离
{
    return self.frame.origin.x + self.frame.size.width;
}

- (CGFloat)marginY
{
    return self.frame.origin.y + self.frame.size.height;
}

- (CGFloat)height  //自身的高度
{
    return self.frame.size.height;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (CGFloat)orginX//将对象自身作为，原点
{
    return self.frame.origin.x;
}

- (CGFloat)orginY
{
    return self.frame.origin.y;
}

@end
