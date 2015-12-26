//
//  ReusableView.h
//  ZBAnZhiMarket
//
//  Created by xiongdi on 15/12/1.
//  Copyright (c) 2015年 xiongdi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReusableView : UICollectionReusableView <UIScrollViewDelegate>



@property (nonatomic, strong) NSString *string;

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, strong) UIPageControl *control;

@property (nonatomic, strong) NSMutableArray *URLArray;


@end
