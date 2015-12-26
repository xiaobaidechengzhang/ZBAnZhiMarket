//
//  imageHeader.h
//  糯米cell和商品详情
//
//  Created by xiongdi on 15/12/24.
//  Copyright (c) 2015年 xiaobai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface imageHeader : UIView

@property (nonatomic, strong) UIView *XTView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *longTitleLabel;
@property (nonatomic, strong) UILabel *sale_numLabel;
@property (nonatomic, copy) NSString *deal_murl;
@property (nonatomic, copy) NSString *buy_contents;
@property (nonatomic, copy) NSString *consumer_tips;
//@property (nonatomic, copy) NSString *priceTitle;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, copy) NSString *imageURL;

@property (nonatomic, strong) UIImageView *imageV;

@end
