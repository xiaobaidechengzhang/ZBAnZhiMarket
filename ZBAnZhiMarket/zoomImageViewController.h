//
//  zoomImageViewController.h
//  scollImages
//
//  Created by xiongdi on 15/11/7.
//  Copyright (c) 2015年 xiongdi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface zoomImageViewController : UIViewController<UIScrollViewDelegate,UIGestureRecognizerDelegate>

-(instancetype)zoomImage:(NSInteger)index withArray:(NSArray *)imageURLArray;

@end
