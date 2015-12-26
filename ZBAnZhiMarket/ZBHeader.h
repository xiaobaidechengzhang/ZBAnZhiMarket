//
//  ZBHeader.h
//  表视图横向滑动
//
//  Created by xiongdi on 15/12/8.
//  Copyright (c) 2015年 xiongdi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZBHeader : UITableViewHeaderFooterView

@property (nonatomic, strong) UILabel *leftLabel;

@property (nonatomic, strong) UILabel *moreLabel;

@property (nonatomic, strong) NSString *leftString;

@property (nonatomic, strong) NSString *moreString;

@end
