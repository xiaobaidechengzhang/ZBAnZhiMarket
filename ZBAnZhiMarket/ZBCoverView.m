//
//  ZBCoverView.m
//  ZBAnZhiMarket
//
//  Created by xiongdi on 15/12/19.
//  Copyright (c) 2015年 xiongdi. All rights reserved.
//

#import "ZBCoverView.h"

@implementation ZBCoverView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        self.backgroundColor=[UIColor blackColor];
        self.autoresizingMask=UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        self.alpha=0.6;
    }
    return self;
}

@end
