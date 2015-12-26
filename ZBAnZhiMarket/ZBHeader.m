//
//  ZBHeader.m
//  表视图横向滑动
//
//  Created by xiongdi on 15/12/8.
//  Copyright (c) 2015年 xiongdi. All rights reserved.
//

#import "ZBHeader.h"

@implementation ZBHeader

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        UILabel *firstLabel=[[UILabel alloc] initWithFrame:CGRectMake(10, 5, 100, 50)];
        firstLabel.text=@"";
        firstLabel.textAlignment=NSTextAlignmentCenter;
        
        self.leftLabel=firstLabel;
        [self addSubview:firstLabel];
        
        UILabel *scabel=[[UILabel alloc] initWithFrame:CGRectMake(frame.size.width-100, 5, 100, 50)];
        scabel.text=@"More";
        scabel.textAlignment=NSTextAlignmentCenter;
        self.moreLabel=scabel;
        [self addSubview:scabel];
        
        self.contentView.backgroundColor=[UIColor brownColor];
        
        return self;
    }
    return nil;
}

-(void)setLeftString:(NSString *)leftString
{
    _leftString=leftString;
    self.leftLabel.text=_leftString;
}

-(void)setMoreString:(NSString *)moreString
{
    _moreString=moreString;
    self.moreLabel.text=_moreString;
}

@end
