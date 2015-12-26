//
//  SCReusableView.m
//  ZBAnZhiMarket
//
//  Created by xiongdi on 15/12/3.
//  Copyright (c) 2015年 xiongdi. All rights reserved.
//

#import "SCReusableView.h"

#import <CoreGraphics/CoreGraphics.h>

@implementation SCReusableView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        self.layer.cornerRadius=0;
        self.layer.borderWidth=1.0f;
        self.layer.borderColor=[UIColor grayColor].CGColor;
        
        UILabel *headerLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 5, 100,frame.size.height-10)];
        headerLabel.backgroundColor=[UIColor blueColor];
        self.label=headerLabel;
        [self addSubview:headerLabel];
    }
    return self;
}

-(void)setString:(NSString *)string
{
    _string=string;
    [self setLabelString];
}

-(void)setLabelString
{
    self.label.text=self.string;
}

@end
