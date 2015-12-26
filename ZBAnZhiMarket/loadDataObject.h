//
//  loadDataObject.h
//  ZBAnZhiMarket
//
//  Created by xiongdi on 15/12/25.
//  Copyright (c) 2015年 xiongdi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface loadDataObject : NSObject

@property (nonatomic, copy) NSString *catID;

@property (nonatomic, copy) NSString *subcatID;

@property (nonatomic, copy) NSString *districtID;

@property (nonatomic, copy) NSString *bizareaID;

@property (nonatomic, assign) NSNumber *sort;

@property (nonatomic, assign) NSNumber *pageSize;

@end
