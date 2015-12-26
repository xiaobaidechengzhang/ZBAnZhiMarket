//
//  listsCell.h
//  糯米cell和商品详情
//
//  Created by xiongdi on 15/12/20.
//  Copyright (c) 2015年 xiaobai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface listsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceoffLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (nonatomic, copy) NSString *deatID;

@property (nonatomic, strong) NSString *URLString;

@end
