//
//  ZBTableViewController.m
//  分类下拉菜单
//
//  Created by xiongdi on 15/11/26.
//  Copyright (c) 2015年 xiongdi. All rights reserved.
//

#import "ZBTableViewController.h"

#import "listsCell.h"

#import "detailTableViewController.h"

#import "imageHeader.h"

@interface ZBTableViewController ()

@property (nonatomic,strong) NSMutableArray *listArray;

@property (nonatomic, strong) NSMutableArray *detailArray;

@end

@implementation ZBTableViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *cellNib=[UINib nibWithNibName:@"listsCell" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"cell"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    listsCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    NSString *string=@"http://timg.baidu.com/timg?lbstsm&ref=http%3a%2f%2fbj.nuomi.com&quality=100&size=8&sec=1450586572&di=66e399feef74da48358e578db4c1d0f4&src=http://e.hiphotos.baidu.com/bainuo/wh=720,436/sign=e7883ecfdec451daf6a304ec84cd7e52/fcfaaf51f3deb48f7009074ff31f3a292df5783b.jpg";
    NSURL *URL=[NSURL URLWithString:string];
    NSData *data=[[NSData alloc] initWithContentsOfURL:URL];
    UIImage *image=[[UIImage alloc] initWithData:data];
    cell.imageView.image=image;
    cell.imageView.contentMode=UIViewContentModeScaleAspectFill;
    cell.imageView.clipsToBounds=YES;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    detailTableViewController *controller=[[detailTableViewController alloc] initWithNibName:@"detailTableViewController" bundle:nil];
    controller.view.frame=self.view.bounds;
    [controller initWithTitle:@"222" withLongTitle:@"333" withPriceTitle:@"55" withImageURL:nil withSalenum:@"已售55"];
    
    [self.navigationController pushViewController:controller animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

@end
