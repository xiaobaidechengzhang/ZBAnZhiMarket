//
//  districtResult.m
//  ZBAnZhiMarket
//
//  Created by xiongdi on 15/12/11.
//  Copyright (c) 2015年 xiongdi. All rights reserved.
//

#import "districtResult.h"

@implementation districtResult

-(void)setDistrictName:(NSString *)districtName
{
    _districtName=districtName;
    //NSLog(@"_districtName :%@",_districtName);
}

-(void)setDistrictID:(NSString *)districtID
{
    _districtID=districtID;
}

-(void)setBizAreasArray:(NSArray *)bizAreasArray
{
    _bizAreasArray=bizAreasArray;
}

@end
