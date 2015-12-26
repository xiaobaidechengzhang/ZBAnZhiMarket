//
//  ViewController.m
//  下载页面
//
//  Created by xiongdi on 15/12/8.
//  Copyright (c) 2015年 xiongdi. All rights reserved.
//

#import "downLoadViewController.h"

#import "ZBAppTableViewController.h"


@interface downLoadViewController ()<UIToolbarDelegate>

@end

@implementation downLoadViewController

-(void)touchFirst:(id)sender
{
    
}

-(void)touchSecond:(id)sender
{
    
}

-(void)touchThree:(id)sender
{
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *firstButton=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 44.0f)];
    [firstButton setTitle:@"分享" forState:UIControlStateNormal];
    [firstButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [firstButton addTarget:self action:@selector(touchFirst:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *secondButton=[[UIButton alloc] initWithFrame:CGRectMake(80, 0, [UIScreen mainScreen].bounds.size.width-160, 44.0f)];
    [secondButton setTitle:@"下载" forState:UIControlStateNormal];
    [secondButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [secondButton setBackgroundColor:[UIColor brownColor]];
    [secondButton addTarget:self action:@selector(touchSecond:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *threeButton=[[UIButton alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-80, 0, 80, 44.0f)];
    [threeButton setTitle:@"收藏" forState:UIControlStateNormal];
    [threeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [threeButton addTarget:self action:@selector(touchThree:) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *toolView=[[UIView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-44, [UIScreen mainScreen].bounds.size.width, 44.0)];
    toolView.backgroundColor=[UIColor whiteColor];
    
    [toolView addSubview:firstButton];
    [toolView addSubview:secondButton];
    [toolView addSubview:threeButton];
    
    //[self.view addSubview:toolBar];
    
    NSArray *titleArray=[[NSArray alloc] initWithObjects:@"介绍",@"评论", nil];
    UISegmentedControl *segmentedControl=[[UISegmentedControl alloc] initWithItems:titleArray];
    segmentedControl.frame=CGRectMake(20, 64, [UIScreen mainScreen].bounds.size.width-40.0f, 42.0);
    [self.view addSubview:segmentedControl];
    
    //width设置为self.view.frame.size.width，设置为[UIScreen mainScreen].bounds.size.width会出错 变窄
    ZBAppTableViewController *controller=[[ZBAppTableViewController alloc] initWithNibName:@"ZBAppTableViewController" bundle:nil];
    controller.view.frame=CGRectMake(0, 108, self.view.frame.size.width, [UIScreen mainScreen].bounds.size.height-150);
    [self addChildViewController:controller];
    [self.view addSubview:controller.view];
    
    [self.view addSubview:toolView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
