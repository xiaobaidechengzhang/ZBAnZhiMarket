//
//  listButton.m
//  分类下拉菜单
//
//  Created by xiongdi on 15/12/5.
//  Copyright (c) 2015年 xiongdi. All rights reserved.
//

#import "listButton.h"

@implementation listButton

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        
    }
    return self;
}

-(void)setText:(NSString *)text
{
    _text=text;
    [self setTitle:_text forState:UIControlStateNormal];
}

@end
