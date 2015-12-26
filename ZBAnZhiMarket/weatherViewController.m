//
//  weatherViewController.m
//  ZBAnZhiMarket
//
//  Created by xiongdi on 15/12/12.
//  Copyright (c) 2015年 xiongdi. All rights reserved.
//

#import "weatherViewController.h"

#import "weatherTableViewController.h"

#import "weatherDetailViewController.h"

@interface weatherViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation weatherViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    self.scrollView =[[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64.0f)];
    self.scrollView.contentSize=CGSizeMake([UIScreen mainScreen].bounds.size.width*2, [UIScreen mainScreen].bounds.size.height);
    
    self.scrollView.pagingEnabled=YES;
    self.scrollView.delegate=self;
    
    //设定bounces为no 那么scrollview滚到边界处就不会向左或右继续滚动
    self.scrollView.bounces=NO;
    
    weatherTableViewController *controller=[[weatherTableViewController alloc] initWithNibName:@"weatherTableViewController" bundle:nil];
    controller.view.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.scrollView.frame.size.height);
    [self addChildViewController:controller];
    [self.scrollView addSubview:controller.view];
    
    weatherDetailViewController *detailController=[[weatherDetailViewController alloc] initWithNibName:@"weatherDetailViewController" bundle:nil];
    detailController.view.frame=CGRectMake([UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, self.scrollView.frame.size.height);
    [self addChildViewController:detailController];
    [self.scrollView addSubview:detailController.view];
    
    [self.view addSubview:self.scrollView];
    
}









- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
