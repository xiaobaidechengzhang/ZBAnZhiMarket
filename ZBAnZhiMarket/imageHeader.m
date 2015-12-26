//
//  imageHeader.m
//  糯米cell和商品详情
//
//  Created by xiongdi on 15/12/24.
//  Copyright (c) 2015年 xiaobai. All rights reserved.
//

#import "imageHeader.h"

@implementation imageHeader

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        UIView *xuanView=[[UIView alloc] initWithFrame:CGRectMake(0, 150, frame.size.width, 50)];
        UILabel *priceLabel=[[UILabel alloc] initWithFrame:CGRectMake(10, 10, 20, 20)];
        priceLabel.text=@"36";
        priceLabel.textColor=[UIColor grayColor];
        self.priceLabel=priceLabel;
        [xuanView addSubview:priceLabel];
        
        UIButton *qiangButton=[[UIButton alloc] initWithFrame:CGRectMake(100, 5, 200, 40)];
        [qiangButton setTitle:@"立即抢购" forState:UIControlStateNormal];
        [qiangButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        qiangButton.backgroundColor=[UIColor purpleColor];
        [xuanView addSubview:qiangButton];
        
        self.XTView=xuanView;

        UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.imageV=imageView;
        [self addSubview:imageView];
        
        self.titleLabel=[[UILabel alloc] initWithFrame:CGRectMake(5, 100, 100, 20)];
        self.titleLabel.textColor=[UIColor whiteColor];
        self.titleLabel.textAlignment=NSTextAlignmentCenter;
        [self addSubview:self.titleLabel];
        
        self.longTitleLabel=[[UILabel alloc] initWithFrame:CGRectMake(5, 120, frame.size.width-10, 30)];
        self.longTitleLabel.numberOfLines=2;
        self.longTitleLabel.textColor=[UIColor whiteColor];
        [self addSubview:self.longTitleLabel];
        
        self.priceLabel=[[UILabel alloc] initWithFrame:CGRectMake(frame.size.width-55, 100, 50, 20)];
        self.priceLabel.textColor=[UIColor whiteColor];
        self.priceLabel.textAlignment=NSTextAlignmentCenter;
        [self addSubview:self.priceLabel];
        
        
        
        
        [self addSubview:self.XTView];
        
    }
    return self;
}

-(void)setImageURL:(NSString *)imageURL
{
    NSString *urlstring=self.imageURL;
    NSURL *URL=[NSURL URLWithString:urlstring];
    NSData *data=[[NSData alloc] initWithContentsOfURL:URL];
    UIImage *image=[[UIImage alloc] initWithData:data];
    self.imageV.image=image;
}



@end
