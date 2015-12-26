//
//  detailTableViewController.h
//  糯米cell和商品详情
//
//  Created by xiongdi on 15/12/20.
//  Copyright (c) 2015年 xiaobai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class imageHeader;

@interface detailTableViewController : UITableViewController

@property (nonatomic, assign) CGFloat scrollY;

@property (nonatomic, strong) UIView *xuanView;

@property (nonatomic, strong) imageHeader *headerV;

-(void)initWithTitle:(NSString *)titleLabelText withLongTitle:(NSString *)longTitleLabelText withPriceTitle:(NSString *)priceTitleLabelText withImageURL:(NSString *)imageURLString withSalenum:(NSString *)salenum;
-(void)initWithBuyContents:(NSString *)buyContent withTips:(NSString *)consumerTips;


@end
